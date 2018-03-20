## Space Cowboys Hunting Bounties

You are going to make a single table program to help Space Cowboys track their bounties.

An entry in the bounty table must have a selection of 4 of these properties:

- name
- species
- bounty value
- danger level (low, medium, high, ermagerdyerderd)
- last known location
- homeworld
- favourite weapon
- cashed_in
- collected_by

## Task

### MVP

1. Set up your directory structure DONE
2. Create `console.rb` which will be used to create some new objects and practice your methods as required (use this as you are writing the class & methods to test them) DONE
3. Create a Ruby file for your Bounty class - `Bounty` DONE
4. Write your class definition in the file - `initialize`, `attr_reader`s, instance variables
5. Make a database called `bounty_hunter` (`createdb` in command line)
6. Make a .sql file and write some SQL to create your database table called `bounties`
7. Run the .sql file to set up the table (`psql -d data_base_name -f file_name.sql`)
8. Implement `save`, `update` and `delete` methods on your class

### Extensions

9. Implement a `find_by_name` method that returns one instance of your class when a name is passed in, or nil if no instance is found. Note: this will probably be another class method `ClassName.find_by_name(name)` (do you have to use a map method if it's a single result?)
10. Implement a second `find` method that returns one instance of your class when an id is passed in. 
