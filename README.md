# Software-Engineering-Project

## Install
Install ruby using RVM, use ruby-2.5.1 <br />
Install Dependencies: bundle install <br />
Create database: rails db:create <br />
Run Migrations: rails db:migrate <br />
Start: Rails s <br />

## With docker
docker-compose build
docker-compose up
docker-compose run app rake db:create
docker-compose run app rake db:migrate
