# README

<h2>Getting started</h2>

<h3>About</h3>
A Ruby on Rails app designed to mimic a mailing use case for GoodGym.

It allows a trainer to email multiple bespoke emails to the runners in their area.

The trainer simply fills in form with the specific elements they would like added to an email for specific types of runner (based on their preference and recent activity) and the emails will be compiled and sent to the runners appropriately.

<h3>Versioning & Dependencies</h3>
Ruby Version: 2.4.3
Rails Version: 5.1.6

Additional gems used include:
letter_opener
devise
bootstrap-sass
simple_form

<h3>Database creation</h3>
Run rails db:migrate
Run rails db:seed

This will create two users (the 'trainers')

<h3>Areas for improvement</h3>


* Tests
* The UI / UX of the app could be improved. It is very bland but functional.
*

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies


* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
