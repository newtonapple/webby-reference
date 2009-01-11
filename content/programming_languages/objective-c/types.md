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

See: [[Objective-C Class]].

### double

<code>double</code> is guaranteed to be at least 64-bit.  All numeric constants are by default assumed to be a <code>double</code> unless specified 
with either am <code>f</code> or <code>F</code>.

<% uv :lang => 'objective-c' do -%>
  12.31  // minimum 64-bit double 
  12.31f // minimum 32-bit float
  12.31F // minimum 32-bit float
<% end -%>