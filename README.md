Description
======================
This is a simple todo app with a touch of excitement. 
Tasks that are completed are immediately hidden from view.
*Completed tasks* and *tasks older than 7 days* are automatically deleted each night.

Made with my mentor at Bloc.

Visit a working copy at [tienyuan-todoapp](http://tienyuan-todoapp.herokuapp.com/)


Setup Instructions
----------------------

Clone this repository. 

Then copy `config/application.example.yml` to `application.yml` and add values. These are the same enviroment settings needed in production.

Run `bundle install` to install all relevant gems.

Run `rspec/spec` to test the application.

FYI, a JS dependent feature (spec/features/task_actions.spec) is tested using [poltergeist](http://phantomjs.org/) and [phantomjs](http://phantomjs.org/). Running this test will require additional setup. 