# Session Agendas - Chef Portal Teaching Project

## Week 1: Interface Design

### Monday Morning - Breadboarding & Setup (90 min)

**What we'll do:** Together we'll define the scope and boundaries of the chef portal experience. We'll review the breadboard I've drafted to establish what screens exist, what decisions users make at each point, and what functionality we're intentionally excluding from this first version. This is about agreeing on the shape of the product before we start sketching interfaces.

**Success criteria:** Everyone leaves with the same mental model of what we're building and clear boundaries about what's in and out of scope. You'll have specific ideas and inspiration ready for tomorrow's fat marker sketching session. The afternoon's landing page work will make more sense because you understand the full vision we're working toward.

**Prerequisites:** Read through the initial breadboard draft I've provided so you come with questions, reactions, and ideas about the user journey. Think about which parts feel most important to get right and where you see potential friction points for chefs.

### Monday Afternoon - Claude Code Setup Workshop (2pm, informal)

**What we'll do:** We'll get everyone set up with Claude Code and comfortable using it. This is a hands-on workshop where we'll install the tool, configure it for Rails development, and build something simple together to make sure everyone's environment works. We'll troubleshoot any issues and ensure everyone can start building independently.

**Success criteria:** Everyone has Claude Code installed and working. You've successfully generated and run Rails code with it. You understand the basic workflow of prompting Claude Code to build interfaces. Any setup issues are resolved before Tuesday's sketching session.

**Prerequisites:** Have your computer ready with admin access to install software. Have your code editor of choice installed (VS Code recommended). Come with patience - setup always has hiccups and that's normal.

### Tuesday Morning - Fat Marker Sketches (60 min sync → 90 min total)

**What we'll do:** We'll start with individual 10-minute sketching sprints for each major screen - working alone forces you to trust your instincts without groupthink. After each sprint, we'll share our sketches and discuss what we each prioritized. We'll converge on the strongest ideas from everyone's sketches. In the final 30 minutes, we'll start translating these sketches into actual Rails interfaces using Claude Code, getting at least one screen started before you continue async.

**Success criteria:** Everyone has drawn their own version of each core screen and can explain their design choices. We've identified the best elements from each person's sketches to combine into the final interfaces. You've successfully created your first Rails view with Claude Code and understand the basic workflow for building the rest.

**Prerequisites:** Have pen and paper ready for individual sketching - don't worry about sharing quality, these are thinking tools. Have Claude Code installed and working from Monday's setup. Be ready to work quickly without overthinking - the time constraints are intentional.

### Wednesday Morning - Interface Refinement (60 min)

**What we'll do:** We'll review all the interfaces you built Tuesday afternoon, clicking through them as a user would. We'll debate design decisions, identify what's working and what feels confusing, and create a clear punch list of what needs to be done to make everything clickable by Thursday.

**Success criteria:** You understand the power of thinking through interfaces without worrying about functionality first - how this separation makes better products. You have a specific list of refinements to complete. Everyone knows exactly what needs to be connected to create Thursday's clickable demo.

**Prerequisites:** Have all your Tuesday interfaces pushed to the repository and viewable. Come prepared to explain design decisions you made independently. Note any struggles or uncertainties you encountered while building.

### Thursday Afternoon - Go/No-Go Decision (3:30-4:30pm CST)

**What we'll do:** This is our checkpoint before Week 2. We'll click through the complete interface experience together and make a go/no-go decision. If we're happy with what we've built, we lock these interfaces for wiring next week. If not, we identify what needs to change and use Friday as our buffer day to get it right.

**Success criteria:** We can click through the entire chef experience from job entry to payment confirmation and feel good about it. Everyone agrees these interfaces are ready to wire up with real data and Square integration. We're confident that what we've designed solves the core problem.

**Prerequisites:** Have all interfaces connected and clickable. Test the complete flow on your phone. Come prepared to make a decision - perfect is not the goal, "good enough to ship" is.

## Week 2: Wiring & Automation

### Monday Morning - Integration Planning (60 min)

**What we'll do:** We'll transition from the mock data in your controllers to a real database. You'll see how Rails stores and retrieves information, turning your static demo into a system that remembers data between sessions. We'll implement placeholder logic that simulates "this payment has been confirmed" so your portal behaves like payments are real even before we connect Square.

**Success criteria:** You understand how databases persist information that controllers can access. Your portal now saves real job entries instead of just displaying them. You can see how the mock payment confirmation logic will be replaced with real Square webhooks tomorrow.

**Prerequisites:** Have your Thursday clickable demo working. Think about what data needs to be saved versus what can be calculated on the fly. Be ready to observe closely as we write code together - this is where you learn by watching.

### Tuesday Morning - Core Logic (60 min)

**What we'll do:** We'll wire the real Square payment integration together, replacing yesterday's mock payment logic with actual webhook handlers. We'll connect Square's payment confirmations to trigger the right actions in your portal. We'll test together in the Square sandbox, processing fake payments and watching the data flow through.

**Success criteria:** Real Square test payments now update your portal automatically. You understand how external webhooks trigger internal actions. You can see the connection between what a chef does in Square and what appears in the portal.

**Prerequisites:** Have your Square sandbox account ready. Understand yesterday's mock payment flow so you can see what's being replaced.

### Wednesday - Deployment & Rollout (afternoon async)

**What we'll do:** You'll deploy the portal to production on Render with my guidance. We'll move everything built so far from development to live on the internet. You'll test it with production Square credentials and verify the complete flow works. I'll ensure you understand how to make changes and deploy updates on your own going forward.

**Success criteria:** The portal is live and functional on the internet (though not yet shared with chefs). You successfully deployed it yourself with guidance. You understand how to make changes and redeploy. Everything built up to this point is working in production.

**Prerequisites:** Have your Render account ready. Have production Square API credentials available. Be ready to test the complete flow once deployed.

### Thursday Morning - Spreadsheet Automation (2 hours - Lee must attend)

**What we'll do:** We'll redesign your spreadsheet from the ground up to match the portal's data flow. Starting with a flowchart, we'll map exactly what information needs to move from Square to the spreadsheet and when. Then we'll build both the new spreadsheet structure and the Zapier automation that populates it, testing with real payment data as we go.

**Success criteria:** You have a new spreadsheet that automatically receives data from every portal payment. The automation is tested and working with real transactions. Lee understands how to modify the spreadsheet structure if business needs change.

**Prerequisites:** Lee must attend with access to the current spreadsheet. Have Zapier account ready. Know what reports and calculations you need from this spreadsheet data.

### Friday - Wrap-up & Handoff

**What we'll do:** This is your turn to teach back what you've learned. You'll walk through the entire system you built, explaining how each piece works and why we built it that way. We'll discuss how to apply these same processes - from breadboarding to deployment - to expand beyond payments into the full chef portal vision. I'll coach you through planning your next features independently.

**Success criteria:** You can explain the entire system architecture to someone else. You have a clear plan for what to build next and how to approach it. You feel confident to continue development without constant support. You understand the design and development processes well enough to apply them to new problems.

**Prerequisites:** Come ready to present what you built and what you learned. Think about what chef features you want to add next. Prepare questions about anything that's still unclear. Have your vision for the complete chef portal ready to discuss.