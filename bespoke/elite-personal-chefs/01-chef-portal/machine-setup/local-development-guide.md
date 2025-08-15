# Moving to Local Development with Cursor

Time to level up! Here's how to set up your development environment locally.

## ⚠️ Critical Update for Windows Users

**The native Windows Ruby approach has proven unreliable for Rails development.**

After extensive troubleshooting, we've documented that Rails on native Windows encounters:
- SQLite3 native extension failures
- Permission conflicts
- Line ending issues (CRLF vs LF)
- Build tool incompatibilities

**Solution**: Use WSL2 (Windows Subsystem for Linux)

See `windows-wsl2-setup-guide.md` for the battle-tested setup that actually works.

---

## For Mac/Linux Users

### 1. Download Cursor

Visit cursor.com and download the appropriate version for your OS.

### 2. Clone Your Repository

Open Cursor and clone your repository:
- Click File → Open Folder
- Choose "Clone Git Repository"
- Paste your repository URL: `https://github.com/[your-username]/elite-personal-chefs.git`

### 3. Install Ruby

**Mac (using Homebrew):**
```bash
# Install rbenv
brew install rbenv ruby-build

# Install Ruby
rbenv install 3.3.0
rbenv global 3.3.0

# Add to shell
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc
```

**Linux (Ubuntu/Debian):**
```bash
# Install dependencies
sudo apt-get update
sudo apt-get install -y build-essential libssl-dev libreadline-dev zlib1g-dev

# Install rbenv (follow WSL2 guide steps)
```

### 4. Install Rails and Project Dependencies

```bash
# Install Rails and Bundler
gem install rails bundler

# Install project dependencies
bundle install
```

## 5. Set Up Your .env File

Create a `.env` file in your project root with your credentials:
[Screenshot: Creating .env file in Cursor]

```text
OPENAI_API_KEY=your_key_here
STRIPE_SECRET_KEY=your_key_here
# Add other credentials as needed
```

This file stays on your computer - no more re-entering credentials!

## 6. Start Developing

```bash
# Run your Rails server
rails server

# Or if that doesn't work:
bundle exec rails server
```

Visit `http://localhost:3000` in your browser - you're ready to go!

[Screenshot: Rails app running locally]

**Troubleshooting Windows:**

- If `rails` command not found: Use `bundle exec rails` instead
- If port 3000 is blocked: Try `rails server -p 3001`
- For any "permission denied": Run terminal as Administrator

**Benefits of local development:**

- Credentials persist (one-time setup)
- Faster response times
- Better AI assistance in Cursor
- Full control over your environment

Need help? The AI in Cursor is more powerful than Codespaces - just ask it!