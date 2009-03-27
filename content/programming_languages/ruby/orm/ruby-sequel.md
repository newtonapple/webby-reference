---
browser_title:  Sequel
title:          Sequel
name:           Sequel
created_at:     2009-03-26 20:53:41.621351 -07:00
filter:
  - wikiwords
  - erb
  - md
  - outline
  - section
---

<%= render :partial => '/toc' %>


## Connection

You can connect to a database using the generic <code>connect</code> method.


### Generic Connect

<% uv :lang => 'ruby' do -%>
  DB = Sequel.connect('mysql://root@localhost/sequel_sandbox');
  DB = Sequel.connect('postgres://user:password@localhost/my_db')
<% end %>



### DB Specific

<% uv :lang => 'ruby' do -%>
  DB = Sequel.sqlite  # in memory
  DB = Sequel.sqlite('my_blog.db')
  DB = Sequel.mysql('my_db', :user => 'user', :password => 'password', :host => 'localhost')
  DB = Sequel.ado('mydb')
<% end %>


## Reference

* [Cheat Sheet](http://sequel.rubyforge.org/rdoc/files/doc/cheat_sheet_rdoc.html)