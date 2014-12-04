##TodoApp


Description
======================
This is a simple todo app with a touch of excitement. 
Tasks that are completed are immediately hidden from view.
*Completed tasks* and *tasks older than 7 days* are automatically deleted each night.

Made with my mentor, [Eliot Sykes](https://www.bloc.io/mentors/eliot-sykes) at Bloc.

Visit a working copy at [tienyuan-todoapp](http://tienyuan-todoapp.herokuapp.com/)


Features
======================
* You can create an account and add multiple todo tasks.
* You can see how many days are left before the todo task is automatically deleted.
* When a todo task is done, you can mark it as complete.
* Todo items are automatically deleted after 7 days from their creation date.


Setup Instructions
======================

Clone this repository. 

Then copy `config/application.example.yml` to `application.yml` and add values. These are the same environment settings needed in production.

```
SECRET_KEY_BASE:
DEVISE_SECRET_KEY: 
SENDGRID_USERNAME: 
SENDGRID_PASSWORD: 
```

Run `bundle install` to install all relevant gems.

Run `rspec/spec` to test the application.

FYI, a JS dependent feature (spec/features/task_actions.spec) is tested using [poltergeist](http://phantomjs.org/) and [phantomjs](http://phantomjs.org/). Running this test will require additional setup. 


Screenshots
=====================

![Todos Page](http://tienyuan.github.io/todoapp/img/tasks.png)