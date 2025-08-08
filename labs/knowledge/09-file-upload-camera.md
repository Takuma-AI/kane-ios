# File Upload & Camera - Platform APIs & Rails Integration

## Core Principle
File upload and camera functionality perfectly demonstrate Hotwire Native's philosophy: use platform APIs to enhance Rails file processing, not replace it. The iOS app provides access to the camera and photo library through bridge components, but Rails handles all file validation, processing, and storage.

Think of it like this: The camera is just a fancy `<input type="file">`. The iOS code captures the photo, but Rails does everything else—validation, resizing, storing, displaying. This keeps your logic in one place and your iOS code minimal.

## Understanding the File Flow

When a user takes a photo in your iOS app, here's what happens:

1. **User taps camera button** → Your Rails form has a button that triggers a bridge component
2. **iOS camera opens** → Native camera interface appears
3. **User takes photo** → iOS captures the image
4. **Photo converts to base64** → Bridge component encodes the image for web transfer
5. **JavaScript receives data** → Creates a File object just like a web upload
6. **Form submits normally** → Rails receives the file like any other upload
7. **Rails processes file** → Active Storage handles it normally

The beauty is that your Rails code doesn't change at all. It still uses Active Storage, still validates files, still processes images. The only difference is where the file came from.

## Complete Camera Implementation

Let's build this step by step. First, I'll show you the iOS side (which you'll copy-paste), then the Rails side (which you'll understand and modify).

### 1. The iOS Camera Component

This looks like a lot of code, but it's mostly boilerplate for handling iOS permissions and camera access. You don't need to understand it all—just know it creates a camera button in your Rails forms.

```swift
// App/BridgeComponents/CameraComponent.swift
import UIKit
import AVFoundation
import Photos

class CameraComponent: BridgeComponent {
    // This name MUST match your JavaScript controller
    override class var name: String { "camera" }
    
    private var imagePickerController: UIImagePickerController?
    
    // These control image quality and size
    private var compressionQuality: CGFloat = 0.8  // 80% quality
    private var maxImageSize: CGFloat = 2048       // Max 2048x2048 pixels
    
    override func onReceive(message: Message) {
        // Parse the configuration from Rails
        guard let data: CameraData = message.data() else { return }
        
        // Handle different events from JavaScript
        switch message.event {
        case "requestCamera":
            setupCameraConfiguration(data)
            presentCamera()
            
        case "requestPhotoLibrary":
            setupCameraConfiguration(data)
            presentPhotoLibrary()
            
        case "requestDocument":
            presentDocumentPicker()
            
        default:
            break
        }
    }
    
    // Update settings from Rails
    private func setupCameraConfiguration(_ data: CameraData) {
        compressionQuality = CGFloat(data.quality ?? 0.8)
        maxImageSize = CGFloat(data.maxSize ?? 2048)
    }
    
    // Show the camera
    private func presentCamera() {
        // Check if device has camera
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            sendError("Camera not available")
            return
        }
        
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true  // Let user crop/adjust
        picker.delegate = self
        
        imagePickerController = picker
        delegate?.destination.present(picker, animated: true)
    }
    
    // Show photo library
    private func presentPhotoLibrary() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        
        imagePickerController = picker
        delegate?.destination.present(picker, animated: true)
    }
    
    // The rest is handling the photo after it's taken...
}
```

I'll spare you the rest of the iOS code for now. The important part is that it:
- Opens the camera when JavaScript asks
- Lets the user take or choose a photo
- Converts the photo to base64 text
- Sends it back to your Rails form

### 2. The Rails Side - What You Actually Work With

Now for the part you care about! Here's how to add camera functionality to any Rails form:

