asdf-express
============

The backend for The ASDF, which uses Node Express.

Getting Started
===============

1) go into vagrant directory
2) run: 
    $ vagrant provision
    $ vagrant up
3) ssh into vagrant box
    $ vagrant ssh
4) install dependencies:
    $ sudo npm install
5) run migrations:
    $ sequelize -m
6) run app:
    $ coffee app.coffee
