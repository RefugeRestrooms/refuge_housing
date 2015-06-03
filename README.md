# Contributing

## Setting Up Development Environment

### 1 Fork and clone the repository.

### 2 Install Vagrant.
https://www.vagrantup.com/downloads

### 3 Capture the powers of vagrant
  * In the repo dir: <code>vagrant up</code> (Safely ignore: 'dpkg-preconfigure: unable to re-open stdin: No such file or directory')
  * If changes have been made since running vagrant up: <code>vagrant provision</code>
  * To login to the machine: <code>vagrant ssh</code>
  * `cd  /vagrant/` to navigate to the refuge repo.
  * There is a rake wrapper to execute commands in refuge repo on the vagrant machine
  without using ssh. Run `rake vagrant:shell[command]`, EX: `rake vagrant:shell['rails s -b 0.0.0.0']

Note: `-b 0.0.0.0` flag is required to access the server via localhost, since it needs to be visable from outside the vagrant vm.

## Testing
Run the test suite with `rake test`

Individual test suites can be run with `rake test:<suite>` (ex. `rake test:rubocop` for ruby linting)

Please cover any new code with specs. We prefer code to be covered using RSpec or Capybara.

This is a great link for reference to our testing frameworks! [](https://robots.thoughtbot.com/how-we-test-rails-applications)
