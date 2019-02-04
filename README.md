# Parsing a weblog

Write a ruby script that:
1. Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log
2. Returns the following:
  * list of webpages with most page views ordered from most pages views to less page      views    
    * e.g.: /home 90 visits /index 80 visits etc...
  * list of webpages with most unique page views also ordered
    * e.g.: /about/2 8 unique views /index 5 unique views etc...

## Thought process

It's been quite some time since I've TDD'd and specifically since I've TDD'd or even coded in Ruby. This was a great refresher and confirmed how much I like coding in Ruby. Currently the project has 100% code coverage but I have a concern that I was might have been stubbing incorrectly. Right now, I'm not particularly happy with the way my spec_file looks. I attempted to refactor initializing the class but according to the Rspec docs, I am not able to use a `before :each` with `let` statements however I just found `let!` that can be used in lieu of a `before` statement. If I had more time, I would implement that. Also, upon rereading the tech test, I realized that I forgot to sort for unique views. If I were to continue to work on this, I would add a test and method that would check that pages with duplicate ids were not added into the final count for unique views. Perhaps I would also create a display method since the `descending_order` method actually does two things - both sorting the array and formatting the view. 