```erb
<!-- app/views/resources/_form.html.erb -->
<%= form_with model: resource, 
              html: { multipart: true },
              data: { 
                controller: "bridge--camera",
                bridge_camera_quality: "0.8",
                bridge_camera_max_size: "2048"
              } do |form| %>
  
  <div class="form-group">
    <%= form.label :name %>
    <%= form.text_field :name, class: "form-control" %>
  </div>
  
  <!-- Here's the magic part -->
  <div class="form-group">
    <%= form.label :photo, "Add Photo" %>
    
    <!-- Hidden file input that will receive the photo -->
    <%= form.file_field :photo, 
                       class: "d-none",
                       data: { bridge_camera_target: "input" } %>
    
    <% if hotwire_native_app? %>
      <!-- Native app gets camera buttons -->
      <div class="camera-buttons">
        <button type="button" 
                class="btn btn-primary"
                data-action="click->bridge--camera#openCamera">
          📷 Take Photo
        </button>
        
        <button type="button" 
                class="btn btn-secondary"
                data-action="click->bridge--camera#openPhotoLibrary">
          🖼️ Choose from Library
        </button>
      </div>
    <% else %>
      <!-- Web users get standard file input -->
      <label for="<%= form.field_id(:photo) %>" class="btn btn-primary">
        Choose Photo
      </label>
    <% end %>
    
    <!-- Preview area shows the selected photo -->
    <div class="photo-preview mt-3" 
         data-bridge-camera-target="preview" 
         style="display: none;">
    </div>
  </div>
  
  <%= form.submit "Save", class: "btn btn-success" %>
<% end %>
```

**What's happening here:**
- The form has `data-controller="bridge--camera"` to enable the camera bridge
- A hidden file input receives the photo (just like a web upload)
- Native apps see camera buttons, web users see a file picker
- The preview area shows the photo after selection

### 3. The JavaScript Bridge

This is the glue between your Rails form and the iOS camera. It's a Stimulus controller that manages the communication:

```javascript
// app/javascript/controllers/bridge/camera_controller.js
import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "camera"
  static targets = ["input", "preview"]
  
  connect() {
    super.connect()
    console.log("Camera bridge connected:", this.enabled)
  }
  
  // User tapped "Take Photo"
  openCamera() {
    console.log("Opening camera...")
    this.send("requestCamera", {
      quality: this.data.get("quality") || "0.8",
      maxSize: this.data.get("maxSize") || "2048"
    })
  }
  
  // User tapped "Choose from Library"  
  openPhotoLibrary() {
    console.log("Opening photo library...")
    this.send("requestPhotoLibrary", {
      quality: this.data.get("quality") || "0.8",
      maxSize: this.data.get("maxSize") || "2048"
    })
  }
  
  // iOS sends back the photo
  fileSelected(data) {
    console.log("Photo received from iOS:", data.size, "bytes")
    
    // Convert base64 to a File object
    this.createFileFromBase64(data)
      .then(file => {
        // Put the file in our hidden input
        this.updateFileInput(file)
        
        // Show a preview
        this.showPreview(file, data)
      })
      .catch(error => {
        console.error("Failed to process photo:", error)
        this.showError("Failed to process photo")
      })
  }
  
  // Convert base64 string to File object
  async createFileFromBase64(data) {
    // Decode the base64 string
    const byteCharacters = atob(data.base64)
    const byteNumbers = new Array(byteCharacters.length)
    
    for (let i = 0; i < byteCharacters.length; i++) {
      byteNumbers[i] = byteCharacters.charCodeAt(i)
    }
    
    const byteArray = new Uint8Array(byteNumbers)
    const blob = new Blob([byteArray], { type: data.mimeType })
    
    // Create a File object that Rails will understand
    return new File([blob], data.filename, { 
      type: data.mimeType,
      lastModified: Date.now()
    })
  }
  
  // Update the hidden file input
  updateFileInput(file) {
    // Create a FileList with our file
    const dataTransfer = new DataTransfer()
    dataTransfer.items.add(file)
    
    // Set it on the input
    this.inputTarget.files = dataTransfer.files
    
    // Trigger change event so Rails forms know
    this.inputTarget.dispatchEvent(new Event('change', { bubbles: true }))
  }
  
  // Show a preview of the selected photo
  showPreview(file, data) {
    // Create an image element
    const img = document.createElement('img')
    img.src = `data:${data.mimeType};base64,${data.base64}`
    img.className = 'img-thumbnail'
    img.style.maxWidth = '200px'
    
    // Clear and show preview
    this.previewTarget.innerHTML = ''
    this.previewTarget.appendChild(img)
    this.previewTarget.style.display = 'block'
  }
}
```

### 4. Your Rails Model - Business as Usual

The beautiful part? Your Rails model doesn't change at all:

