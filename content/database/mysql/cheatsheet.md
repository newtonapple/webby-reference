---
browser_title:  MySQL Cheatsheet
title:          MySQL Cheatsheet
name:           MySQL Cheatsheet
created_at:     2009-02-10 14:37:01.088204 -08:00
filter:
  - wikiwords
  - erb
  - md
  - outline
  - section
---

<%= render :partial => '/toc' %>


Command Line
------------

### Create & Drop Database
<% uv :lang => 'shell-unix-generic' do -%>
  mysqladmin -uroot -p create database 
  mysqladmin -uroot -p -f drop database # -f is for no prompt
<% end %>

### Batch mode 

Use option <code>-t</code>for nice table layout and option <code>-vvv</code> for command echoing:  

<% uv :lang => 'shell-unix-generic' do -%>
  mysql ­u user ­p -t -vvv < batch_file
<%end %>

Alternatively you can use this in mysql console:
<% uv :lang => 'shell-unix-generic' do -%>
  mysql> source batch_file;  
<% end %>

### MySQL Dump
<% uv :lang => 'shell-unix-generic' do -%>
  # Backing up a database with mysqldump (Use 'mysqldump ­­opt ­­all­databases):
  mysqldump -uroot -p database > database_backup.sql 
  # Just the schema definition:
  mysqldump -d -hlocalhost -uroot -p database > dumpfile.sql
  # You can also export a particular table:
  mysqldump -uroot -p database name_of_table > tablefile.sql

  # Dump a table w/ within a time span
  mysqldump database table_name --where='created_at < NOW() - INTERVAL 1 MONTH' > tablefile.sql

  # To import 
  mysql -uroot database_name < dumpfile.sql
<% end %>



Meta-data
--------

<% uv :lang => 'sql' do -%>
  USE database;                   ### Selecting a database
  SELECT DATABASE();              ### Currently selected database
  SHOW DATABASES;                 ### Listing databases
  SHOW TABLES;                    ### Listing tables in a db 
  DESCRIBE table;                 ### Describing the format of a table
  CREATE DATABASE db_name;        ### Creating a database
<% end -%>



Table Manipulations
----------------

### Alter
<% uv :lang => 'sql' do -%>
  ALTER TABLE tbl ADD COLUMN [column_create syntax] AFTER col_name;      # Adding a column to an already­created table
  ALTER TABLE tbl DROP COLUMN col;                                       # Removing a column
  ALTER TABLE table_name ADD INDEX index_name (col_name);                # Adding index to an existing table;
<% end -%>

#### Altering Multiple Columns in One Command
This usually runs much faster comparing to altering table multiple times) 
<% uv :lang => 'sql' do -%>
  ALTER TABLE authors 
    ADD     name VARCHAR(255), 
    CHANGE  author_work_id wokr_id INT,
    DROP    nickname,
    CHANGE `count(*)` cnt bigint(21),  ### renaming
    ALTER   is_rich SET DEFAULT FALSE;
<% end -%>


### Create Table
<% uv :lang => 'sql' do -%>
  CREATE TABLE table_name (field1_name TYPE(SIZE), field2_name TYPE(SIZE));  
  CREATE TABLE pet (name VARCHAR(20), sex CHAR(1), birth DATE);
  CREATE TABLE table (number INT NOT NULL AUTO_INCREMENT, name  CHAR(10) NOT NULL);    # auto incrementing a column
<% end -%>

### Drop Tabble
<% uv :lang => 'sql' do -%>
  DROP TABLE table_name
<% end -%>




Insert
------

<% uv :lang => 'sql' do -%>
  INSERT INTO table (name) VALUES ("tom"),("dick"),("harry");            # Batch Insert w/ given name column
  INSERT INTO table_name VALUES ('MyName', 'MyOwner', '2002­08­31');     # Inserting one row at a time (Use NULL for NULL)
<% end -%>


Load
----

<% uv :lang => 'sql' do -%>
  LOAD DATA LOCAL INFILE "infile.txt" INTO TABLE table_name;             # Load tab­delimited data into a table (Use \n f or NULL)
<% end -%>

### Reloading a New data Set Into an Existing Table
<% uv :lang => 'sql' do -%>
  SET AUTOCOMMIT=1;  ### used for quick recreation of table  
  DELETE FROM pet;  
  LOAD DATA LOCAL INFILE "infile.txt" INTO TABLE table;  
<% end -%>


Select
------

<% uv :lang => 'sql' do -%>
  SELECT from_columns FROM table WHERE conditions;                       # Retrieving information (general):  
  SELECT * FROM table;                                                   # All values 
  SELECT * FROM table WHERE rec_name = "value";                          # Some values
  SELECT * FROM TABLE WHERE rec1 = "value1" AND rec2 = "value2";         # Multiple critera
                                                                          
  SELECT column_name FROM table;                                         # Selecting specific columns
  SELECT DISTINCT column_name FROM table;                                # Retrieving unique output records
  SELECT col1, col2 FROM table ORDER BY col2;                            # Sorting
  SELECT col1, col2 FROM table ORDER BY col2 DESC;                       # Sorting Backward
  SELECT COUNT(*) FROM table;                                            # Counting Rows
  SELECT owner, COUNT(*) FROM table GROUP BY owner;                      # Grouping with Counting
  SELECT MAX(col_name) AS label FROM table;                              # Maximum value
  
  SELECT pet.name, comment FROM pet, event WHERE pet.name = event.name;  # Selecting from multiple tables (You can join again the same table by alias w/ "AS")
<% end -%>

#### Select with Time
* <code>MONTH(some_date)</code> extracts the month value.
* <code>DAYOFMONTH()</code> extracts day.

<% uv :lang => 'sql' do -%>
  SELECT CURRENT_DATE, (YEAR(CURRENT_DATE)­YEAR(date_col)) AS time_diff [FROM table]; 
<% end -%>

#### Select with LIKE:  
<% uv :lang => 'sql' do -%>
  SELECT * FROM table WHERE rec LIKE "blah%";  # % is wildcard ­ arbitrary ### of chars
  SELECT * FROM table WHERE rec like "_____";  # Find 5­char values: _ is any single character
<% end -%>

#### Select with RLIKE / REGEXP:
* <code>.</code> for char
* <code>[...]</code> for _char class_ 
* <code>*</code> for _0 or more_ instances  
* <code>^</code> for _beginning_ 
* <code>{n}</code> for _repeat n times_
* <code>$</code> for _end_
* (<code>RLIKE</code> or <code>REGEXP</code>)  

<% uv :lang => 'sql' do -%>
  SELECT * FROM table WHERE rec RLIKE "^b$";  
<% end -%>


Update
------

<% uv :lang => 'sql' do -%>
  UPDATE table SET column_name = "new_value" WHERE record_name = "value";  # Fixing all records with a certain value
<% end -%>




