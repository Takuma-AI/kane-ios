# Day 1: Getting Started with Your Chef Portal

*Instructions for Chef Austin*

## What to Expect in Today's Session (2 hours)

### Part 1: Finding the Message (30 minutes)
We'll start by figuring out what you want to tell your chefs:
- What problem are you solving for them?
- What's the ONE thing they need to know?
- How would you explain this in a text message to a chef?

We'll refine this down to a single paragraph - the core message.

### Part 2: Your First HTML Page (30 minutes)
You'll create your first webpage by:
1. **Creating a new file** called `index.html` using your file explorer
2. **Pasting your message** into that file
3. **Opening it in your browser** to see your words on a webpage
4. **Understanding** that a website is just a file on a computer

This is the fundamental concept - HTML files become webpages.

### Part 3: Making It Look Professional (45 minutes)
Once you see your message in the browser, we'll make it look good:
- Claude will ask about your style preferences
- You'll describe how you want it to look
- We'll add `style.css` to make it beautiful
- Maybe add `script.js` for a small interactive touch

You're not coding - you're directing Claude to build what you envision.

### Part 4: Going Live on the Internet (15 minutes)
Finally, we'll deploy to Render:
- Push your files to GitHub
- Connect to Render
- Watch your local file become a real website
- Share the link with your team

This isn't about learning to code. It's about understanding how the web works.

## Claude Code Installation & Repository Access

### Step 1: Install Claude Code (Windows via WSL)

Claude Code is the AI assistant that will help you build. Here's how to get it running:

1. **Open PowerShell as Administrator** (right-click → Run as Administrator)

2. **Install WSL if you haven't already:**
   ```powershell
   wsl --install
   ```
   Restart your computer after this completes.

3. **Open Ubuntu** (it's now in your Start menu)

4. **Install Claude Code in Ubuntu:**
   ```bash
   npm install -g @anthropic-ai/claude-code
   ```

5. **Authenticate Claude Code:**
   ```bash
   claude auth
   ```
   Follow the prompts to log in with your Anthropic account.

### Step 2: Access the Repository

The EPC OS repository contains all the instructions and context Claude needs to help you build effectively.

1. **Clone the repository in Ubuntu:**
   ```bash
   cd ~
   git clone [repository-url-will-be-provided]
   cd epc-os
   ```

### Step 3: Start Claude Code (IMPORTANT)

1. **Close Cursor if it's open** - We won't be using the Cursor app today

2. **Open your terminal** (Ubuntu/WSL terminal on Windows)

3. **Navigate to the project folder:**
   ```bash
   cd ~/epc-os
   ```

4. **Start Claude Code by typing:**
   ```bash
   claude
   ```

5. **Make the interface more readable:**
   - Once Claude starts, you'll see a text interface
   - You can scroll up to see Claude's responses better
   - On Windows Terminal: Use your mouse wheel or Shift+PageUp
   - The terminal remembers everything - scroll up anytime to review

6. **Verify it's working:**
   Type: "hello"
   
   Claude should immediately start guiding you through building your announcement page.

### What You DON'T Need to Prepare

- No need to learn HTML/CSS beforehand
- No need to set up hosting accounts yet
- No need to prepare designs or copy
- No need to have technical experience

### What You SHOULD Bring

- Your laptop with WSL and Claude Code installed
- Knowledge of your current payment process and its pain points
- Specific examples of when payment collection has gone wrong
- Names of 2-3 chefs who would test the portal

## Session Logistics

**Duration:** 90 minutes
**Format:** Screen sharing with guidance
**Outcome:** 
- Clear understanding of the problem we're solving
- Paper sketches of the solution
- Live landing page announcing the portal

## Remember

This isn't about becoming a programmer. It's about learning to think like a builder. You already know your business better than anyone. We're just giving you new tools to shape it.

The hardest part isn't the technology - it's developing the discipline to ship something real, get feedback, and improve.

See you in the session!

---

*"Make it work, make it right, make it fast - in that order."*