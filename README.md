# README

[Project_03] Ajax Commenting App with User Authentication

- GOAL
  * Create a commenting app where "users" can make comments.
  * Users have to be authenticated.
  * Comment destroy, edit actions specific to original user that created them.
  * User have profile page listing all comments created by 'this' user.
  * Comment index page shows all comments and comment form using ajax.
  * Style and make app more interactive with bootstrap and jquery.
    . Comment create form should pop up and fill screen when new comment is clicked.
    . After :nth(5) comments, older comments should be hidden
    . Toggle show hidden comments



- User model
  * Attributes
    . username - validate
    . password - validate
    . email    - validate

  * Association
    + has_many
      . comments


- Comment model
  * Attributes
    . body     - validate
    . user_id  - validate

  * Association
    + belongs_to
      . user
