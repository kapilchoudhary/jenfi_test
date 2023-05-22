# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    3.0.0
* System dependencies
    Ubuntu 20.04.6 LTS
* Database creation
    db: sqlite
    rails db:create
* Database initialization
    rails db:seed
* How to run the test suite
    rspec
* Services (job queues, cache servers, search engines, etc.)
    CheckTrainStatus.perform_now in rails console
* Deployment instructions
    bundle install
    rails db:create
    rails db:migrate
    rails db:seed
    rails s
* Project Details-
    I've created a web application with minimal FE support and database, With the help of it's FE you can sign up as a user with different roles. With different roles you get different combination of functionality. I've added a job with whenever gem to check train status every minute and update it. Some records are already created in the seed. I've also added rspec with factory bot and shoulda matchers to write test cases. 
