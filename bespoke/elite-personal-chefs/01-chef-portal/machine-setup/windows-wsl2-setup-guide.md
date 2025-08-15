# Rails on Windows - The Battle-Tested WSL2 Solution

## The Industry Standard Approach

After researching how companies with Rails codebases handle Windows developers, the answer is clear: **WSL2 + proper configuration**. This isn't a workaround - it's the professional standard.

## Why WSL2 Is The Solution

WSL2 runs a real Linux kernel inside Windows. You get:
- Native Linux performance (no translation layer)
- Full compatibility with all Ruby gems
- Same commands that work on Mac/Linux
- Docker integration if needed later
- Microsoft's official support

## One-Time Setup (30 minutes)

### Step 1: Install WSL2 (5 minutes)

Open PowerShell as Administrator and run:
```powershell
wsl --install -d Ubuntu
```

Restart your computer when prompted.

### Step 2: Configure WSL2 (5 minutes)

After restart, Ubuntu will open automatically. Create your Linux user:
- Username: Keep it simple (your first name lowercase)
- Password: Something memorable (you'll type it often)

### Step 3: Install Ruby via rbenv (10 minutes)

Inside WSL2 Ubuntu, run these commands one by one:

```bash
# Update package list
sudo apt-get update

# Install dependencies
sudo apt-get install -y git curl libssl-dev libreadline-dev zlib1g-dev \
                        autoconf bison build-essential libyaml-dev \
                        libreadline-dev libncurses5-dev libffi-dev libgdbm-dev \
                        libsqlite3-dev

# Install rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash

# Add rbenv to path
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# Install Ruby (latest stable)
rbenv install 3.3.0
rbenv global 3.3.0

# Install Rails
gem install rails bundler
```

### Step 4: Set Up Your Project Directory (5 minutes)

**CRITICAL**: Store all code in WSL2, not Windows!

```bash
# Create projects folder in WSL2
mkdir ~/projects
cd ~/projects

# Clone your repository here
git clone https://github.com/[your-username]/elite-personal-chefs.git
cd elite-personal-chefs

# Install dependencies
bundle install

# Run the server
rails server
```

### Step 5: Access from Cursor (5 minutes)

1. Open Cursor
2. Click "Open Folder"
3. Type: `\\wsl$\Ubuntu\home\[your-username]\projects\elite-personal-chefs`
4. Cursor now edits files directly in WSL2

## Daily Workflow

### Starting Work
1. Open Terminal in Cursor
2. It automatically opens in WSL2
3. Run: `rails server` or `bin/dev`
4. Edit in Cursor, test in browser

### Ending Work
When done for the day, free up memory:
```powershell
wsl --shutdown
```

## Critical Best Practices

### ✅ DO
- Store ALL code in WSL2 (`~/projects`)
- Use Cursor's WSL2 integration
- Run all commands in WSL2 terminal
- Commit/push from WSL2

### ❌ DON'T
- Store code in Windows directories (`C:\`)
- Run Ruby/Rails in PowerShell
- Mix Windows and Linux tools
- Edit files from Windows Explorer

## Performance Tips

1. **File Location Matters**: Code in WSL2 is 20x faster than accessing Windows files
2. **Memory Management**: Run `wsl --shutdown` when done to free RAM
3. **Terminal Choice**: Use Windows Terminal for best experience
4. **Git Config**: Configure git in WSL2, not Windows

## Troubleshooting

### "Command not found"
You're in PowerShell. Type `wsl` first.

### "Permission denied"
File is in Windows. Move project to `~/projects`.

### Slow performance
Code is in Windows path. Must be in WSL2 path.

### Can't access localhost:3000
WSL2 networking works automatically. Check firewall.

## Alternative: Docker (if WSL2 fails)

If WSL2 isn't working, Docker Desktop with WSL2 backend is the backup:

1. Install Docker Desktop
2. Enable WSL2 backend in settings
3. Use a `docker-compose.yml` file:

```yaml
version: '3'
services:
  web:
    image: ruby:3.3
    volumes:
      - .:/app
    working_dir: /app
    command: bash -c "bundle install && rails server -b 0.0.0.0"
    ports:
      - "3000:3000"
```

## Why This Works

- **GoRails** (Rails' official learning platform) recommends exactly this setup
- **Major companies** use this for their Windows developers
- **Microsoft** actively maintains and improves WSL2
- **Performance** matches native Linux when configured correctly
- **No compatibility issues** - you're literally running Linux

## Conclusion

Don't fight Windows. Don't pile on workarounds. Use WSL2 properly from the start. It's what every professional Rails team recommends for Windows developers in 2024.

This setup takes 30 minutes once, then works forever.