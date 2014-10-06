Description
======================
This is a simple todo app that automatically destroys completed tasks and tasks older than 7 days each night. 
Made with my mentor at Bloc.

Visit a working copy at [tienyuan-todoapp](http://tienyuan-todoapp.herokuapp.com/)

Setup Instructions
----------------------

Clone this repository. 

Then copy application.example.yml to application.yml and add values. 

Run `bundle install` to install all relevant gems

Run `rspec/spec` to test the application.

FYI, a JS dependent feature (spec/features/task_actions.spec) is tested using [poltergeist](http://phantomjs.org/) and [phantomjs](http://phantomjs.org/). Running this test will require additional setup. 