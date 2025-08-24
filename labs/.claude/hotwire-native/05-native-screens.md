# Native Screens - SwiftUI Integration with Path Configuration

## Core Principle
Native screens completely replace web views for specific URLs. They're triggered via path configuration and NavigatorDelegate working together. Rails tells iOS which view controller to use, NavigatorDelegate creates the actual instance.

## The Pattern: Path Configuration + NavigatorDelegate

### 1. Rails Path Configuration
```ruby
# app/controllers/configurations_controller.rb
def ios_v1
  render json: {
    settings: {},
    rules: [
      {
        patterns: ["/hikes/\\d+/map$"],
        properties: {
          view_controller: "map"  # Identifies native screen
        }
      },
      # Other rules...
    ]
  }
end
```

### 2. NavigatorDelegate Implementation
```swift
// App/Delegates/SceneDelegate.swift
extension SceneDelegate: NavigatorDelegate {
    func handle(
        proposal: VisitProposal,
        from navigator: Navigator
    ) -> ProposalResult {
        // Check if path config specified a view controller
        switch proposal.viewController {
        case "map": 
            return .acceptCustom(MapController(url: proposal.url))
        default:
            return .accept  // Use default web view
        }
    }
}
```

### 3. ProposalResult Options
- `.accept` - Use default web view (most URLs)
- `.acceptCustom(UIViewController)` - Use your custom native view controller
- `.reject` - Cancel navigation entirely

## Native Screen Implementation Pattern

## When to Use Native Screens

### Good Candidates
- Camera/photo capture interfaces
- Maps with real-time location
- AR/VR experiences
- Complex gestures (pinch/zoom/rotate)
- Platform-specific UI (share sheets, pickers)

### Poor Candidates
- Forms (use Rails)
- Lists (use Rails)
- Content displays (use Rails)
- Anything that could be HTML

## Complete Native Screen Implementation

### 1. Create the SwiftUI View

**In Xcode:**
1. Right-click the "Views" folder (create it if needed under App/)
2. New File → SwiftUI View
3. Name it "CameraView.swift"
4. Make sure it's saved in the Views group

```swift
// App/Views/CameraView.swift
import SwiftUI
import AVFoundation

struct CameraView: View {
    @StateObject private var camera = CameraModel()
    @Environment(\.dismiss) private var dismiss
    
    // Callback to Rails
    let onCapture: (UIImage) -> Void
    
    var body: some View {
        ZStack {
            // Camera preview
            CameraPreview(camera: camera)
                .ignoresSafeArea()
            
            // Controls overlay
            VStack {
                // Top bar
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.white)
                    .padding()
                    
                    Spacer()
                }
                
                Spacer()
                
                // Capture button
                Button(action: capturePhoto) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 70, height: 70)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .frame(width: 80, height: 80)
                        )
                }
                .padding(.bottom, 30)
            }
        }
        .onAppear {
            camera.requestAccess()
        }
    }
    
    private func capturePhoto() {
        camera.capturePhoto { image in
            onCapture(image)
            dismiss()
        }
    }
}

// Camera model handling AVFoundation
class CameraModel: NSObject, ObservableObject {
    @Published var isAuthorized = false
    private let session = AVCaptureSession()
    private let output = AVCapturePhotoOutput()
    private var captureCompletion: ((UIImage) -> Void)?
    
    func requestAccess() {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                self.isAuthorized = granted
                if granted {
                    self.setupCamera()
                }
            }
        }
    }
    
    private func setupCamera() {
        session.beginConfiguration()
        
        // Add camera input
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
              let input = try? AVCaptureDeviceInput(device: device) else { return }
        
        if session.canAddInput(input) {
            session.addInput(input)
        }
        
        // Add photo output
        if session.canAddOutput(output) {
            session.addOutput(output)
        }
        
        session.commitConfiguration()
        
        // Start session on background queue
        DispatchQueue.global(qos: .userInitiated).async {
            self.session.startRunning()
        }
    }
    
    func capturePhoto(completion: @escaping (UIImage) -> Void) {
        captureCompletion = completion
        
        let settings = AVCapturePhotoSettings()
        output.capturePhoto(with: settings, delegate: self)
    }
}

// Photo capture delegate
extension CameraModel: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation(),
              let image = UIImage(data: data) else { return }
        
        DispatchQueue.main.async {
            self.captureCompletion?(image)
        }
    }
}

// Camera preview view
struct CameraPreview: UIViewRepresentable {
    let camera: CameraModel
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: camera.session)
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if let layer = uiView.layer.sublayers?.first as? AVCaptureVideoPreviewLayer {
            layer.frame = uiView.bounds
        }
    }
}
```

