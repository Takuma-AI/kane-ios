# Quote Generator Codebase

**Repository:** [Client-owned GitHub repository]
**Production URL:** booking.elitepersonalchefs.com
**Technology Stack:** Rails 7, Hotwire, Tailwind, PostgreSQL

## Architecture Overview

### Core Components
- **Event System:** Private chef event quotes with dynamic pricing
- **Meal Prep System:** Weekly meal prep calculator and quotes
- **AI Integration:** Gemini API for menu generation
- **Square Integration:** Invoice creation and payment processing
- **Admin Dashboard:** Operations management interface

### Key Technical Decisions
- Hotwire for reactive UI without heavy JavaScript
- Service objects for business logic encapsulation
- Gemini for menu generation (context window optimization)
- Square API for seamless payment integration

## Deployment
- Hosted on Render
- PostgreSQL database
- Automated deployments from main branch
- Client team has full access and control

## Lessons for Future Engagements
- Interface-first development accelerates understanding
- AI context management benefits from structured templates
- Square integration patterns established for reuse
- Admin needs should be discovered early