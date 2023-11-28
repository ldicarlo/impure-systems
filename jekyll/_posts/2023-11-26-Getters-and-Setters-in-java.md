---
layout: post
title:  "Getters and setters in java"
categories: "I hate Java"
tags: "java"
---

# Setters and Getters

We use Getters and Setters to access data. Everybody will tell you to use them.

The reason _may_ be that some dinosaures decennies ago decided that maybe you could put some business inside these accessors.
Nobody ever put business in it, because:
- first of all this is an anti-pattern, since you don't want to hide business in a function called `getStuff()` or `setStuff()`
- second we all use Lombok to .. autogenerate these accessors, so we don't need to write them manually. This is an aberration, why use them at all then ??
