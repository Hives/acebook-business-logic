# AceBook by BusinessLogi&copy;


[![Build Status](https://travis-ci.org/Hives/acebook-business-logic.svg?branch=master)](https://travis-ci.org/Hives/acebook-business-logic) 
[![Maintainability](https://api.codeclimate.com/v1/badges/9e037f53027bc17b54fb/maintainability)](https://codeclimate.com/github/Hives/acebook-business-logic/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/9e037f53027bc17b54fb/test_coverage)](https://codeclimate.com/github/Hives/acebook-business-logic/test_coverage)

#### Checkout [AceBook BusinessLogi&copy; Live Site](https://acebook-business-logic.herokuapp.com)
  
[Description](#Description) | [Getting started](#Getting-Started) | [Running tests](#Running-Tests) | [Usage](#Usage) | [Product Roadmap](#Product-Roadmap) | [User Stories](#User-Stories) | [Learning Documentation](#Learning-Documentation)


----
## Description
This is a team proejct clone of Facebook built using Ruby on Rails, a challenge set by Makers Academy. The original repo can be found [here](https://github.com/makersacademy/course/tree/master/engineering_projects/rails).

## Getting Started
```bash
> git clone https://github.com/Hives/acebook-business-logic
> bundle install
> bin/rails db:create
> bin/rails db:migrate
```
## Running Tests
```bash
> rspec
```

## Usage

```bash
> bin/rails server # Start the server at localhost:3000
```

## Product Roadmap

See our awesome card wall [here](https://trello.com/b/6XSi28FM/acebook-by-business-logic).

## User stories

See the user stories we implemented [here](user-stories.md).

## Learning Documentation
Our learnings can be found on our team wiki [here](https://github.com/Hives/acebook-business-logic/wiki).

## Product Owner Feedback (Michael)
We asked for confirmation that a decision we were making was in line with business requirements (Goal: I can justify my decisions in a business context)
We are about to implement usernames for Acebook users. Those who have already signed up do not have usernames, so we needed to provide them with one in the database for this unique name to now be used to make up the URL of their profile page. We decided to use a generic incrementing name of 'AcebookUser1, AcebookUser2... etc' rather than the user email (for privacy purposes), explaining to the product owner the need for this field, and the justification for our decision. Michael said that this sounds good and was "pretty much how Facebook did it when they implemented usernames as part of the URL"
