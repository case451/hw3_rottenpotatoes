# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then "I should see (.*) (before|after) (.*)" do |e1, order, e2|
  # assign a variable 'regex' here that creates a regular expression
  #  to match the page content against, to make sure that e1 occurs
  #  before or after e2 as specified in the step.
  page.content.should match(regex)
end
