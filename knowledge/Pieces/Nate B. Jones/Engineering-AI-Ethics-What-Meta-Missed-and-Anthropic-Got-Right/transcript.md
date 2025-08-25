# Engineering AI Ethics: What Meta Missed and Anthropic Got Right

**Channel**: AI News & Strategy Daily | Nate B Jones  
**Date**: 2025-08-17  
**URL**: https://youtube.com/watch?v=tVTOs24Yb7E  
**Duration**: 0:13:28  
**Views**: 5,083  
**Transcribed**: 2025-08-24  
**Source**: youtube_captions

---

## Transcript

Meta has an ethics scandal on their hands. They have had a document leaked which was approved by over 200 people including engineers, including ethsists, including Meta's chief AI ethicist and the content is an AI ethics policy that is deeply troubling. Now, Meta emphasizes that this is not representative of the common or typical use case and they're trying to draw guard rails. I get that. The challenge is technical. I think that Meta's AI ethics policy doesn't actually reflect a deeply technical approach to doing ethics properly at the core of artificial intelligence systems and instead reflects an attempt to bolt on some minimal ethical guard rails after the fact. And I'm going to get into what I mean by that and what deep AI ethics means later in this video. But first, if you haven't been reading the news, just a little teaser of what was in the leaked document. Reuters has leaked the document. They don't they haven't leaked the full document. They've summarized it. Uh and Meta has admitted it's real. They talk about and and Reuters explicitly talks about the idea that the AI would be permitted to have some kind of romantic conversation with a child. They talk about the idea that the AI would be permitted to partially comply with requests for not safe for work deep fake images. They talk about the extent to which the model would comply with a request to create a an image about threatening an elderly person or a child. I could go on, right? There's there's content about how it can support creating false information, false medical information about celebrities, content about how the AI would be permitted to support a racist argument. There's a lot of stuff that is repugnant. Really, that's where Meta stops, right? Meta comes back and says, "Oh, well, this was a mistake. I I've I've worked at a big company. If 200 people approved it, if the chief AI ethicist approved it, it's not a mistake, guys. That's just not how big companies work. It was deliberate and they're refusing to release what they call the fixed document. Again, they're avoiding the sunlight here. And I think that's part of the problem, especially when you have a documented pattern of leaks from a company that tend to emphasize the same behavioral focus, which is to optimize for engagement with their systems. Just earlier this year, Meta was reported to have been working on AI profiles for artificial people who would post content and then develop friendships with you and so on. Essentially, act like Facebook friends, act like Instagram friends in the network. We all know AI content creation is going like gang busters, but that was a new level. Essentially, Meta starting to create this sort of artificial network of friendships around you. So, this is very much in line with Meta's overall approach. That's what happened. I want to talk about AI ethics and how you engineer for it because I don't just want to report sort of the news and what happened. You can get that anywhere. I want to talk about the engineering piece. And I think I want to use the anthropic approach as a lens. Not because anthropic has gotten it right and perfect. I would argue there is no right perfect solution here. But because anthropic's approach emphasizes the idea that ethics is an engineered capability, not a set of rules. So Anthropic's approach is to build ethics in at training rather than bolting it on after. And I think that would have prevented or addressed a lot of what meta seems to be struggling with here. And so the constitutional uh practice or process that anthropic has published and talked about very widely is that the model will generate a response in training. It will then learn to critique its own response based on a set of constitutional principles that it's been given. So it revises based on its critique, learns from the critique and the revision. So as an example, the model will generate potentially harmful content. It will then recognize the harm by referring to its constitutional principles. It will then revise to refuse or redirect. And the whole process of training reinforces this pattern. So the model learns to go back to it. This creates a kind of ethical intuition. It's not just rule following. It's learning to go back to constitutional principles. Which is why Anthropic calls this constitutional AI. And it's why they believe it's important in an age when models reason more and more. As you get models that reason, you need to have models that can reason within a sense of an ethical framework. or else there are going to be more and more ways to convince the model to reason its way in a direction that could be potentially harmful to the user or the community at large. So the idea at least is that the model will learn why something is harmful and not just that it is harmful. And that will especially as reasoning models get smarter give you a wider surface area for protecting the user in the community because the model understands and internalizes deeply the rationale for what is going on in the response. that enables the model to hopefully recognize novel harmful patterns that it has not seen before. So, who who writes the constitution? This gets at one of the challenges. I told you there was no perfect way. One of the challenges with this approach is that it's unclear who gets to write the constitution. And right now, it's private companies because they're the model makers, right? And Anthropic's public version of their constitution is somewhat vague. I don't know if they have a private one that's more more durable, more specific, that's proprietary, but but their public one has statements like be helpful and harmless. I mean, it reminds me of Hitchhiker's Guide and the description of Earth is mostly harmless. It's not super useful, is it? The question then arises, if you have a useful constitution, if it's specific, if it's not vague, how do you handle conflicts between principles? How do you balance helpfulness and harmlessness? How do you balance honesty and kindness? The model needs to learn to navigate tensions between values, not just a set of rules to follow. And that in a sense mirrors what we do as people when we develop ethically. We learn about wrestling with conflicting values and what it means. And this underlines one of the things I tend to sort of emphasize when I get asked about AI ethics. It's not a practice of writing in the ivory tower when it comes to AI. It's really a practice of engineering. And how do you engineer the kind of ethical development that you would want to see? And I think part of why I want to cover anthropics use case here in detail is they have actually pretty publicly talked about the importance of engineering ethics. And I think that represents at least a good mile marker along the way as we develop AI systems that increasingly impact users and communities. So the obvious question which maybe you're waiting to for me to ask or maybe you're going to roll your eyes at is whose values and which ethical framework, right? Who gets to pick? And we'll get into sort of how you might address that. But there there there are some answers that we can actually articulate to that that are I think publicly reasonable to the community. Let's start with the idea that a lot of the way feedback training works is through reinforcement learning with human feedback. Humans will rate outputs and models will learn to get higher ratings. Now, we are starting to get to a point where models will self-learn and models will self-rate outputs. That is fundamentally an outgrowth of RLHF and it's an outgrowth based on the scale of the models we're addressing now. But if you start with the idea that humans rate feedback and that might be especially important in the case of ethics, meta's failure highlights a flaw. Which humans get to highlight feedback and training? It's kind of the same question as which humans get to write the values because the feedback informs the values. It informs how you navigate the tension between these different value statements like honesty and kindness etc. In this case, Meta seems to have passed their guidelines through lawyers, engineers, ethicists. But as far as I can tell and as far as I've seen in reporting, there were no child development experts involved even though children were explicitly addressed and considered. That's sort of like training a medical AI without doctors, guys. And even if they had the right people in the room, one of the things to call out is that there is a sense of fatigue that can set in when you're dealing with use case after use case. There can be fatigue when you're dealing with edge case after edge case at a policy level, which that document did. There's also a degree of fatigue that's very well documented with human reviewers who are looking at potentially harmful content all the time. You can get reviewer fatigue and standards can drift during the day. And so one of the things that I want to call out is that we do a better job here if we can get an agreed set of stakeholders, an agreed set of constitutional principles. You see how you can start to point a way towards something that becomes a framework for ethics for the industry. You can have like an agreed set of common core constitutional principles that AI should follow and should be engineered into AI systems. You can have an agreed set of stakeholders who should review ethics at private companies. That would be a common core as well. You could have an agreed set of working standards for human reviewers, especially around ethical matters so they're not over fatigued and over tired. These are things that sort of fall out naturally as we start to understand how ethics works. This this would be essentially the basis for an agreed companywide or industrywide set of standards for how we train AI so it's helpful to the community. Red teaming is another issue. Red teameing means trying to break your system before deployment. If there had been red teaming with child safety experts, I don't think this would ever have happened because they would have immediately tagged this as an issue. Good red teaming needs people who understand how harm is actually practiced with AI and it needs response mechanisms that incorporate that feedback through reinforcement learning into the sense of ethics that the AI system needs to learn. Hey, we learned that this was an attack vector that works. How do we start to balance our values differently as a result? Last but not least, I want to talk about synthetic data. You obviously have situations here where you cannot train on real data because it's dangerous to the community. So you have to train on synthetic data that simulates inappropriate content. And in particular, the constitutional AI example from anthropic suggests that you should train on data that simulates a refusal in a situation where inappropriate content or inappropriate data is requested from the model. And I think part of where we see the issue with meta is they're focused a lot on shutting the door of the barn after the cow got it, right? They're focused on these edge cases when the model itself doesn't have the instincts to not produce them. And so what Meta is trying to do is just to maybe trim off the edges of egregious harm a little bit, but then they're normalizing a lot of behavior that the community would widely consider unacceptable. We need to get to a point where that common core of ethics that we engineer as a capability into AI systems is widely understood that we can all talk about it. We can all debate it. We all understand which stakeholders are involved. And if we generate synthetic data, we're generating synthetic data in line with those values in line with what we want the AI to learn and do. In fact, this would be a case where a synthetic data set that was widely available that could be tested against for new models would be really appropriate and helpful for the industry. We need transparency. One of the things that really makes me grieve the Meta situation is that when they were called on the carpet by essentially the world at large after this leaked, Meta chose not to lean into transparency. Meta chose not to release their fixed guidelines. You have to trust us that they're fixed. Why? Why? Why can't you release them? Is it really that hard? And so I I think that one of the things if you are looking at what AI system to use, look at the degree to which model makers who are self-p policing right now are able to articulate their ethical standards, their their constitutional principles, however they define them. You want to be in a place where you understand your risk vector because this is not just a risk for meta on meta platforms. If Llama will do this, every system that uses Llama is potentially at risk from a liability perspective. And so it's important if you're purchasing or using AI systems to understand where the ethical edges are. And I don't think that gets emphasized enough in purchasing cycles in vendor conversations. How do you know that the model is going to be a responsible actor in difficult situations? What I've outlined here is I would not call this a silver bullet approach. I don't think constitutional AI is the way forward for all no matter what. We will never get a better system. I do think that anthropic has done a great job articulating a practical way to engineer ethics into models as they get smarter and I think we need more approaches like that. I also think we need to be able to scale up those approaches to the industry level and I've suggested a few ways how. We cannot continue trying to play whack-a-ole and betting on leaked guidelines as a way forward here. Over a billion people use AI. it is impacting communities and children. We need to treat ethics as a central engineering problem and fortunately we have ways to do it. It's not impossible. So this is my ask. If you are involved in any kind of product building that uses AI systems, make sure you understand where the ethical core of your AI is and that you understand how to engineer protections to keep your users safe. Cheers.

