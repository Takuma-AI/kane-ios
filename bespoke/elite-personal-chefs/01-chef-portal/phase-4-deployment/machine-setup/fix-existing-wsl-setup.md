# WSL Setup - Plain English Guide

## What's Actually Wrong

You've already done the hard part - WSL is installed and working! The problem is your project files are in the wrong place. They're sitting in Windows (like `C:\Users\YourName\...`) and WSL is trying to access them across two different computer systems. That's why everything is slow and broken.

Think of it like this: You have two computers in one laptop - Windows and Linux. Right now your files are on the Windows side but you're trying to work on them from the Linux side. That's the entire problem.

## The Fix (15 minutes)

### Important: Start Fresh from PowerShell

**Close Cursor completely first.** We're going to set up a fresh copy in the right place, then open that. This avoids confusion about which files you're looking at.

### Step 1: Open PowerShell and Enter WSL

Open a fresh PowerShell window (not in Cursor, just PowerShell by itself):

```bash
wsl
```

You'll see your prompt change from `PS C:\>` to something like `yourname@laptop:~$`. Good! You're now in Linux.

### Step 2: Create Your Projects Folder in Linux

```bash
cd ~
mkdir projects
cd projects
```

**What this does:** Makes a folder called "projects" in your Linux home directory. This is where ALL your code will live from now on.

### Step 3: Clone Your Project Fresh in the Right Place

```bash
git clone https://github.com/Elite-Personal-Chefs/epc-booking.git
cd epc-booking
```

**What this does:** Downloads a fresh copy of your project into Linux (not Windows). 

**About GitHub login:** 
- If the repository is public, it will just download without asking for login
- If it's private, GitHub will ask for your username and password
- For the password, you'll need to use a Personal Access Token (not your regular password)
- If it asks for authentication, see "GitHub Authentication" in Common Questions below

### Step 4: Install Your Project Dependencies

```bash
bundle install
```

**What this does:** Installs all the Ruby gems your project needs. This should work smoothly now because you're in Linux where these tools expect to be.

### Step 5: Test It Works

```bash
rails server
```

Open your browser and go to `http://localhost:3000`. It should work! Press `Ctrl+C` to stop the server.

### Step 6: NOW Open This New Copy in Cursor

1. Open Cursor (fresh, not with any project open)
2. Click "File" → "Open Folder"
3. In the address bar, type exactly: `\\wsl$\Ubuntu\home\[your-linux-username]\projects\epc-booking`

   - Replace `[your-linux-username]` with the username you created when setting up WSL

**What this does:** Opens the Linux copy of your project (the one that actually works), not the broken Windows copy.

## What About Your Old Project Files?

You can delete the old project folder in Windows (the one in `C:\Users\...`). You don't need it anymore. All your work is on GitHub, so cloning fresh is safer than trying to move files around.

## Daily Workflow Going Forward

1. **Open Cursor**
2. **Terminal automatically opens in WSL** (you'll see the Linux prompt)
3. **Navigate to your project:** `cd ~/projects/elite-personal-chefs`
4. **Start server:** `rails server` or `bin/dev`
5. **Edit files in Cursor, test in browser**

## Why This Works Now

- **Before:** Files in Windows → WSL reading across systems → 20x slower + permission errors
- **After:** Files in Linux → WSL reading native files → Fast and correct

## Common Questions

**Q: Do I need to type `wsl` every time?**

A: No! When you open terminal in Cursor with your project open, it automatically uses WSL.

**Q: What about my .env file and credentials?**

A: Create a new `.env` file in the Linux project folder. The Windows one won't carry over.

**Q: Can I see these Linux files in Windows Explorer?**

A: Yes! Type `\\wsl$\Ubuntu` in Windows Explorer to browse Linux files. But don't edit them there - always use Cursor.

**Q: The server says address already in use?**

A: The old server is still running. In a new terminal: `lsof -i :3000` then `kill -9 [the-PID-number]`

**Q: GitHub asks for authentication?**

A: If the repository is private, you'll need:
1. Your GitHub username (not email)
2. A Personal Access Token as the password (not your regular password)
3. To create a token: GitHub → Settings → Developer settings → Personal access tokens → Generate new token
4. Give it "repo" permissions and save the token somewhere safe

## One Golden Rule

**ALL code lives in Linux (`~/projects/`), NEVER in Windows (`C:\`)**

Break this rule and you're back to the 2-hour nightmare. Follow it and everything just works.

## You're 90% Done!

You already have:

- ✅ WSL installed
- ✅ Ubuntu set up
- ✅ Ruby installed
- ✅ Rails working

You just need to:

- ✅ Move your project to the right place (this guide)
- ✅ Tell Cursor where to find it
- ✅ Never put code in Windows again

That's it. No Docker, no complex configs, no more troubleshooting. Just use WSL properly and it works.