### 2. Create the View Controller

```swift
// App/ViewControllers/CameraViewController.swift
import UIKit
import SwiftUI
import HotwireNative

class CameraViewController: UIHostingController<CameraView>, PathConfigurationIdentifiable {
    // REQUIRED: Match the path configuration
    static var pathConfigurationIdentifier: String { "camera" }
    
    // Store the navigator for navigation
    weak var navigator: Navigator?
    
    init(url: URL, navigator: Navigator?) {
        self.navigator = navigator
        
        // Create SwiftUI view with callback
        let cameraView = CameraView { [weak self] image in
            self?.handleCapturedImage(image)
        }
        
        super.init(rootView: cameraView)
        self.url = url
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var url: URL?
    
    private func handleCapturedImage(_ image: UIImage) {
        // Convert image to base64
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
        let base64String = imageData.base64EncodedString()
        
        // Navigate back to Rails with the image data
        if var components = URLComponents(url: url!, resolvingAgainstBaseURL: false) {
            components.queryItems = [
                URLQueryItem(name: "image_data", value: base64String),
                URLQueryItem(name: "captured", value: "true")
            ]
            
            if let resultURL = components.url {
                navigator?.navigate(to: resultURL, action: .replace)
            }
        }
    }
}
```

### 3. Register in Path Configuration

```ruby
# app/controllers/configurations_controller.rb
def native_screen_rules
  [
    {
      patterns: ["/camera$"],
      properties: {
        # This tells Hotwire Native to use native screen
        view_controller: "CameraViewController",
        title: "Take Photo"
      }
    },
    {
      patterns: ["/map$"],
      properties: {
        view_controller: "MapViewController",
        pull_to_refresh: false
      }
    }
  ]
end
```

### 4. Update SceneDelegate to Handle Native Screens

```swift
// App/Delegates/SceneDelegate.swift
import UIKit
import HotwireNative

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // ... existing code ...
    
    private lazy var navigator = Navigator(
        configuration: Configuration(
            name: "main",
            startLocation: baseURL,
            pathConfigurationURL: baseURL.appending(path: "/configurations/ios-v1.json")
        ),
        bridgeComponents: [
            FormComponent.self,
            MenuComponent.self
        ],
        // REGISTER NATIVE SCREENS HERE
        visitableFactory: { url, properties in
            // Check if this URL needs a native screen
            if let viewController = properties["view_controller"] as? String {
                return self.createNativeScreen(for: viewController, url: url)
            }
            
            // Default to web view
            return VisitableViewController(url: url)
        }
    )
    
    private func createNativeScreen(for identifier: String, url: URL) -> UIViewController {
        switch identifier {
        case "CameraViewController":
            return CameraViewController(url: url, navigator: navigator)
        case "MapViewController":
            return MapViewController(url: url, navigator: navigator)
        default:
            // Fallback to web view
            return VisitableViewController(url: url)
        }
    }
}
```

### 5. Rails Integration