---

## Timestamped Transcript

[0:00:00] Meta has an ethics scandal on their
[0:00:02] hands. They have had a document leaked
[0:00:05] which was approved by over 200 people
[0:00:07] including engineers, including ethsists,
[0:00:10] including Meta's chief AI ethicist and
[0:00:12] the content is an AI ethics policy that
[0:00:16] is deeply troubling. Now, Meta
[0:00:18] emphasizes that this is not
[0:00:19] representative of the common or typical
[0:00:22] use case and they're trying to draw
[0:00:23] guard rails. I get that. The challenge
[0:00:26] is technical. I think that Meta's AI
[0:00:29] ethics policy doesn't actually reflect a
[0:00:33] deeply technical approach to doing
[0:00:36] ethics properly at the core of
[0:00:38] artificial intelligence systems and
[0:00:40] instead reflects an attempt to bolt on
[0:00:43] some minimal ethical guard rails after
[0:00:45] the fact. And I'm going to get into what
[0:00:47] I mean by that and what deep AI ethics
[0:00:49] means later in this video. But first, if
[0:00:52] you haven't been reading the news, just
[0:00:54] a little teaser of what was in the
[0:00:55] leaked document. Reuters has leaked the
[0:00:57] document. They don't they haven't leaked
[0:00:58] the full document. They've summarized
[0:01:00] it. Uh and Meta has admitted it's real.
[0:01:02] They talk about and and Reuters
[0:01:04] explicitly talks about the idea that the
[0:01:06] AI would be permitted to have some kind
[0:01:08] of romantic conversation with a child.
[0:01:11] They talk about the idea that the AI
[0:01:12] would be permitted to partially comply
[0:01:14] with requests for not safe for work deep
[0:01:17] fake images. They talk about the extent
[0:01:20] to which the model would comply with a
[0:01:22] request to create a an image about
[0:01:24] threatening an elderly person or a
[0:01:26] child. I could go on, right? There's
[0:01:27] there's content about how it can support
[0:01:29] creating false information, false
[0:01:31] medical information about celebrities,
[0:01:33] content about how the AI would be
[0:01:35] permitted to support a racist argument.
[0:01:38] There's a lot of stuff that is
[0:01:40] repugnant. Really, that's where Meta
[0:01:42] stops, right? Meta comes back and says,
[0:01:43] "Oh, well, this was a mistake. I I've
[0:01:45] I've worked at a big company. If 200
[0:01:47] people approved it, if the chief AI
[0:01:48] ethicist approved it, it's not a
[0:01:50] mistake, guys. That's just not how big
[0:01:51] companies work. It was deliberate and
[0:01:53] they're refusing to release what they
[0:01:55] call the fixed document. Again, they're
[0:01:57] avoiding the sunlight here. And I think
[0:01:59] that's part of the problem, especially
[0:02:01] when you have a documented pattern of
[0:02:03] leaks from a company that tend to
[0:02:05] emphasize the same behavioral focus,
[0:02:07] which is to optimize for engagement with
[0:02:10] their systems. Just earlier this year,
[0:02:12] Meta was reported to have been working
[0:02:14] on AI profiles for artificial people who
[0:02:18] would post content and then develop
[0:02:21] friendships with you and so on.
[0:02:22] Essentially, act like Facebook friends,
[0:02:25] act like Instagram friends in the
[0:02:27] network. We all know AI content creation
[0:02:30] is going like gang busters, but that was
[0:02:32] a new level. Essentially, Meta starting
[0:02:34] to create this sort of artificial
[0:02:35] network of friendships around you. So,
[0:02:37] this is very much in line with Meta's
[0:02:39] overall approach. That's what happened.
[0:02:41] I want to talk about AI ethics and how
[0:02:44] you engineer for it because I don't just
[0:02:46] want to report sort of the news and what
[0:02:47] happened. You can get that anywhere. I
[0:02:49] want to talk about the engineering
[0:02:50] piece. And I think I want to use the
[0:02:53] anthropic approach as a lens. Not
[0:02:56] because anthropic has gotten it right
[0:02:58] and perfect. I would argue there is no
[0:03:00] right perfect solution here. But because
[0:03:03] anthropic's approach emphasizes the idea
[0:03:06] that ethics is an engineered capability,
[0:03:09] not a set of rules. So Anthropic's
[0:03:11] approach is to build ethics in at
[0:03:14] training rather than bolting it on
[0:03:16] after. And I think that would have
[0:03:17] prevented or addressed a lot of what
[0:03:19] meta seems to be struggling with here.
[0:03:21] And so the constitutional uh practice or
[0:03:24] process that anthropic has published and
[0:03:26] talked about very widely is that the
[0:03:28] model will generate a response in
[0:03:31] training. It will then learn to critique
[0:03:33] its own response based on a set of
[0:03:36] constitutional principles that it's been
[0:03:38] given. So it revises based on its
[0:03:40] critique, learns from the critique and
[0:03:42] the revision. So as an example, the
[0:03:45] model will generate potentially harmful
[0:03:47] content. It will then recognize the harm
[0:03:50] by referring to its constitutional
[0:03:52] principles. It will then revise to
[0:03:54] refuse or redirect. And the whole
[0:03:56] process of training reinforces this
[0:03:58] pattern. So the model learns to go back
[0:04:01] to it. This creates a kind of ethical
[0:04:03] intuition. It's not just rule following.
[0:04:06] It's learning to go back to
[0:04:07] constitutional principles. Which is why
[0:04:08] Anthropic calls this constitutional AI.
[0:04:11] And it's why they believe it's important
[0:04:13] in an age when models reason more and
[0:04:15] more. As you get models that reason, you
[0:04:17] need to have models that can reason
[0:04:19] within a sense of an ethical framework.
[0:04:21] or else there are going to be more and
[0:04:23] more ways to convince the model to
[0:04:25] reason its way in a direction that could
[0:04:27] be potentially harmful to the user or
[0:04:29] the community at large. So the idea at
[0:04:32] least is that the model will learn why
[0:04:34] something is harmful and not just that
[0:04:36] it is harmful. And that will especially
[0:04:38] as reasoning models get smarter give you
[0:04:41] a wider surface area for protecting the
[0:04:43] user in the community because the model
[0:04:45] understands and internalizes deeply the
[0:04:47] rationale for what is going on in the
[0:04:50] response. that enables the model to
[0:04:52] hopefully recognize novel harmful
[0:04:54] patterns that it has not seen before.
[0:04:58] So, who who writes the constitution?
[0:05:00] This gets at one of the challenges. I
[0:05:01] told you there was no perfect way. One
[0:05:03] of the challenges with this approach is
[0:05:05] that it's unclear who gets to write the
[0:05:09] constitution. And right now, it's
[0:05:10] private companies because they're the
[0:05:11] model makers, right? And Anthropic's
[0:05:14] public version of their constitution is
[0:05:17] somewhat vague. I don't know if they
[0:05:18] have a private one that's more more
[0:05:20] durable, more specific, that's
[0:05:22] proprietary, but but their public one
[0:05:23] has statements like be helpful and
[0:05:25] harmless. I mean, it reminds me of
[0:05:27] Hitchhiker's Guide and the description
[0:05:29] of Earth is mostly harmless. It's not
[0:05:31] super useful, is it? The question then
[0:05:33] arises, if you have a useful
[0:05:35] constitution, if it's specific, if it's
[0:05:38] not vague, how do you handle conflicts
[0:05:40] between principles? How do you balance
[0:05:42] helpfulness and harmlessness? How do you
[0:05:44] balance honesty and kindness? The model
[0:05:46] needs to learn to navigate tensions
[0:05:49] between values, not just a set of rules
[0:05:51] to follow. And that in a sense mirrors
[0:05:54] what we do as people when we develop
[0:05:55] ethically. We learn about wrestling with
[0:05:57] conflicting values and what it means.
[0:05:59] And this underlines one of the things I
[0:06:01] tend to sort of emphasize when I get
[0:06:02] asked about AI ethics. It's not a
[0:06:04] practice of writing in the ivory tower
[0:06:06] when it comes to AI. It's really a
[0:06:08] practice of engineering. And how do you
[0:06:12] engineer the kind of ethical development
[0:06:15] that you would want to see? And I think
[0:06:17] part of why I want to cover anthropics
[0:06:19] use case here in detail is they have
[0:06:22] actually pretty publicly talked about
[0:06:24] the importance of engineering ethics.
[0:06:25] And I think that represents at least a
[0:06:27] good mile marker along the way as we
[0:06:29] develop AI systems that increasingly
[0:06:31] impact users and communities. So the
[0:06:34] obvious question which maybe you're
[0:06:35] waiting to for me to ask or maybe you're
[0:06:38] going to roll your eyes at is whose
[0:06:39] values and which ethical framework,
[0:06:41] right? Who gets to pick? And we'll get
[0:06:43] into sort of how you might address that.
[0:06:45] But there there there are some answers
[0:06:47] that we can actually articulate to that
[0:06:49] that are I think publicly reasonable to
[0:06:51] the community. Let's start with the idea
[0:06:53] that a lot of the way feedback training
[0:06:55] works is through reinforcement learning
[0:06:57] with human feedback. Humans will rate
[0:06:59] outputs and models will learn to get
[0:07:00] higher ratings. Now, we are starting to
[0:07:02] get to a point where models will
[0:07:03] self-learn and models will self-rate
[0:07:04] outputs. That is fundamentally an
[0:07:07] outgrowth of RLHF and it's an outgrowth
[0:07:09] based on the scale of the models we're
[0:07:11] addressing now. But if you start with
[0:07:12] the idea that humans rate feedback and
[0:07:14] that might be especially important in
[0:07:16] the case of ethics, meta's failure
[0:07:19] highlights a flaw. Which humans get to
[0:07:22] highlight feedback and training? It's
[0:07:24] kind of the same question as which
[0:07:26] humans get to write the values because
[0:07:27] the feedback informs the values. It
[0:07:29] informs how you navigate the tension
[0:07:32] between these different value statements
[0:07:34] like honesty and kindness etc. In this
[0:07:36] case, Meta seems to have passed their
[0:07:39] guidelines through lawyers, engineers,
[0:07:41] ethicists. But as far as I can tell and
[0:07:44] as far as I've seen in reporting, there
[0:07:45] were no child development experts
[0:07:47] involved even though children were
[0:07:48] explicitly addressed and considered.
[0:07:50] That's sort of like training a medical
[0:07:51] AI without doctors, guys. And even if
[0:07:54] they had the right people in the room,
[0:07:56] one of the things to call out is that
[0:07:58] there is a sense of fatigue that can set
[0:08:01] in when you're dealing with use case
[0:08:03] after use case. There can be fatigue
[0:08:05] when you're dealing with edge case after
[0:08:06] edge case at a policy level, which that
[0:08:08] document did. There's also a degree of
[0:08:10] fatigue that's very well documented with
[0:08:12] human reviewers who are looking at
[0:08:14] potentially harmful content all the
[0:08:16] time. You can get reviewer fatigue and
[0:08:18] standards can drift during the day. And
[0:08:20] so one of the things that I want to call
[0:08:22] out is that we do a better job here if
[0:08:26] we can get an agreed set of
[0:08:28] stakeholders, an agreed set of
[0:08:31] constitutional principles. You see how
[0:08:32] you can start to point a way towards
[0:08:34] something that becomes a framework for
[0:08:35] ethics for the industry. You can have
[0:08:37] like an agreed set of common core
[0:08:39] constitutional principles that AI should
[0:08:41] follow and should be engineered into AI
[0:08:43] systems. You can have an agreed set of
[0:08:45] stakeholders who should review ethics at
[0:08:48] private companies. That would be a
[0:08:49] common core as well. You could have an
[0:08:52] agreed set of working standards for
[0:08:54] human reviewers, especially around
[0:08:55] ethical matters so they're not over
[0:08:57] fatigued and over tired. These are
[0:08:58] things that sort of fall out naturally
[0:09:00] as we start to understand how ethics
[0:09:01] works. This this would be essentially
[0:09:04] the basis for an agreed companywide or
[0:09:08] industrywide
[0:09:10] set of standards for how we train AI so
[0:09:13] it's helpful to the community. Red
[0:09:15] teaming is another issue. Red teameing
[0:09:17] means trying to break your system before
[0:09:19] deployment. If there had been red
[0:09:21] teaming with child safety experts, I
[0:09:24] don't think this would ever have
[0:09:25] happened because they would have
[0:09:26] immediately tagged this as an issue.
[0:09:28] Good red teaming needs people who
[0:09:31] understand how harm is actually
[0:09:34] practiced with AI and it needs response
[0:09:37] mechanisms that incorporate that
[0:09:39] feedback through reinforcement learning
[0:09:42] into the sense of ethics that the AI
[0:09:46] system needs to learn. Hey, we learned
[0:09:48] that this was an attack vector that
[0:09:50] works. How do we start to balance our
[0:09:52] values differently as a result? Last but
[0:09:54] not least, I want to talk about
[0:09:56] synthetic data. You obviously have
[0:09:58] situations here where you cannot train
[0:10:00] on real data because it's dangerous to
[0:10:02] the community. So you have to train on
[0:10:04] synthetic data that simulates
[0:10:06] inappropriate content. And in
[0:10:08] particular, the constitutional AI
[0:10:10] example from anthropic suggests that you
[0:10:12] should train on data that simulates a
[0:10:16] refusal in a situation where
[0:10:19] inappropriate content or inappropriate
[0:10:21] data is requested from the model. And I
[0:10:23] think part of where we see the issue
[0:10:25] with meta is they're focused a lot on
[0:10:27] shutting the door of the barn after the
[0:10:29] cow got it, right? They're focused on
[0:10:30] these edge cases when the model itself
[0:10:33] doesn't have the instincts to not
[0:10:35] produce them. And so what Meta is trying
[0:10:37] to do is just to maybe trim off the
[0:10:39] edges of egregious harm a little bit,
[0:10:41] but then they're normalizing a lot of
[0:10:43] behavior that the community would widely
[0:10:44] consider unacceptable. We need to get to
[0:10:46] a point where that common core of ethics
[0:10:49] that we engineer as a capability into AI
[0:10:52] systems is widely understood that we can
[0:10:54] all talk about it. We can all debate it.
[0:10:56] We all understand which stakeholders are
[0:10:58] involved. And if we generate synthetic
[0:11:00] data, we're generating synthetic data in
[0:11:02] line with those values in line with what
[0:11:05] we want the AI to learn and do. In fact,
[0:11:08] this would be a case where a synthetic
[0:11:10] data set that was widely available that
[0:11:12] could be tested against for new models
[0:11:14] would be really appropriate and helpful
[0:11:16] for the industry. We need transparency.
[0:11:19] One of the things that really makes me
[0:11:20] grieve the Meta situation is that when
[0:11:22] they were called on the carpet by
[0:11:23] essentially the world at large after
[0:11:25] this leaked, Meta chose not to lean into
[0:11:28] transparency. Meta chose not to release
[0:11:31] their fixed guidelines. You have to
[0:11:32] trust us that they're fixed. Why? Why?
[0:11:35] Why can't you release them? Is it really
[0:11:37] that hard? And so I I think that one of
[0:11:39] the things if you are looking at what AI
[0:11:42] system to use, look at the degree to
[0:11:44] which model makers who are self-p
[0:11:47] policing right now are able to
[0:11:49] articulate their ethical standards,
[0:11:51] their their constitutional principles,
[0:11:53] however they define them. You want to be
[0:11:55] in a place where you understand your
[0:11:57] risk vector because this is not just a
[0:12:00] risk for meta on meta platforms. If
[0:12:02] Llama will do this, every system that
[0:12:05] uses Llama is potentially at risk from a
[0:12:08] liability perspective. And so it's
[0:12:10] important if you're purchasing or using
[0:12:12] AI systems to understand where the
[0:12:14] ethical edges are. And I don't think
[0:12:16] that gets emphasized enough in
[0:12:18] purchasing cycles in vendor
[0:12:19] conversations. How do you know that the
[0:12:22] model is going to be a responsible actor
[0:12:24] in difficult situations? What I've
[0:12:26] outlined here is I would not call this a
[0:12:28] silver bullet approach. I don't think
[0:12:30] constitutional AI is the way forward for
[0:12:32] all no matter what. We will never get a
[0:12:34] better system. I do think that anthropic
[0:12:36] has done a great job articulating a
[0:12:38] practical way to engineer ethics into
[0:12:40] models as they get smarter and I think
[0:12:42] we need more approaches like that. I
[0:12:44] also think we need to be able to scale
[0:12:46] up those approaches to the industry
[0:12:48] level and I've suggested a few ways how.
[0:12:50] We cannot continue trying to play
[0:12:53] whack-a-ole and betting on leaked
[0:12:55] guidelines as a way forward here. Over a
[0:12:58] billion people use AI. it is impacting
[0:13:00] communities and children. We need to
[0:13:02] treat ethics as a central engineering
[0:13:05] problem and fortunately we have ways to
[0:13:07] do it. It's not impossible. So this is
[0:13:10] my ask. If you are involved in any kind
[0:13:13] of product building that uses AI
[0:13:17] systems, make sure you understand where
[0:13:20] the ethical core of your AI is and that
[0:13:22] you understand how to engineer
[0:13:25] protections to keep your users safe.
[0:13:27] Cheers.

---

*Extracted from YouTube Auto-generated captions*