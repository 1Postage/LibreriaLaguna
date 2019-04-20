var express = require('express');
var router = express.Router();
var libro = require("../controllers/LibrosController");
var usuario = require("../controllers/UsuariosController");
var autor = require("../controllers/AutoresController");

/* GET home page. */
router.get('/', function (req, res, next) {

    console.log('index')
    res.render('index', { titulo: "Libreria laguna", content: "LOS MEJORES LIBROS, EN LA MEJOR TIENDA", activeInicio:'active' })
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


router.get('/autores/', autor.list_all_authors);
router.get('/autores/d/:aut_id', autor.listBooksOf)


module.exports = router;
