'use strict';

var sql = require('./db.js')



const selectors = 'lib.lib_id, lib.titulo, lib.orig_titulo, lib.isbn,lib.paginas, lib.descripcion_fisica, ' +
    'lib.descripcion, gen.gen_nombre AS genero, aut.aut_nombre AS autor, img.data AS imgdata,' +
    ' img.img_filename AS filename,  ' +
    'aut.aut_id AS autor_id, gen.gen_id AS gen_id, lib.editorial_id, ed.ed_nombre AS editorial ';

const genero = ' FROM libros AS lib' +
    ' INNER JOIN generos AS gen ON (lib.genero_id = gen.gen_id) ' +
    ' LEFT JOIN autor_libro AS al ON (al.libro_id = lib.lib_id) ' +
    ' LEFT JOIN autores AS aut ON (aut.aut_id = al.autor_id) ' +
    ' LEFT JOIN editoriales AS ed ON (ed.ed_id = lib.editorial_id) ';

const imageJOIN = ' LEFT JOIN imagen_libro AS img ON (lib.lib_id = img.libro_id) ';

const fullINFO = ' lib.lib_id, lib.titulo, lib.isbn,lib.paginas, lib.descripcion_fisica, ' +
    'lib.descripcion, gen.gen_nombre AS genero, aut.aut_nombre AS autor, img.data AS imgdata,' +
    ' img.img_filename AS filename,  ' +
    'aut.aut_id AS autor_id, gen.gen_id AS gen_id ' +
    ' FROM libros AS lib' +
    ' INNER JOIN generos AS gen ON (lib.genero_id = gen.gen_id) ' +
    ' INNER JOIN autor_libro AS al ON (al.libro_id = lib.lib_id) ' +
    ' INNER JOIN autores AS aut ON (aut.aut_id = al.autor_id) ' +
    ' INNER JOIN imagen_libro AS img ON (lib.lib_id = img.libro_id) ';
exports.fullInfo = fullINFO;

const insert = "INSERT INTO libros" +
    "(titulo, orig_titulo, isbn, paginas, descripcion_fisica," +
    " descripcion, editorial_id, genero_id)" +
    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

const fields = {
    titulo: 'titulo', tituloOrig: 'orig_titulo', isbn: 'isbn', paginas: 'paginas',
    descripcion: 'descripcion', descripcion_fisica: 'descripcion_fisica', editorial_id: 'editorial_id',
    genero_id: 'genero_id'
};

const assignTo = ' = ? ';


const update = 'UPDATE libros SET ' + 
            fields.titulo               + assignTo + ', ' + 
            fields.tituloOrig           + assignTo + ', ' +
            fields.isbn                 + assignTo + ', ' +
            fields.paginas              + assignTo + ', ' +
            fields.descripcion          + assignTo + ', ' +
            fields.descripcion_fisica   + assignTo + ', ' +
            fields.genero_id            + assignTo + ', ' +
            fields.editorial_id         + assignTo +
            'WHERE lib_id'              + assignTo;

class Libro {
    constructor(titulo, tituloO, isbn, paginas, descripcion, descripcion_fisica, gen_id, ed_id, lib_id = 0) {
        this.id = lib_id;
        this.titulo = titulo
        this.tituloOrig = tituloO
        this.isbn = isbn
        this.paginas = paginas
        this.descripcion = descripcion
        this.descripcion_fisica = descripcion_fisica
        this.editorial_id = ed_id
        this.genero_id = gen_id
        this.lib_id = lib_id;
    }

    save(result) {
        sql.query(insert,
            [this.titulo, this.tituloOrig, this.isbn, this.paginas,
            this.descripcion_fisica, this.descripcion, this.editorial_id,
            this.genero_id],
            (err, res) => {
                if (err) {
                    console.log("error :", err)
                    result(err, null)
                } else {
                    console.log(res.insertId)
                    result(null, res.insertId)
                }
            })
    }


    update(result) {
        sql.query(update,
            [this.titulo, this.tituloOrig, this.isbn, this.paginas,
            this.descripcion, this.descripcion_fisica, this.genero_id,
            this.editorial_id, this.id],
            (err, res) => {
                if (err) {
                    console.log("error :", err)
                    result(err, null)
                } else {
                    console.log(res)
                    result(null, res)
                }
            });
    }
}


Libro.createLibro = function createUser(newLibro, result) {

    sql.query(insert,
        [newLibro.titulo, newLibro.tituloOrig, newLibro.isbn, newLibro.paginas,
        newLibro.descripcion_fisica, newLibro.descripcion, newLibro.editorial_id,
        newLibro.genero_id],
        (err, res) => {
            if (err) {
                console.log("error :", err)
                result(err, null)
            } else {
                console.log(res.insertId)
                result(null, res.insertId)
            }
        })
}

Libro.getLibroById = function createUser(libroId, result) {
    // '?' es un placeholder como %s o %d
    sql.query("SELECT " + selectors + genero + imageJOIN + " WHERE lib.lib_id = ? ", libroId, function (err, res) {
        if (err) {
            console.log("error :", err)
            result(err, null)
        } else {
            result(null, res)
        }
    })
}

Libro.getAllLibros = function getAllLibros(result) {
    //console.log("SELECT " + selectors + genero + imageJOIN);
    sql.query("SELECT " + selectors + genero + imageJOIN, function (err, res) {
        if (err) {
            console.log("error: ", err)
            result(null, err)
        } else {
            //console.log(res)
            result(null, res)
        }
    })
}

Libro.find = function findLibro(titulo, result) {
    sql.query("SELECT * " + genero + " WHERE titulo LIKE ?", '%' + titulo + '%', function (err, res) {
        if (err) {
            console.log("error: ", err)
            result(null, err)
        } else {
            result(null, res)
        }
    })
}

Libro.updateTitleById = function update(id, libro, result) {
    sql.query("UPDATE libros SET Titulo = ? WHERE id = ?", [libro.Titulo, id],
        function (err, res) {
            if (err) {
                console.log("error: ", err)
                result(null, err)
            } else {
                result(null, res)
            }
        })
}

Libro.remove = function (id, result) {
    sql.query("DELETE FROM libros WHERE id = ?", [id], function (err, res) {
        if (err) {
            console.log("error: ", err)
            result(null, err)
        } else {
            result(null, res)
        }
    })
}

module.exports = Libro;