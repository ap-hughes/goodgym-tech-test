# README

<h2>About</h2>
A Ruby on Rails app designed to mimic a mailing use case for GoodGym.

It allows a trainer to email multiple bespoke emails to the runners in their area.

The trainer simply fills in form with the specific elements they would like added to an email for specific types of runner (based on their preference and recent activity) and the emails will be compiled and sent to the runners accordingly.

Runners have the benefit of receiving emails which read as if they were written just for them.

<h2>Getting started</h2>
<h3>Versioning & Dependencies</h3>
Ruby Version: 2.4.3
Rails Version: 5.1.6

Additional gems used include:
* letter_opener
* devise
* bootstrap-sass
* simple_form

<h3>Install steps</h3>

* Switch current working directory to location where you want cloned directory to be made
* Clone the repo - <code>git clone git@github.com:ap-hughes/goodgym-tech-test.git</code> and press enter
* Run <code>bundle install</code>
* Run <code>rails db:create</code>
* Run <code>rails db:migrate</code>
* Run <code>rails db:seed</code>
* Run <code>rails s</code> to start server and go to http://localhost:3000/

<h2>The programme</h2>
<h3>Running it</h3>
The homepage will take you to the index page of the areas. Only two are entered in the seed - Manchester and London.

The seed also created two users (the 'trainers'), Ant is responsible for the London area, Anna is responsible for the Manchester area.

Anna's three runners' have the status and preferences described in the task - https://gist.github.com/manzan46/6a1c077564b838419cdb5c8b5b9228de

Ant's runners have a made up array of statuses and preferences.

When you click on the area, you will be prompted to login.

For Manchester, user (trainer) details are as follows
* email: anna@goodgym.com
* password: 123456

For London, user (trainer) details are as follows
* email: ant@goodgym.com
* password: 123456

The programme is run in a development environment. SMTP settings, etc. have not been set up so emails will not be sent. Further, the letter_opener gem allows the preview of emails when 'sent'.

<h3>Areas for improvement</h3>

* Tests
* Both runners and trainers would use a devise model for authentication. Currently the users (trainers) are from devise, the runners belong to the users.
* The UI / UX of the app could be improved. It is currently functional but very bland. It is not immediately clear what the user should do.
* Setting up a preview of the emails, so trainers could see a finalised email and check it before they press send.
