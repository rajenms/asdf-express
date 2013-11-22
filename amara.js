#!/usr/local/bin/node

var argv, prompt, createuser, Sequelize, Hashes;
argv = require('optimist').argv;
prompt = require('prompt');
Sequelize = require('sequelize');
Hashes = require('jshashes');

createuser = argv.createuser;

if(createuser){

    var schema = {
        properties: {
            firstname: {
                required: true
            },
            lastname: {
                required: true
            },
            email: {
                required: true
            },
            password: {
                required: true,
                hidden: true
            }
        }
    };

    prompt.start();

    prompt.get(schema, function(err, result) {
        var sequelize, MD5, sqlString;
        sequelize = new Sequelize('asdf', 'root', 'gobadgers');
        MD5 = new Hashes.MD5;
        sqlString = "INSERT INTO users " +
                    "(firstName, lastName, isAdmin, email, password) VALUES " +
                    "(:firstname, :lastname, 1, :email, :password)";
        sequelize.query(sqlString, null, {raw: true}, {
            firstname: result.firstname,
            lastname: result.lastname,
            email: result.email,
            password: MD5.hex(result.password)
        });
    });
}