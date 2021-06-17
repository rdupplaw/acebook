[![mvgame74](https://circleci.com/gh/mvgame74/acebook-rails-The-Wallies.svg?style=svg&circle-token=692d9c4c326e8e079500a081b14042d7f4f35637)](https://circleci.com/gh/mvgame74/acebook-rails-The-Wallies)

# AceBook

https://aqueous-harbor-18057.herokuapp.com/posts

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Instructions for starting up a new ticket

```bash
> pull the last version of Acebook in the MAIN branch from Git hub
> run $rails db:migrate to ensure producing a fresh verion of schema.rb in your machine
> create a new branch to work with $git branch -b thisIsMyNewTicket
```

## Troubleshooting

If you don't have Node.js installed yet, you might run into this error when running rspec:

```
ExecJS::RuntimeUnavailable:
  Could not find a JavaScript runtime. See https://github.com/rails/execjs for a list of available runtimes.
 ```

Rails requires a Javascript runtime to work. The easiest way is to install Node by running `brew install node` - and then run `bundle exec rspec` again
