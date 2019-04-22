var express = require('express');
var router = express.Router();
var libro = require("../controllers/LibrosController");
var usuario = require("../controllers/UsuariosController");
var autor = require("../controllers/AutoresController");
var genero = require("../controllers/GenerosController");
var editorial = require("../controllers/EditorialesController");
var stockLibro = require("../models/libro");

/* GET home page. */
router.get('/', function (req, res, next) {

    console.log('index')
    res.render('index', { titulo: "Libreria laguna", content: "LOS MEJORES LIBROS, EN LA MEJOR TIENDA", activeInicio:'active' })//;
});

// RUTAS [ruta, controlador]
router.get('/libros/', libro.list_all_libros);

router.get('/libros/d/:libroId', libro.get_a_libro);
router.put('/libros/d/:libroId', libro.update_a_libro);
router.delete('/libros/:libroId', libro.delete_a_libro);
router.post('/libros/find?/', libro.find_a_libro);

router.get('/libros/crear/', libro.formCreate_libro);
router.post('/libros/crear/', libro.create_a_libro);


router.get('/usuarios/', usuario.list_all_users);
router.post('usuarios/', usuario.create_usr);
router.get('/usuario/register');
//router.get('usuarios/crear', usuario.create_usr);

router.get('/autores/', autor.list_all_authors);
router.get('/autores/d/:aut_id', autor.listBooksOf);
router.get('/autores/crear', autor.formCrear);
router.post('/autores/crear', autor.create);

router.get('/generos/', genero.list_all_generos);
router.get('/generos/d/:gen_id', genero.getLibrosBy);
router.get('/generos/crear/', genero.formCrear);
router.post('/generos/crear', genero.create);


router.get('/editoriales/', editorial.list_all_editoriales);
router.get('/editoriales/d/:ed_id', editorial.getLibrosBy);

//router.get('/inicio/', libro = new Object());


module.exports = router;
