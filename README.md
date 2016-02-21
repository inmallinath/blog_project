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

### Assignment: [Blog] Write Tests for the Blog Post model

Write tests for your `Post` model in your Blog project.  Add tests for the following:

* Validation of the presence of Post's title
* Validation of the minimum length of Post's title (7 characters)
* Validation of the presence of Post's body
* Test drive a method `body_snippet` method that returns a maximum of a 100 characters with "..." of the body if it's more than a 100 characters long.

### Assignment: [Blog] Write tests for controller actions

* Write tests for the Blog Posts controller actions: new / create / show / index
* **Stretch 1:** Also write tests for the edit / update / destroy actions
* **Stretch 2:** Do the above in TDD style

### Assignment: [Blog] Practice Pull Requests

Practice Git Pull Requests by doing the following:

* In your Blog project create a new branch.
* Add a simple feature to your project. It can be as simple as changing the colour of text.
* Push your branch to Github.
* Make a pull request from your new branch to the master branch.
* Ask a friend or TA to review your Pull Request.
* Merge your Pull Request on Github.
* Pull the latest master to your computer and verify that the code you added on the new branch is there.

### Assignment: [Blog] Comments

* Each post needs comments, so build a way to add comments to posts.
* Each comment must have a "body".
* Make sure that on the post show page you list all the comments ordered by creation date. List the most recent at the top.

### Assignment: [Blog] Add Categories

* Add categories to your Blog tool, make sure that you seed file creates at least 10 categories. Implement the ability to select one category from a drop down when creating a blog post.

### Assignment: [Blog] ERD

* Build an ERD diagram for you Blog tool for what you know about it so far. Feel free to add more features if you want. Keep in mind that the ERD may change later as you learn more about adding other features.

### Assignment: [Blog] User Authentication

* Add standard user authentication for your Blog. Make sure your user has first name, last name and email.
* Associate records with the user model as per your ERD.

### Assignment: [Blog] Edit User

* Implement the ability to edit the user's first name, last name and email for your blog project. Make it so when the user clicks on his/her name they go to a page where they can edit their information.

### Assignment: [Blog] Change Password

* Implement the ability to change the password for your users on the Blog tool. The page must contain three fields: current password, new password and new password confirmation. The user must enter a correct current password and matching new password and new password confirmation. Make sure that the new password is different from the current password.

### Assignment: [Blog] Deploy to Heroku

* Deploy your Blog tool to production on Heroku. Get into the habit of deploying frequently. Maybe every week.

### Assignment: [Blog] Permissions

* Enforce the following permissions in your Blog application:
* Only signed in users can create blog posts or comments
* Only the creator of blog posts can edit or delete them
* Only the creator of comments or the creator of blogs can delete comments
* Have an admin user that can do anything

### Assignment: [Blog] Forgot Password

Implement a forgot password feature for your Blog application that works as follows:
* In the sign-in page have a link called "forgot password? click here"
* The link above should take the user to a page where they can enter their email
* After entering their email and hitting `submit` the user should technically get an email with a link. Don't worry about sending an email now as we haven't heard that yet but make sure you have a link with a token to reset the password.
* When the user visits the page with that link it should show three fields: new password and new password confirmation
* To change the password the user must enter matching password
* The user is redirected to the sign-in page to sign in with new credentials

* **[Stretch]:** Make the reset password link expire in three days

### Assignment: [Blog] Account locking Skip Next Module

* Implement the ability to lock an account if there have been 10 failed sign in attempts to your Blog tool. After that they must use the `forgot password` feature to reset the password.

### Assignment: [Blog][Challenge] Reverse Engineer `has_secure_password` Next Module

* The `has_secure_password` feature is a solid one and in most circumstances you don't need to write you own or change it. For the sake of practice comment out `has_secure_password` and make sure your Blog application still works. Remember to ensure that the password gets Hashes and remember to make sure you have an `authenticate` method that works as the built-in one does. Also, make sure to have the same built-in validations.

### Article: Bootstrap Blog

* Update your blog site using bootstrap where appropriate.

### Article: Bootstrap Supporter

Utilize the following bootstrap features:

* navbar
* forms
* grids
* glyphs
* tables