```ruby
# app/models/resource.rb
class Resource < ApplicationRecord
  has_one_attached :photo
  
  validates :name, presence: true
  validate :photo_format_validation
  
  private
  
  def photo_format_validation
    return unless photo.attached?
    
    unless photo.blob.content_type.in?(%w[image/jpeg image/png])
      errors.add(:photo, 'must be a JPEG or PNG')
    end
    
    if photo.blob.byte_size > 10.megabytes
      errors.add(:photo, 'is too large (max 10MB)')
    end
  end
end
```

Your controller is standard too:

```ruby
# app/controllers/resources_controller.rb
class ResourcesController < ApplicationController
  def create
    @resource = current_user.resources.build(resource_params)
    
    if @resource.save
      # Photo is automatically processed by Active Storage
      redirect_to @resource, notice: 'Resource created!'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def resource_params
    params.require(:resource).permit(:name, :description, :photo)
  end
end
```

## How It All Works Together

Let me trace through what happens when a user takes a photo:

1. **User taps "Take Photo"** 
   - JavaScript calls `openCamera()`
   - Sends message to iOS: "requestCamera"

2. **iOS opens camera**
   - Camera component receives message
   - Shows native camera interface
   - User takes photo

3. **Photo is processed**
   - iOS resizes if needed (respecting your max size)
   - Compresses to JPEG (using your quality setting)
   - Converts to base64 text

4. **Photo sent to JavaScript**
   - Bridge sends "fileSelected" message
   - Includes base64 data, filename, size

5. **JavaScript updates form**
   - Converts base64 back to File object
   - Places in hidden file input
   - Shows preview to user

6. **Form submits normally**
   - Rails receives file in `params[:resource][:photo]`
   - Active Storage handles upload
   - Your validations run
   - File saved to storage

The user experience is native (real iOS camera), but the developer experience is pure Rails (Active Storage, validations, etc.).

## Common Patterns

### Multiple File Selection

Want users to select multiple photos? Just change your file input:

```erb
<%= form.file_field :photos, 
                   multiple: true,
                   class: "d-none",
                   data: { bridge_camera_target: "input" } %>
```

And update your model:

```ruby
has_many_attached :photos
```

### Different Quality Settings

Let users choose photo quality:

```erb
<div data-controller="bridge--camera"
     data-bridge-camera-quality="<%= current_user.prefers_high_quality? ? '1.0' : '0.6' %>"
     data-bridge-camera-max-size="<%= current_user.prefers_high_quality? ? '4096' : '1024' %>">
```

### Processing After Upload

Use Active Storage variants for different sizes:

```ruby
class Resource < ApplicationRecord
  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 150]
    attachable.variant :medium, resize_to_limit: [800, 600]
  end
end
```

Display them in your views:

```erb
<%= image_tag resource.photo.variant(:thumb), class: "thumbnail" %>
```

## Testing Your Implementation

### Quick Manual Test

1. In your iOS simulator, navigate to a form with camera buttons
2. Click "Take Photo" - the camera should open
3. Take a photo (simulator shows a default image)
4. See the preview appear in your form
5. Submit the form
6. Verify the photo saved correctly

### Rails System Test

```ruby
# test/system/photo_upload_test.rb
test "uploading photo through form" do
  sign_in users(:alice)
  
  visit new_resource_path
  
  fill_in "Name", with: "Test Resource"
  
  # Simulate file upload (works for both web and native)
  attach_file "resource[photo]", 
              Rails.root.join("test/fixtures/files/test.jpg")
  
  click_button "Save"
  
  assert_text "Resource created!"
  assert Resource.last.photo.attached?
end
```

## Common Issues and Solutions

### "Camera not available"
- You're in the iOS simulator. Use device or photo library instead.

### Photo doesn't appear in form
- Check JavaScript console for errors
- Verify bridge component is registered in SceneDelegate
- Make sure Stimulus controller is loaded

### Photo too large errors
- Adjust quality and maxSize settings
- Add client-side validation before upload
- Show upload progress for large files

## Key Takeaways

1. **Rails handles everything** - The iOS code just captures the photo
2. **Standard Active Storage** - Your Rails code doesn't change
3. **Progressive enhancement** - Works without native features
4. **Base64 transfer** - How photos move from native to web
5. **File inputs still work** - It's just a fancy file picker

Remember: The camera is just another way to fill a file input. Rails doesn't know or care where the file came from. This keeps your application logic simple and your iOS code minimal.