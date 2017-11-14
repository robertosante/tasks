# README

## Synopsis

Simple Tasks Api, the Api uses JWT to authenticate. You must have a valid user to be able to authenticate. Then you can edit, delete and create tasks, the Api will give a full list of your current taks.

## Code Example

You can create users in the console: 

```
User.create!(email: "myemail@email.com", password: "mypassword", password_confirmation: "mypassword")
```

To make a request to get your token: 

```
curl --data "email=myemail@email.com&password=mypassword" http://localhost:3000/authorize
```

You can create posts using postman or curl: (expiration_date is optional)
```
{
  "task": {
    "description": "foo",
    "website": "http://www.simplify.ba",
    "status": 0
   }
}
```

## Installation

```
git clone git@github.com:robertosante/tasks.git
bundle && rake db:create
```
## API Reference

Only tasks are available just visit /tasks and you will see your current tasks, you can create tasks sending a post request to the /tasks path once you are authorized.

