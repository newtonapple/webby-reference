---
browser_title:  Ruby Class
title:          Ruby Class
name:           Ruby Class
created_at:     2008-12-20 14:23:55.902750 -08:00
filter:
  - wikiwords
  - erb
  - md
  - outline
  - section
---

<%= render :partial => '/toc' %>




Relationships of Class, Module, and Object 
-------------------------------------------
* vertical arrows represent inheritance
* parentheses represent meta-classes
* all metaclasses are instances of the class <code>Class</code>

<% uv :lang=>'ruby' do -%>    
                              +------------------+
                              |                  |
                Object---->(Object)              |
                 ^  ^        ^  ^                |
                 |  |        |  |                |
                 |  |  +-----+  +---------+      |
                 |  |  |                  |      |
                 |  +-----------+         |      |
                 |     |        |         |      |
          +------+     |     Module--->(Module)  |
          |            |        ^         ^      |
     OtherClass-->(OtherClass)  |         |      |
                                |         |      |
                              Class---->(Class)  |
                                ^                |
                                |                |
                                +----------------+
<% end -%>

* [Object Doc](http://ruby-doc.org/core/classes/Object.html)



Module 
-------

* [Module Doc](http://ruby-doc.org/core/classes/Module.html)
* [Taxonomy of Rails Plugins](http://alexyoung.org/articles/show/40/a_taxonomy_of_rails_plugins)
* Module is collection of methods and constants.
* Methods in a module may be instance methods or module methods.
* Instance methods appear as (instance) methods in a class when the module is included, module methods don't.
* Module methods may be called without creating an encapsulating object, instance methods may not.

<% uv :lang=>'ruby' do -%>
  module Mod
    include Math
    CONST = 1
    def meth
      #  ...
    end
  end
  Mod.class              #=> Module
  Mod.constants          #=> ["E", "PI", "CONST"]
  Mod.instance_methods   #=> ["meth"]
<% end -%>


### Mod.included( other_mod )

Callback invoked whenever the receiver is included in another module or class.

<% uv :lang=>'ruby' do -%>
  module A
    def A.included(mod)
      puts "#{self} included in #{mod}"
    end
  end

  module Enumerable; include A; end  # => "A included in Enumerable"
<% end -%>

A common Ruby idiom for using <code>mod.included</code>:

* Type: "mod"-tab in Textmate, and select option 3 to generate the following template

<% uv :lang=>'ruby' do -%>
  module FooBar
    module ClassMethods
      def foo; puts "class method: foo()"; end
      def bar; puts "class method: bar()"; end
    end
  
    module InstanceMethods
      def foo; puts "instance method: foo()"; end
      def bar; puts "instance method: bar()"; end
    end
  
    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end

  class A; include FooBar; end
  A.foo       # => class method: foo()
  A.bar       # => class method: bar()
  A.new.foo   # => instance method: foo()
  A.new.bar   # => instance method: bar()
<% end -%>

An example for adding associations to ActiveRecord. 
<% uv :lang=>'ruby' do -%>
  module TasksAssociation
    def task_names
      tasks.map(&:name)
    end

    def self.included(klass)
      klass.has_many_and_belongs_to :tasks
    end
  end

  class Todo < ActiveRecord::Base
    include TasksAssociation  # gain todo.tasks and todo.task_names
  end
<% end -%>


### Mod.extend

You can use <code>extend self</code> trick to turn all instances methods into class methods of the module:

<% uv :lang=>'ruby' do -%>
  module A
    extend self  # all instances methods now become class methods
    def foo; 'foo'; end
    def bar; 'bar'; end
  end

  A.foo  # => 'foo'
  A.bar  # => 'bar'
<% end -%>




Class
-----

* [Class Doc](http://ruby-doc.org/core/classes/Class.html)
* Ruby classes are first-class objects: each is an instance of class <code>Class</code>.
* New class is created by instantiating a new object of type <code>Class</code>.  The object is assigned to a global constant (the Name of the class).
* When <code>Name.new</code> is called, the <code>new</code> (instance) method in <code>Class</code> is run by default.


### Class.inherited

<code>class.inherited</code> is a callback that gets invoked whenever a subclass of the current class is created.

<% uv :lang=>'ruby' do -%>
  class Foo
    def self.inherited(subclass)
       puts "New subclass: #{subclass}"
    end
  end

  class Bar < Foo; end    # outputs => New subclass: Bar
  class Baz < Bar; end    # outputs => New subclass: Baz (class method is "inherited" as well)
<% end -%>


### Class.superclass

Returns the superclass of class, or nil

<% uv :lang=>'ruby' do -%>
  File.superclass     #=> IO
  IO.superclass       #=> Object
  Object.superclass   #=> nil
<% end -%>

