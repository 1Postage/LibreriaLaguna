const Compra = require('../models/compra');
const Usuario = require('../models/usuario');
const Ejemplar = require('../models/ejemplar');
const Item = require('../models/item_compra');
const paginate = require('express-paginate');
const moment = require('moment');
const mx = moment.locale("mx");

exports.changeCompra = async (req, res) => {
    let comp_id = req.body.comp_id;
    let fpago = req.body.fpago;
    let mpago = req.body.mpago;

    let transporte_id = req.body.transporte_id;

    let cantidades = req.body.cantidades;
    let items_id = req.body.item_id;
    let ejemplares_id = req.body.ejemplar_id;
    let eliminar = req.body.eliminar;
    // UPDATE COMPRA
    let resultCompra = await Compra.update(fpago, mpago, transporte_id, comp_id).catch((reason) => {
        return res.send("ERROR AL ACTUALIZAR COMPRA", reason);
    });

    // UPDATE ITEMS
    for (var i = 0; i < cantidades.length; i++) {
        // OBTENER EL PRECIO DEL EJEMPLAR
        let ejemplar = await Ejemplar.getById(ejemplares_id[i]);
        let newPrecio = ejemplar.ejem_precio;
        let result = null;

        if (eliminar[i] == 'true') {
            console.log("ELIMINANDO ITEM", items_id[i]);
            result = await Item.remove(items_id[i]);
        } else {
            console.log("ACTUALIZANDO ITEM", items_id[i]);
            result = await Item.update(items_id[i], cantidades[i], newPrecio, ejemplares_id[i]);
        }
        if (result == null) {
            return res.send("ERROR AL ACTUALIAR ITEMS");
        }
    }


    return res.redirect('/compras');
}

exports.formEditar = async (req, res) => {
    let comp_id = req.params.compId;
    let usr_id = req.session.user.usr_id;
    let usuario = await Usuario.getUserById(req.session.user.usr_id);

    let compra = await Compra.lastByUser(usr_id).catch((reason) => {
        console.log(reason);
        res.send("ERROR");
    });

    let items = await Compra.getItems(comp_id);
    let ejemplares = await Ejemplar.getAllWithLibro();

    let transportes = await Compra.getTransportes();

    for (var i = 0; i < items.length; i++) {
        items[i].ejemplares = ejemplares;
    }

    res.render('compra/editView',
        {
            compra: compra, items: items, nombreUsuario: usuario.usr_nombre,
            transportes: transportes
        });

}

exports.getItems = async (req, res) => {
    const comp_id = req.params.comp_id;
    const items = await Compra.getItems(comp_id);
    const usuario = await Usuario.getUserById(req.session.user.usr_id);        

    let total = 0
    items.map(item => {
        total += item.precio * item.cantidad;
    });

    console.log(total);

    res.render('compra/itemsView', {
        title: 'Articulos de compra', items: items, 
        nombre: usuario.usr_nombre, comp_id: comp_id,
        total: total
    });
}

exports.listAll = async (req, res) => {

    let compras = await Compra.getAllByUserComplete(req.session.user.usr_id).catch((reason) => {
        console.log(reason);
    });

    if (compras) {
        for (var i = 0; i < compras.length; i++) {
            let comp_id = compras[i].comp_id;
            let fecha = compras[i].fecha;

            moment.locale("mx");

            const fromNow = moment(fecha).fromNow();
            compras[i].fecha = fromNow;

            let items = await Compra.getItems(comp_id);
            if (items) {
                compras[i].items = items;
                let total = 0;
                for (var a = 0; a < items.length; a++) {
                    total += items[a].precio * items[a].cantidad;
                }
                compras[i].total = total;
            }
        }
    }

    let itemCount = compras.length;
    let pageCount = Math.ceil(itemCount / req.query.limit);

    compras = compras.slice(req.skip, req.skip + req.query.limit);

    let usuario = await Usuario.getUserById(req.session.user.usr_id);
    console.log(compras);

    res.render('compra/userData', {
        compras: compras,
        title: 'Compras', compras: compras, pageCount, itemCount,
        pages: paginate.getArrayPages(req)(req.query.limit, pageCount, req.query.page),
        actualPage: req.query.page,
        nombre: usuario.usr_nombre
    });

}

exports.finalizar = async (req, res) => {

    let usr_id = req.session.user.usr_id;
    let sid = req.session.user.ses_id;

    let result = Compra.finalizar(usr_id, sid);

    if (result) {
        res.redirect('/cuenta');
    } else {
        res.redirect('/compras');
    }
}