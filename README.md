# Ruby Project
## Valera Online(Rails Starter Project)

![Unit Tests & Lint](https://github.com/SSH002/RailsStarterProject/workflows/Unit%20Tests%20&%20Lint/badge.svg)

## Install PostgreSQL
```bash
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

RELEASE=$(lsb_release -cs)
echo "deb http://apt.postgresql.org/pub/repos/apt/ ${RELEASE}"-pgdg main | sudo tee  /etc/apt/sources.list.d/pgdg.list

sudo apt update
sudo apt -y install postgresql-11

### Install
```bash
bundle install

## Create PostgreSQL user
```bash
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"

## Create Database
```bash
sudo -u postgres createdb rails_starter_project_development

## Run program
```bash
rails s

## Run test
```bash
rspec

## Run rubocop
```bash
rubocop -a 
