---
layout: post
title:  "after 7 years, I hate Java"
categories: "I hate Java"
---

# OOP is bad, Mutability is worse

The most anger I had about OOP these last years where in `Set.java`.

I don't think there is a solution for that, but the problem is a classical one.

`HashSet` uses `.equals()` to tell if 2 objects are the same and remove one of them, but if you use OOP and update an object, it does not recompute hashes. So you finish with a `Set` with twice the same object.
This is obviously unacceptable for a ... Set.

But the guys at java prevented that:
Look here: https://docs.oracle.com/javase/8/docs/api/java/util/Set.html

(link image)

# Sonar 01: parameters numbers

Sonar tags as bad pattern functions with more than 7 (I think?) parameters. Everyone then pass objects containing the whole world to be sure to have everything they need.
But then when unit testing that, they fill their world object with only the field they need to unit test.
This is the worst pattern because you test nothing then.

# Sonar 02: Optional should never be used

You cannot pass Optional as a parameter because it is not intended to do so.
Optional is one of first concepts you learn when discovering functional programming, and they killed it in the egg.

# `null`s

Come on..

# Spring IOC

Spring is probably the most used framework in java.

The same dinosaures as above probably, decided that IOC (inversion of control) would give the ability, among others, to provide an implementation of functions (within a class) that _could_ change and be switched by the framework.

IOC is probably the biggest PITA in spring because you'd have to understand a lot of things and at the end, you don't have `main` function, like all other languages have. So you choose what will/will not start based on your understanding of spring.

# Spring AOP

This is the second biggest pitfall of spring.
Every java developer will tell you that this is awesome because Aspect Oriented Programming permits you to apply an "around function" around a pattern of functions in the code.
This is invisible, you don't see it until you run the code.

# Overriding



