## Web Development Assignment

We would like to thank you for taking the time to complete this assignment. We believe this to be an effective way at allowing you to show us your skills, on your own time, without the pressure of someone looking over your shoulder. Your code will be used to help us decide if we'd like to proceed with the interview process. Please understand that completing this assignment doesn't guarantee a job or follow up interviews. We will keep you posted either way. Please reach out to techops@doximity.com with any questions. 


### Setup

Run `bin/setup` and then boot the app with `rails server`

### Running Tests

Run `bundle exec rspec`

------------

## Assignment Instructions

* **FORK** this repository, create a branch, complete all 3 stories and create a pull-request pointing at ****YOUR**** fork with your changes.
* Once completed, email a link to your Pull Request to techops@doximity.com 
* Code Style Guide can be found [here](https://github.com/bbatsov/ruby-style-guide), use 2 soft-tabs.

## A Few Considerations

* Tests are highly encouraged.
* Don't disregard performance optimizations, sure there's a small amount of articles today, but what if there were 500k?
* We're not concerned with CSS styling, `/components` does have some guidance if you must.
* Avoid pushing indentation changes to current files, this makes the changeset harder to read.

## What to Expect after you Submit

Our team will be notified and we'll review the submission within 2 days. We'll run code analysers to check for added complexity, spec coverage, and adherednce to style. Most importantly three engineers will review your code. We're looking for clean, easy to read, maintainable code. Good test coverage, and performance considerations and optimizations are a plus as well. We know your time is valuable and appreciate you taking the time to complete this assignment.


### Story 1
```
Story Title: As a reader I would like to search the blog so
that I can find articles which interest me.

Description: Leverage the current sidebar HTML under 'Search Articles'
to provide in-place searching functionality. 
Using MySQL `like` is perfectly fine. Use an AJAX request to add
the search results to the page without a full page reload.
Paginate to 5 results, paginating should also happen without a full
page refresh. Search against article body and title.
```

### Story 2
```
Story Title: As a reader I would like to see search
suggestions as I start typing my search query so that
I can get results with less typing.

Description: Provide search suggestions when I type in the search
input field. Selecting a search suggestion should perform a search
using the suggested keywords. Search against article title only.

```

### Story 3
```
Story Title: As a reader I would like my search results to be sorted by
relevancy according to my search query so that I see the most relevant
results at the top.

Description: Using a Ruby class and a simple word analyses algorithm
assign a relevancy score to each article based on the query provided.
Do not use a search engine library, you need to create your own algorithm.
Incorporate this relevancy score in the sort order of the search results.
Search against article body and title. An article that contains the same
word twice would have a relevancy score that is higher than an article
which only contains the searched word once. Title of the article should
weigh relevancy more heavily. 

Bonus points for performance considerations, caching and pre-calculating tokens.
```
