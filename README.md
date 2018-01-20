# Blocmarks

Build an application that allows a user to bookmark URLs via email, peruse other user's bookmarks, share bookmarks and maintain a personal index of categorized bookmarks.


## Setup 

#### Languages and Frameworks: 
* Ruby version 2.2.1
* Ruby on Rails 4.2.7 




#### Databases: 
* SQLite (Test, Development) 
* PostgreSQL (Production)

#### Default Development Tools and Gems include:

* Devise  for user authentication
* Pundit for authorization
* Mailgun for email confirmation
* Figaro for secure configuration
* Faker for seeding fake data
* Omniauth for multi-provider authentication
___
#### Configuration:
Figaro creates a _config/application.yml_ file, which sets up and stores  **_environment variables_**, and adds it into your _.gitignore_ file. The _config/application.example.yml_ file demonstrates the appropriate way to store _environment variables_.

##### Run Blocmarks locally: 

* Clone the repository
* Run ``` bundle install ```
* Create the SQLite database with 
 ```
 $ rake db:create
 ```
* Migrate the SQLite database with 
```
$ rake db:migrate
```
* Seed database
```
$ rake db:seed
```
* Start the server using 
```
rails s
```
or

```
rails server
```
* Run the app on **localhost:3000**

### Deploy to Heroku for Production

  ```
  $ git push heroku master
  $ heroku run rake db:migrate
  ```





_Made with my mentor at [Bloc](http://bloc.io)_