```ruby
# app/controllers/camera_controller.rb
class CameraController < ApplicationController
  def show
    # This renders for web fallback
    # Native app will show CameraViewController instead
  end
  
  def process_capture
    if params[:captured] == "true" && params[:image_data].present?
      # Decode base64 image
      image_data = Base64.decode64(params[:image_data])
      
      # Create Active Storage attachment
      @photo = current_user.photos.build
      @photo.image.attach(
        io: StringIO.new(image_data),
        filename: "capture-#{Time.current.to_i}.jpg",
        content_type: "image/jpeg"
      )
      
      if @photo.save
        redirect_to photo_path(@photo), notice: "Photo captured!"
      else
        redirect_to camera_path, alert: "Failed to save photo"
      end
    else
      # Show camera interface (web fallback)
      render :show
    end
  end
end
```

```erb
<!-- app/views/camera/show.html.erb -->
<!-- Web fallback when not in native app -->
<div class="camera-fallback">
  <h1>Take Photo</h1>
  
  <% if hotwire_native_app? %>
    <p>Loading camera...</p>
  <% else %>
    <%= form_with url: process_capture_camera_path, multipart: true do |form| %>
      <%= form.file_field :image, accept: "image/*", capture: "camera" %>
      <%= form.submit "Upload Photo", class: "btn btn-primary" %>
    <% end %>
  <% end %>
</div>
```

## Map Screen Example

```swift
// App/Views/MapView.swift
import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    let locations: [LocationPin]
    let onLocationSelected: (LocationPin) -> Void
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            MapAnnotation(coordinate: location.coordinate) {
                Button(action: { onLocationSelected(location) }) {
                    VStack {
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.red)
                        Text(location.title)
                            .font(.caption)
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct LocationPin: Identifiable {
    let id = UUID()
    let title: String
    let coordinate: CLLocationCoordinate2D
    let resourceId: Int
}
```

## Data Loading Patterns

### From Rails to Native Screen
```ruby
# Pass data through URL parameters or path configuration
{
  patterns: ["/resources/(\\d+)/map$"],
  properties: {
    view_controller: "MapViewController",
    # Can pass simple data here
    initial_zoom: 0.05
  }
}
```

### From Native Screen to Rails
```swift
// Navigate back with results
private func sendResultToRails(selectedId: Int) {
    guard var components = URLComponents(url: url!, resolvingAgainstBaseURL: false) else { return }
    
    components.queryItems = [
        URLQueryItem(name: "selected_id", value: String(selectedId)),
        URLQueryItem(name: "action", value: "selected")
    ]
    
    if let resultURL = components.url {
        navigator?.navigate(to: resultURL, action: .replace)
    }
}
```

## Testing Native Screens

```swift
// Tests/NativeScreenTests.swift
class CameraViewControllerTests: XCTestCase {
    func testCameraScreenCreation() {
        let url = URL(string: "https://example.com/camera")!
        let navigator = Navigator(configuration: .init(name: "test", startLocation: url))
        
        let viewController = CameraViewController(url: url, navigator: navigator)
        
        XCTAssertNotNil(viewController)
        XCTAssertEqual(CameraViewController.pathConfigurationIdentifier, "camera")
    }
}
```

## Common Mistakes to Avoid

### ❌ Don't Overuse Native Screens
```ruby
# Wrong - This should be a web view
{
  patterns: ["/profile$"],
  properties: { view_controller: "ProfileViewController" }
}
```

### ✅ Use Web Views for Content
```ruby
# Right - Let Rails handle content
{
  patterns: ["/profile$"],
  properties: { presentation: "push" }
}
```

### ❌ Don't Store Business Logic
```swift
// Wrong - Business logic in native
class ProfileViewController: UIViewController {
    func calculateUserScore() { /* ... */ }
}
```

### ✅ Keep Logic in Rails
```ruby
# Right - Logic stays in Rails
class User < ApplicationRecord
  def calculate_score
    # Business logic here
  end
end
```

## Remember

- Native screens are for platform features, not content
- Always provide web fallbacks
- Pass data through URLs, not stored state
- Test both native and web paths
- Keep native screens focused and minimal
- When in doubt, use a web view