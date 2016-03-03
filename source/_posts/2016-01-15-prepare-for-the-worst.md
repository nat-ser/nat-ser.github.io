---
layout: post
title: "Prepare for the worst."
date: 2015-12-15 14:53:41 -0500
comments: true
categories: [Flatiron School, worst parts, JavaScript]
keywords: Javascript
description: What are some things to watch out for with Javascript
---

{% img http://cdn2.crushable.com/wp-content/uploads/2014/12/groundhog-day.gif %}


<p>There are awful things that could happen to you in Javascript. It is simultaneously intriguing and
useful to worry about them. Spending hours on stupid, easily preventable bugs does not appeal to me. Here is a brief summary of things to watch out for:</p>



<h4> Don't define local variables like an asshole </h4>
<p> People are very fussy about JavaScript's global variables. Here's the reason. A global variable is one that is available from any function in the program as opposed to just within the block of the method. Global variables are the default in JavaScript. If you want a variable to have local scope, you need to specify the declaration with a var ___ keyword. This is an example of how to do this right:</p>
    RIGHT WAY
{% img /images/right.png %}
<p>The 'meow' variable is defined within the IIFE (immediately invoked function expression). It outputs 'I am an awesome local variable' to the console. When you call it outside the scope of function, 'meow' returns undefined, as you would expect.</p>


    WRONG WAY
{% img /images/wrong.png %}
<p> You were too lazy to type 'var' before 'meow'. The IIFE does what you tell it to..but when you call 'meow' outside the function, 'meow' is still remembered as "I am not a local variable because you suck at typing!". This happens because JavaScript interprets the sloppy local declaration as an "implied global" variable.</p>

<p>So why is this bad? It can result in collisions down the line. It's particularly annoying to find these type of bugs, especially if you don't realize that you forgot a "var" somewhere at some point. So stop it!</p>

<h4> How to call a method on a number </h4>
<p> For example if you want to use dot notation to call a function on a number this would blow up:</p>
    WRONG WAY
{% codeblock lang:ruby %}
9.toString(); //SyntaxError
{% endcodeblock %}
<p> JavaScript parser interprets dot notation as floating point literal.</p>
    RIGHT WAY
{% codeblock lang:ruby %}
9..toString(); // has 2 dots
9 .toString(); // space to left of block
(9).toString(); // 9 is evaluated first
{% endcodeblock %}    
<p> All output "9" and bypass the parser bug</p>

<h3> In progress... </h3>
