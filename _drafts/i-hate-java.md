---
layout: post
title:  "after 7 years, I hate Java"
categories: "java is bad"
---

I wanted to begin my blog by this post.

I just finished a contract in java, and looking forward to begin a new one in Haskell.

After 7 years of java (even OCP certified), I want to say that I hate it.

In my previous job we used Vavr(link) to counter OOP in the code.

# OOP is bad, Mutability is worse

The most anger I had about OOP these last years where in `Set.java`.

I don't think there is a solution for that, but the problem is a classical one.

`HashSet` uses `.equals()` to tell if 2 objects are the same and remove one of them, but if you use OOP and update an object, it does not recompute hashes. So you finish with a `Set` with twice the same object.
This is obviously unacceptable for a ... Set.

But the guys at java prevented that:
Look here: https://docs.oracle.com/javase/8/docs/api/java/util/Set.html

(link image)

# Setters and Getters

We use Getters and Setters to access data. Everybody will tell you to use them.

The reason _may_ be that some dinosaures decennies ago decided that maybe you could put some business inside these accessors.
Nobody ever put business in it, because:
- first of all this is an anti-pattern, since you don't want to hide business in a function called `getStuff()` or `setStuff()`
- second we all use Lombok to .. autogenerate these accessors, so we don't need to write them manually. This is an aberration, why use them at all then ??

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

IOC is probably the biggest PITA in spring because you have to understand a lot of things and at the end, there is no `main` function, like all other languages have. So you choose what will/will-not start based on your understanding of spring.

# Spring AOP

This is the second biggest pitfall of spring.
Every java developer will tell you that this is awesome because Aspect Oriented Programming permits you to apply an "around function" around a pattern of functions in the code.
This is invisible, you don't see it until you run the code.

# Objects `equals()`

The default function to compare two Objects in java compares .. their memory address.
Who in the world would want that default behaviour ?
I understand that it does not come from nowhere.
Because how would decide if two Objects are equal if they have the same fields but different functions for example?
But also, why would you provide a default behaviour then ?

Be sure that not implementing it would make the compiler vomit in your face maybe?

# Overriding

Polymorphism woud have been a good idea, but without inheritance maybe.
exemple two objects

## And then `static` happens


# Oracle

I won't develop this section, I am afraid they'll send me to the tribunal

