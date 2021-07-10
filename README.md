# Issue-Tracker
A basic issue tracker

## Installation Instructions
These installation instructions worked on Ubuntu 20.04 on WSL and should work on any Ubuntu 20.04 installation.
### Run the following commands:
1. `sudo apt install ruby-full`
 - Verify with: `ruby -v`
2. `sudo apt install sqlite3`
 - Verify with: `which sqlite3`
3. install nvm: instructions here: https://github.com/nvm-sh/nvm
- Verify with: `nvm -v`
4. `nvm install node`
- Verify with: `node -v`
5. `npm install --global yarn`
- Verify with: `yarn -v`
6. `gem install rails`
- Verify with: `rails --version`
7. `sudo apt-get install libsqlite3-dev`
- Verify with: `sqlite3 --version`
8. you may need to run `rails webpacker:install`
9. run the server with `bin/rails server`
## Running Instructions (assumeing you're running a UNIX-like terminal)
1. Navigate to the project folder
2. Run `rails server` or the shorthand `rails s`
3. Run `rails db:reset` to start a fresh database and seed it. (There's no need to start the server as sqlite3 is serverless)
4. Navigate your browser to http://localhost:3000/

* Ruby version: ruby 2.7.0p0 (2019-12-25 revision 647ee6f091)[x86_64-linux-gnu]

* Rails version: Rails 6.1.3.2

* System dependencies: Ruby, Ruby-on-Rails, and all its dependencies  
## How to run the test suite:
1. run `rake db:test:prepare` to clean out the testing database for testing
2. run `rspec` to run the test

