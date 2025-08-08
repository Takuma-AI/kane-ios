# Docker for Dummies - Appendix

## What is Docker?

Think of Docker as a **shipping container for software**. Just like shipping containers revolutionized cargo transport by standardizing how goods are packaged and moved, Docker standardizes how software is packaged and run.

## The Problem Docker Solves

**Without Docker:**
- "It works on my machine!" (but not on yours)
- Installing PostgreSQL differently on Mac vs Windows vs Linux
- Dependency conflicts between projects
- Complex setup instructions for new developers

**With Docker:**
- Software runs identically everywhere
- One command to start everything
- No installation steps
- Delete when done - no cleanup needed

## Docker Concepts in Plain English

### 1. **Image** = Recipe
A Docker image is like a recipe. It contains all the instructions to create a working environment.
```dockerfile
# This is like a recipe card
FROM postgres:15
# "Start with PostgreSQL version 15"
```

### 2. **Container** = Cooked Meal
A container is what you get when you "run" an image. It's the actual running software.
```bash
# Turn the recipe into an actual meal
docker run postgres:15
```

### 3. **Dockerfile** = Your Custom Recipe
When you need something specific, you write your own recipe.
```dockerfile
# My custom recipe
FROM ruby:3.2
RUN gem install rails
COPY my-app /app
CMD ["rails", "server"]
```

### 4. **Docker Compose** = Full Dinner Party
Compose lets you run multiple containers together (like your app + database).
```yaml
# docker-compose.yml = "Dinner party plan"
services:
  app:      # Main course
    build: .
  database: # Side dish
    image: postgres:15
```

## For HASHI Specifically

Instead of installing PostgreSQL on your Mac/Windows/Linux differently, you'd use:

```yaml
# docker-compose.yml
version: '3'
services:
  db:
    image: postgres:15  # Use PostgreSQL 15
    environment:
      POSTGRES_PASSWORD: password
    ports:
      - "5432:5432"     # Makes it accessible like normal
    volumes:
      - postgres_data:/var/lib/postgresql/data  # Keeps your data

volumes:
  postgres_data:  # Your database files live here
```

Then just run:
```bash
docker-compose up    # Start PostgreSQL
docker-compose down  # Stop PostgreSQL
```

## Why Developers Love Docker

1. **No Installation Hell**: Never see "PostgreSQL installation failed" again
2. **Clean Machine**: Everything lives in containers, not cluttering your system
3. **Team Consistency**: Everyone has identical development environment
4. **Easy Cleanup**: `docker-compose down` and it's like it was never there

## Common Docker Commands

```bash
# Start everything
docker-compose up

# Start in background
docker-compose up -d

# Stop everything
docker-compose down

# See what's running
docker ps

# View logs
docker-compose logs

# Get inside a container
docker exec -it container_name bash
```

## Docker vs Installing Normally

**Installing PostgreSQL normally:**
1. Download installer for your OS
2. Run installer (hope it works)
3. Configure PATH variables
4. Set up users and passwords
5. Remember to start it each time
6. Uninstalling leaves traces everywhere

**Using PostgreSQL with Docker:**
1. Write 10 lines in docker-compose.yml
2. Run `docker-compose up`
3. Done

## When NOT to Use Docker

- For simple static websites
- When you need maximum performance
- If your team isn't comfortable with it
- For GUI applications (possible but awkward)

## Getting Started

1. Install Docker Desktop (it's just a regular app)
2. Copy a docker-compose.yml file
3. Run `docker-compose up`
4. That's it!

## The Mental Model

Think of Docker like this:
- **Without Docker**: You're a chef who has to grow vegetables, raise chickens, and mill flour before cooking
- **With Docker**: You're a chef with a fully stocked kitchen - just cook!

## For Rails Developers

Rails even has built-in Docker support now:
```bash
rails new myapp --database=postgresql --devcontainer
```

This creates a full Docker setup automatically!

## Remember

Docker isn't magic - it's just a clever way to package software with everything it needs to run. Like a lunchbox that includes the meal, utensils, napkin, and even a little table to eat on.