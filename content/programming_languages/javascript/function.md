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
An object is essentially a <code>function</code> with a glorified definition hash: <code>prototype</code>. The <code>function.prototype</code> object 
(hash) behaves like a _factory_ providing method signatures for object creations.


<% uv :lang => 'javascript' do -%>
<% end -%>

call() and apply()
------------------

Reference
---------
* [The many ways to implement inheritance and encapsulation.](http://www.3site.eu/doc/)