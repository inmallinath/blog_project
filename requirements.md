# Project - Blog
---
## Requirements for the Controller

### Assignment: Blog - Getting Started Next Module

#### Here is what you need to do:

* Setup empty Rails project (make sure it's version 4.2 or more)
* Make sure that the project uses postgres database
* Create controller "home" that handles home and static pages
* Create a page "About" which has information about the tool (anything for now).
* Add your photo and information in the about page (link to external photo of you for now)
* Create a navigation bar that applies to all pages. The navigation bar must include links to "home" and "about" pages
* Put all of your code on GitHub (or BitBucket)
Submit the Github link.

## Requirements for the Model

### Assignment: Blog - Build your models

* Here are a summary of suggested fields and validations (feel free to add to those)
* Post: title(required & unique), body
* Comment: body (required & unique per blog post)
* Category: title(required)
* Contact: email, name, subject and message

## CRUD Requirements

### Assignment: [Blog] Posts

* Build CRUD for the posts in your blog with:
* Ability to list all the posts in the app
* Ability to view a page with a form to create a new post
* Ability to click "submit" on the form and create the post
* It shouldn't allow creating posts without a title
* On the listing page there should be a link to visit the post display page
* That page should have "edit" and "delete" links
* Clicking the edit link should go to a page similar to the one for creating new post, except that it should say "editing post" and should be pre-populated with post info
* Clicking "delete" should prompt the user "Are you sure you want to delete this post" and if the user clicks "yes" it should delete the post from database and take user back to listing page.

### Assignment: [Blog] Comments Next Module

* Implement full CRUD operations for Comment resource in the Blog. Very similar to the Post resource.

### Assignment: [Blog] [Challenge] Searching

* Implement the ability to search for a project by a search field that matches with either the title or body of the blog.

### Assignment: [Blog] [Challenge] Pagination

* Implement pagination for listing blog posts.

##### Here are the features that should be implemented:

* Pagination should only show if there is more than 10 records in database
* Next button that takes you to the next page
* Previous button that takes to the previous page
* If you are on the first page the previous button should be disabled
* If you are on the last page the next button should be disabled.

##### Do this in two ways:
* 1- Without using a gem, build it from scratch.
* 2- Using a gem.

### Assignment: [Blog] Write Tests for the Blog Post model Next Module

Write tests for your `Post` model in your Blog project.  Add tests for the following:

* Validation of the presence of Post's title
* Validation of the minimum length of Post's title (7 characters)
* Validation of the presence of Post's body
* Test drive a method `body_snippet` method that returns a maximum of a 100 characters with "..." of the body if it's more than a 100 characters long.

### Assignment: [Blog] Write tests for controller actions Next Module

* Write tests for the Blog Posts controller actions: new / create / show / index
* Stretch 1: Also write tests for the edit / update / destroy actions
* Stretch 2: Do the above in TDD style

### Practice Git Pull Requests by doing the following:

* In your Blog project create a new branch.
* Add a simple feature to your project. It can be as simple as changing the colour of text.
* Push your branch to Github.
* Make a pull request from your new branch to the master branch.
* Ask a friend or TA to review your Pull Request.
* Merge your Pull Request on Github.
* Pull the latest master to your computer and verify that the code you added on the new branch is there.
