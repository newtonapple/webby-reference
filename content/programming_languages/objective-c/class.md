---
browser_title:  Objective-C Class
title:          Objective-C Class
name:           Objective-C Class
created_at:     2009-01-10 23:38:11.043101 -08:00
filter:
  - wikiwords
  - erb
  - md
  - outline
---

<%= render :partial => '/toc' %>



Class Declaration
-----------------
Objective-C classes are declared using <code>@interface</code> block, and implementations are specified in <code>@implementation</code> block.

<% uv :lang => 'objective-c' do -%>
  // ---- @interface ----
  @interface Fraction : NSObject {  // inherit from NSObject
      int numerator;
      int denominator;
  }
  - (void)print;
  - (void)setNumerator:(int)n;
  - (void)setDenominator:(int)d;
  @end
  
  // ---- @implementation ----
  @implementation Fraction   // you can optionally specify :NSObject after Fraction
  - (void)print { NSLog(@"%i/%i", numerator, denominator); }
  - (void)setNumerator:(int)n { numerator = n; }
  - (void)setDenominator:(int)d { denominator = d; }
  @end
<% end -%>



Properties
--------
<code>@property</code> is a shortcut for declaring <em>getter</em> and <em>setter</em> methods on your 
class' instance variables. It is a feature only available in Objective-C 2.0. Not only are these 
<em>synthesized</em> <em>getters</em> and <em>setters</em> atomic i.e. thread-safe, the <em>setter</em> 
methods will also automatically <code>release</code> the overwritten objects. 

### More Resources
* [Apple Doc](http://developer.apple.com/DOCUMENTATION/Cocoa/Conceptual/ObjectiveC/Articles/chapter_5_section_1.html)
  the official documentation on properties.
* [Cocoa with Love](http://cocoawithlove.com/2008/08/in-defense-of-objective-c-20-properties.html) 
  has more on the merit of property.
* [Cocoacast](http://cocoacast.com/?q=node/103) a tutorial on property.
* [Wikipeida](http://en.wikipedia.org/wiki/Objective-C#Properties) 
  Objective-C 2.0 Properties.
