---
browser_title:  JavaScript Function
title:          JavaScript Function
name:           JavaScript Function
created_at:     2009-02-12 22:17:54.632689 -08:00
filter:
  - wikiwords
  - erb
  - md
  - outline
  - section
---

<%= render :partial => '/toc' %>


Function as Object
------------------

[[JavaScript]] uses [Prototypal Inheritance](http://javascript.crockford.com/prototypal.html) in place of the classical OOP class inheritance model. 
A <code>class</code> is essentially a <code>Function</code> with a glorified definition hash: <code>prototype</code>. The <code>Function.prototype</code> 
object (hash) behaves like a _factory_ providing method signatures for object creations. Within the class' <code>constructor</code>  and 
<code>instance methods</code>, the variable <code>this</code> refers to the instance object itself.

### Function Object
Defining an class is as simple as assigning a <code>function</code> to a varialbe.  This _object function_ acts as the <code>constructor</code> / 
<code>initializer</code> for the class. By JavaScript convention, the class name is always [CamelCased](http://en.wikipedia.org/wiki/CamelCase).

<% uv :lang => 'javascript' do -%>
  var Animation = function( type, speed ) {
      this.type = type;
      this.speed = speed;
  }
<% end -%>

### Prototype
<code>Instance methods</code> are defined in the function object's <code>prototype</code> hash.  By defining <code>Function.prototype</code> every new 
object created for that given class will inherit the instance methods specified by its the <code>prototype</code>. 

<% uv :lang => 'javascript' do -%>
  Animation.prototype = {
      start: function() { 
          console.log('Rendering animation ' + type + ' at ' + speed);
          // ... render animation ...
      },
      stop:  function() { 
          console.log('Animation ' + type + ' has stopped.');
          // stop animtion    
      }
  }

  var animation = new Animation( 'blind', 1000 );
  animation.start();
  animation.stop();
<% end -%>


call() and apply()
------------------

Reference
---------
* [The many ways to implement inheritance and encapsulation.](http://www.3site.eu/doc/)