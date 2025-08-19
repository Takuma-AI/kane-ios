# Day 01 Afternoon: Claude Code Setup

We're installing Claude Code - your AI sous chef for writing code. Think of it as having a skilled developer sitting next to you, ready to help.

## What is a Terminal?

The terminal is like texting with your computer. Instead of clicking buttons, you type commands and hit Enter. Each command is like sending a text message that tells your computer what to do.

Example: When you type `ls` and hit Enter, your computer lists all files in the current folder. Just like asking "what's in this drawer?"

## Step 1: Install Node.js (Required First)

Claude Code needs Node.js to run, like how a gas stove needs a gas line.

### For Mac (Chef):
1. Open Safari and go to: https://nodejs.org
2. Click the big green button that says "LTS" (Long Term Support)
3. Download will start automatically
4. Open your Downloads folder and double-click the .pkg file
5. Follow the installer - just keep clicking "Continue" and "Install"
6. Enter your Mac password when asked

### For Windows (Lee):
1. Open Chrome and go to: https://nodejs.org  
2. Click the big green button that says "LTS" (Long Term Support)
3. Download the Windows Installer (.msi)
4. Double-click the downloaded file
5. Follow the installer - accept all defaults
6. **Important**: Check the box that says "Automatically install necessary tools"

## Step 2: Open Your Terminal

### For Mac:
1. Press Command + Space (opens Spotlight)
2. Type "Terminal"
3. Press Enter
4. A black or white window appears - this is your terminal

### For Windows:
1. Press Windows key
2. Type "PowerShell" 
3. Click "Windows PowerShell" (not ISE)
4. A blue window appears - this is your terminal

## Step 3: Verify Node.js Installed

In your terminal, type exactly (then press Enter):
```
node --version
```

You should see something like `v20.11.0` - any number starting with 18 or higher is good.

If you see an error, Node.js didn't install correctly. Let me know.

## Step 4: Install Claude Code

In the same terminal window, type this command and press Enter:

```
npm install -g claude-code
```

What's happening: 
- `npm` = Node Package Manager (like an app store for developers)
- `install` = download and set up
- `-g` = globally (available everywhere on your computer)
- `claude-code` = the tool we're installing

Wait for it to finish (you'll see text scrolling - that's normal).

## Step 5: Start Claude Code

Type and press Enter:
```
claude-code
```

A browser window will open. This is Claude Code's interface.

## Step 6: Connect to Cursor

1. In Cursor, open any project folder
2. In Claude Code (the browser), it will detect Cursor automatically
3. You can now ask Claude to help with your code

## Terminal Tips for Beginners

- **Each line is a separate command** - press Enter after each one
- **Case matters** - `NPM` is different from `npm`  
- **Spaces matter** - `npm install` not `npminstall`
- **Up arrow** recalls your last command (like redial on a phone)
- **Tab key** autocompletes file names (start typing, hit Tab)
- **Control+C** stops any running command (your escape button)

## If You Get Stuck

Common issues:

**"command not found"** = Either typo or software not installed yet

**"permission denied"** = On Mac, add `sudo` before the command and enter your password

**Terminal seems frozen** = Press Control+C to get back to normal

## Ready Check

You'll know it's working when:
1. `node --version` shows a number
2. `claude-code` opens a browser window
3. Claude Code shows "Connected to Cursor" 

See you at 2pm. We'll do this together, but now you have a reference guide.