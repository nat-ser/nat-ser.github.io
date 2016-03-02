---
layout: post
title: "parser with method chaining"
date: 2016-02-21
comments: true
categories: "flatiron_school"
---
<h4>Chaining as we know it </h4>
When you hear chaining methods, you think of something like this:
{% codeblock lang:Ruby %}"steak".upcase.reverse {% endcodeblock %}
However, what I took for granted was that 'upcase' and 'reverse' are built-in methods of the String Class, which means that both of those methods are available to any string because it is an instance of the String Class.

<h4> Custom chaining</h4>
What happens when you create your own class and want to chain methods together in this manner? For example, you want to build a data parser that allows you to do this:
{% codeblock lang:Ruby %}
food_hash = Finder.new
food_hash.product.location
{% endcodeblock %}
instead of:
{% codeblock lang:Ruby %}
food_hash = Finder.new
food_hash[:product][:location]
{% endcodeblock %}
This is more complicated than it looks. Let's dive right into an example that shows how to do this.

<h4>Step by Step Example of Method Chaining </h4>
<h4>Problem:</h4>
We have this nested hash called food_info.
{% codeblock lang:Ruby %}
food_info = {fridges:
              {person:
                {grandma:["cauliflower", "sour cream", "couch candy"],
                flatiron_school: ["donuts", "coffee", "siracha"],
                steven:["beef", "ham"]}
              },
            restaurants: "McDonalds"
}

{% endcodeblock %}
Your parsing code should return an object that allows you to access attributes using method calls:

puts object.fridges.person.grandma
####outputs ["cauliflower", "sour cream", "couch candy"]

First example, is simply searching by key. The second example shows what would happen if we tried to do the same action in a different way.

{% codeblock lang:Ruby %}
#this is the normal way to access value
 puts food_info[:fridges][:person][:grandma] ##outputs ["cauliflower", "sour cream", "couch candy"]
#out ultimate objective is for this to work but as of now, it breaks
 puts food_info.fridges.person.grandma ##outputs NoMethoderror
{% endcodeblock %}

When we run this code it outputs the following:
{% img /images/oh_no.png %}

As you can see, the first method works in the way we would expect it to. The second blows up because we cannot call the <strong>fridges</strong> method because it does not exist.
Let's say <strong>fridges</strong> method did exist as part of the class and also <strong>person</strong> and <strong>grandma</strong> methods. If we called
<strong>puts food_info.fridges.person.grandma</strong>
it would also blow up at <strong>.person</strong> and complain that the method does not exist. This is because the <strong>food_info.fridges</strong> is no longer an instance of the same class but rather an instance of the hash class.

Below are the two ways to fix this.



<h4>Solution 1</h4>

{% codeblock lang:Ruby %}
class Finder

  def initialize(food_info)
    @food_info = food_info
  end


  def fridges
  #after this runs, alters value of @food_info to @food_info[:fridges]
    Finder.new(@food_info[:fridges])
  end

  def person
  #so here we don't have to call the whole chain @food_info[:fridges][:person]
    Finder.new(@food_info[:person])
  end

  def grandma
    @food_info[:grandma]
  end

end
hungerz = Finder.new(food_info)

puts hungerz.fridges.person.grandma
####outputs ["cauliflower", "sour cream", "couch candy"]
{% endcodeblock %}
This solves the problem of method availability by creating a new instance of the class as a return value for each method. This allows us to then call the methods in one line. What this means is that when one instance method gets called, it return an actual instance of the class instead of a regular return value. That way another method of the same class can be called on the return value of its sibling method.

In the solution above, after the fridges method is first called, it returns an instance of the Finder class itself so that the person method is no longer getting called on a Hash value. The grandma method does not return an instance of the class because it is last in the chain.

<h4>Solution 2</h4>
{% codeblock lang:Ruby %}
class Finder

  def initialize(food_info)
    @food_info = food_info
  end

  def fridges
    @fridges = @food_info[:fridges]
    self
  end

  def person
    @person = @fridges[:person]
    self
  end

  def grandma
    @person[:grandma]
  end

end

hungerz = Finder.new(food_info)

puts hungerz.fridges.person.grandma

####outputs ["cauliflower", "sour cream", "couch candy"]
{% endcodeblock %}

This is another solution using self to do the same thing as above.
