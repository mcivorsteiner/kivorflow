# Stack Kivorflow
### DESCRIPTION
Simple clone of Stack Overflow using Rails, heavy AJAX, responsive design, RSpec, polymorphic associations and more.  This was a project for Dev Bootcamp, but was a solo project, all code was written by me.  

[stack-kivorflow.herokuapp.com](http://stack-kivorflow.herokuapp.com/)


### USER STORIES
- An anonymous user can sign up
- An registered user can log in
- A logged in user can log out
- An anonymous user / authenticated user can see a list of questions
- An anonymous user / authenticated user can click on a question to see it
- An authenticated user can post a question
- An authenticated user can edit their own question, can delete their own question
- Authenticated users can provide an answer to a question
- Authenticated users can provide an comment to a question
- Any user can visit a question page and can see the question and its answers and comments
- Authenticated users can upvote or downvote questions and answers

### SCHEMA
User:
- has many questions
- has many answers
- has many comments
- has many votes

Question:
- belongs to user
- has many answers
- has many comments (as commentable)
- has many votes (as votable)

Answer:
- belongs to user
- belongs to question
- has many comments (as commentable)
- has many votes (as votable)

Comment:
- belongs to user
- belongs to commentable (question or answer)

Vote:
- belongs to user
- belongs to votable (question or answer)