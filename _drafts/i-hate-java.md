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

