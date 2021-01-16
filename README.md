# Ruby Project
## Valera Online(Rails Starter Project)

## Install PostgreSQL
sudo apt install postgresql
sudo gem install pg
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"
sudo -u postgres createdb rails_starter_project_development

### Install
```bash
bundle install

## Run program
```bash
rails s

## Run test
```bash
bundle exec rspec

## Run rubocop
```bash
rubocop
