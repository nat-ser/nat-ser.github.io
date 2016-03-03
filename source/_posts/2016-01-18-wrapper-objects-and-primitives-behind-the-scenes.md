---
layout: post
title: "wrapper objects and primitives behind the scenes."
date: 2016-01-18 14:53:41 -0500
comments: true
categories: [Flatiron_School, Primitives, data_types, JS, objects, JavaScript, Wrapper_Objects]
keywords: Javascript,Flatiron_School, primitives, data_types, JS, objects, JavaScript, Nataliya_Seryakova, wrapper_objects, Wrapper_Objects
description: What are the differences between objects and primitives? How do Wrapper Objects work behind the scenes?
---
In order to get deep with wrapper objects and how primitives really work, we will quickly go over the basics of objects and primitives, compare them, and then get to the good stuff.
<h4> What are the differences between Objects and Primitives?</h4>
{%img http://i.imgur.com/qQ9ifnb.gif %}
<br>
<strong>Primitive</strong> -"Type provided by the system. The primitive types are treated by JavaScript as value types and when you pass them around they go as values." (Wikibooks?) Primitive types are: Number, Boolean, String, Symbol, undefined, and null.

<strong>Object</strong> - "Container of properties, where a property has a name and a value" (Douglas Crockford) Basically, everything else that is not a Primitive is an object.

<h4> Main Differences between Primitives and Objects </h4>
<p> 1) <strong>Comparison</strong> - In broad terms, Primitives are defined by their value while Objects are defined by their reference. In other words, every time you use a Primitive data type, like a number, it is equal to any other variable with the same value. However, objects all have a unique identity only equal to itself even if their values are equal. Let's look at an example of this:   </p>
      EACH OBJECT HAS UNIQUE IDENTITY                                                      PRIMITIVE DOES NOT
{% img /images/object_comparison.png %}
{% img /images/primitive_comparison.png %}
<p>On the left, we create two different objects both equal to an empty array. What makes it an object is the fact that the array data type belongs to object. The comparison returns false because each array is unique even though their value might be the same. This is not the case for  primitives on the right. Primitives are defined by their value and as long as two values are the same the variable comparison will be true. </p>


<p> 2) <strong>Mutability</strong> - You can assign properties or methods to Objects but you cannot do the same with Primitives. Properties or methods can be defined in the object constructor or directly added to the object. Here is what I mean by defining and adding properties or methods to an object: </p>
{% codeblock lang:JavaScript %}
  var Food = function(name){
    this.name = name;                //property
    this.eat = function(){         //method
      return "Yum!";
    }
  }
  >pizza = new Food("pizza")
  >pizza.name                     //outputs => "pizza"
  >pizza.eat                      //outputs =>"yum"
  >pizza.throw_away = "NOOO"    //new property assigned outside the constructor
  >puzza.throw_away              // outputs => "NOOO"
{% endcodeblock %}

<p> You cannot do this with Primitives. Below is a side by side comparison of what happens when you try.</p>
    OBJECT HAS MUTABILITY                                                           PRIMITIVE DOES NOT
{% img /images/object_mutability.png %}
{% img /images/primative_no_mutability.png %}
<p> As you can see, on the left we created a new String object and gave it a banana method. Since the property banana was assigned to the object, it still works when we call it. With primitive on the right that does not work. Even though the variable "another_string" is also just a string, when we try to assign the property banana to it, it returns undefined.</p>


<h4>Wrapper Objects</h4>
<p> Great, JavaScript is finally making some sense. Let's look at this next example. </p>
    WAT
{% img /images/why.png %}
<p> BUT WHYYYYYYY</p>
<p> If primitives don't have properties, then how can you call a method of .length on the primitive above?</p>
 {%img http://cdn1.theodysseyonline.com/files/2015/10/31/635818589835734249370285774_1dfc00bbdb005b909c17c2a19667e8a1.gif img%}</br>

 <p>This is where <strong>Wrapper Objects</strong> come in. A primitive will be coerced into an object to access method called on primitive. The wrapper object is that temporary object that is used. When any method is called on a primitive, this is what happens:</p></br>
 JavaScript says..</br>
"idk. Your string does not respond to the length method. I think what you meant to do is call .length on a string object"</br>
"...Since you are clearly clueless, I will help you out and create a new String for you and check if that has a .length method"</br>
"Since String has that method, I'll let you borrow my "new String" object to mutate your Primitive" </br>

<p>So the following example shows exactly what happens when a Wrapper Object is called. The Primitive actually becomes an object for the duration of that call. I think this is pretty awesome. </p>
    BEHIND THE SCENES WHEN YOU TRY TO CALL FUNCTION ON A PRIMITIVE
{% img /images/what_am_i.png %}
<p>What's happening above is a variation of the .length method. Except slightly different because we are defining our own Number method "whatAmI". By defining it, we make it available to the Number class. When the Wrapper Number Object is called on the 123 number Primitive, our method "whatAmI" is used and for the duration of its use, the number Primitive is actually an object (Number). </p>
