---
browser_title:  Objective-C Types
title:          Objective-C Types
name:           Objective-C Types
created_at:     2009-01-08 15:14:07.970451 -08:00
filter:
  - wikiwords
  - erb
  - md
  - outline
---

<%= render :partial => '/toc' %>


Types
-----

### class

[[Objective-C]] classes are declared using <code>@interface</code> block and implementations are specified in <code>@implementation</code> block.

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


### double

<code>double</code> is guaranteed to be at least 64-bit.  All numeric constants are by default assumed to be a <code>double</code> unless specified 
with either am <code>f</code> or <code>F</code>.

<% uv :lang => 'objective-c' do -%>
  12.31  // minimum 64-bit double 
  12.31f // minimum 32-bit float
  12.31F // minimum 32-bit float
<% end -%>