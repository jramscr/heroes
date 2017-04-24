# Heroes API

This is a basic sample API that will allow the user to consult
information about heroes, their universes and abilities as well.

## Technologies

* Ruby: 2.4.0
* Rails: 5.0.1
* Database adapter: PostgreSQL
* Test suite: RSpec

## How to run the project

First of all, you'll need to instal the dependencies of the project. In
order to accomplish that, use the following command:

1. `$ bundle install`

Then, you'll create the database and generate the necessary tables
running the following commands:

2. `$ rake db:create`
3. `$ rake db:migrate`

Now, let's run the following commands to seed the database and run the
project:

4. `$ rake db:seed`
5. `$ rails s`

Now, navigate to your browser, and open the following url:
[localhost:3000](http://localhost:3000)

## Example

You can find a live example in the following
[site](https://heroes-sample-api.herokuapp.com/heroes).

## Authentication

This project uses a Basic Authentication that is harcoded in order to
provide a minimum security level. In order to access the endpoints
**you'll need to use the following header in every request**:

`Authorization: 'Basic bXlfdXNlcjpteV9wYXNzd29yZA=='`

## Contribuitors
* [Jesus Ramos](https://www.github.com/jramscr)
