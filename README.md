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

### Valera parameters:
 - mana = 30
 - positive = 5
 - tiredness = 0
 - money = 5000

### Possible actions: 

##### Go work (only possible if mana <= 60 and fatigue <= 60)
- `+`1250 money
- `+`30 fatigue
- `-`15 mana

##### To rest
- `-`1 happiens
- `-`5 mana
- `-`30 fatigue

##### Drinking with marginals
- `+`25 mana
- `+`3 happiens
- `-`1500 money

##### Singing
- `+`1 happiens
- `-`15 mana
- `+`between 50 and 450 money if mana > 40

##### Watch serial
- `+`2 happiens
- `-`5 mana
- `-`15 fatigue

##### Sleep
- `+`1 happiens
- `-`50 mana
- `-`75 fatigue
