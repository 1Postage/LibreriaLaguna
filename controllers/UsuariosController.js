'use strict';

var Usuario = require('../models/usuario.js')


exports.list_all_users = function(req, res){
    Usuario.getAllUsuarios(function(err, usr){
        if (err)
            res.send(err)

        res.render('usuario/lista')
    })
}   

exports.getRegister = function(req, res){
    res.render('usuario/crear')
}

exports.create_usr = function(req, res){
    var nombre = req.body.nombre;
    var apellidos = req.body.apellidos;
    var email = req.body.email;
    var username = req.body.username;
    var password = req.body.password;
    var fecha_nacimiento = req.body.fecha_nacimiento;

    if (!nombre || !apellidos || !email || !username || !password || !fecha_nacimiento)
        res.status(400).send({error: true, message: "ERROR AL CAPTURAR DATOS"});

    let usuario = new Usuario(nombre, apellidos, email, username, password, fecha_nacimiento);
    usuario.save((err, queryResult) => {
        if (err)
            res.json(err);
        else
            res.json(queryResult);
    });
}