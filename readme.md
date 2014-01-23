# UXfu

User experience framework for constructing interactive digital:

* User profiles :TODO
* User journeys :WIP
* Wireframes
* Prototypes

***

# Requirements

* Ruby 2.0 and above
* To install Ruby gems: run `$ bundle install`
* Node (for javascript tests)
* 

***

# Start server

* Run `$ shotgun --server=puma config.ru`

***

# User journeys

* User journeys are draw from data in `./src/ruby/user_journeys.rb`.

***

# Tests

To test files install mocha and chai globally `$ sudo npm install -g mocha chai` then run `$ mocha src/tests/js/myTestFile.js`

***

# Coffeescript

* Source files in `./src/coffee`
* Tests in `./src/tests/coffee`
* Run `$ guard` to automatically compile coffeescript into javascript as you save