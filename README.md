# rails-module-has-many
> Rails module for one to many.


## Step by step
+ create database:
```bash
rake db:create
```
+ create issues
```bash
## generate model:
rails g model Issue title:string

## OR 'create table issues'
rails g migration CreateIssues

## migrate db:
rake db:migrate
```

+ create comments
```bash
## craete model and migration file:
rails g model Comment content:text username:string email:string issue_id:integer
## migrate db:
rake db:migrate
```

## 3 key points:
+ Comments table must have `issue_id`
+ Issue model must have this structure:
```ruby
class Issue < ApplicationRecord
    has_many :comments
end
```
+ Comment model must have this structure:
```ruby
class Comment < ApplicationRecord
    belongs_to :Issue
end
```


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
