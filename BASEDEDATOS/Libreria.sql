DROP DATABASE IF EXISTS test_libreria;
CREATE DATABASE test_libreria;
USE test_libreria;

CREATE TABLE Libros (
  lib_id       int(10) NOT NULL AUTO_INCREMENT, 
  titulo       varchar(255) NOT NULL, 
  orig_titulo  varchar(255), 
  isbn         bigint(15) NOT NULL UNIQUE, 
  publicacion  date NOT NULL, 
  paginas      int(4) NOT NULL, 
  descripcion  text NOT NULL, 
  fecha_pub    date NOT NULL, 
  genero_id    int(10) NOT NULL, 
  editorial_id int(10) NOT NULL, 
  updated_at   timestamp NULL, 
  created_at   timestamp NOT NULL, 
  ses_id       int(10) NOT NULL, 
  PRIMARY KEY (lib_id));
CREATE TABLE Proveedores (
  prov_id      int(10) NOT NULL AUTO_INCREMENT, 
  prov_nombre  varchar(255) NOT NULL, 
  prov_email   varchar(50) NOT NULL UNIQUE, 
  direccion_id int(10) NOT NULL, 
  updated_at   timestamp NULL, 
  created_at   timestamp NOT NULL, 
  ses_id       int(10) NOT NULL, 
  PRIMARY KEY (prov_id));
CREATE TABLE Lotes (
  lot_id           int(10) NOT NULL AUTO_INCREMENT, 
  lote_descripcion varchar(50) NOT NULL, 
  fentrega         date NOT NULL, 
  proveedor_id     int(10) NOT NULL, 
  updated_at       timestamp NULL, 
  created_at       timestamp NOT NULL, 
  ses_id           int(10) NOT NULL, 
  PRIMARY KEY (lot_id));
CREATE TABLE Ejemplares (
  ejem_id       int(10) NOT NULL AUTO_INCREMENT, 
  ejem_cantidad int(100) NOT NULL, 
  ejem_precio   int(10) NOT NULL, 
  sku           varchar(20) NOT NULL, 
  libro_id      int(10) NOT NULL, 
  lote_id       int(10) NOT NULL, 
  updated_at    timestamp NULL, 
  created_at    timestamp NOT NULL, 
  ses_id        int(10) NOT NULL, 
  tipo_id       int(10) NOT NULL, 
  PRIMARY KEY (ejem_id));
CREATE TABLE Usuarios (
  usr_id         int(10) NOT NULL AUTO_INCREMENT, 
  usr_nombre     varchar(50) NOT NULL, 
  usr_apellidos  varchar(50) NOT NULL, 
  usr_admin      tinyint(1), 
  usr_email      varchar(50) NOT NULL UNIQUE, 
  usr_username   varchar(50) NOT NULL UNIQUE, 
  usr_password   varchar(255) NOT NULL, 
  usr_TipoInicio varchar(255) NOT NULL, 
  usr_fnac       date NOT NULL, 
  direccion_id   int(10) NOT NULL, 
  updated_at     timestamp NULL, 
  created_at     timestamp NOT NULL, 
  ses_id         int(10) NOT NULL, 
  roles_id       int(10) NOT NULL, 
  PRIMARY KEY (usr_id));
CREATE TABLE Direcciones (
  dir_id      int(10) NOT NULL AUTO_INCREMENT, 
  dir_calle   varchar(255) NOT NULL, 
  dir_num     int(5) NOT NULL, 
  dir_colonia varchar(50) NOT NULL, 
  dir_cd      varchar(50) NOT NULL, 
  dir_cp      int(5) NOT NULL, 
  dir_pais    varchar(50) NOT NULL, 
  updated_at  timestamp NULL, 
  created_at  timestamp NOT NULL, 
  ses_id      int(10) NOT NULL, 
  PRIMARY KEY (dir_id));
CREATE TABLE Compras (
  comp_id     int(10) NOT NULL AUTO_INCREMENT, 
  comp_verif  tinyint(1) NOT NULL, 
  comp_fpago  varchar(255) NOT NULL, 
  comp_mpago  varchar(50) NOT NULL, 
  com_estado  varchar(255) NOT NULL, 
  usr_id      int(10) NOT NULL, 
  trans_id    int(10) NOT NULL, 
  empleado_id int(10) NOT NULL, 
  updated_at  timestamp NULL, 
  created_at  timestamp NOT NULL, 
  ses_id      int(10) NOT NULL, 
  PRIMARY KEY (comp_id));
CREATE TABLE Imagen_libro (
  img_id       int(10) NOT NULL AUTO_INCREMENT, 
  img_path     varchar(255) NOT NULL, 
  img_filename varchar(50) NOT NULL, 
  updated_at   timestamp NULL, 
  created_at   timestamp NOT NULL, 
  libro_id     int(10) NOT NULL, 
  ses_id       int(10) NOT NULL, 
  PRIMARY KEY (img_id));
CREATE TABLE Editoriales (
  ed_id      int(10) NOT NULL AUTO_INCREMENT, 
  ed_nombre  varchar(50) NOT NULL, 
  ed_correo  varchar(50) NOT NULL UNIQUE, 
  updated_at timestamp NULL, 
  created_at timestamp NOT NULL, 
  ses_id     int(10) NOT NULL, 
  PRIMARY KEY (ed_id));
CREATE TABLE Autores (
  aut_id        int(10) NOT NULL AUTO_INCREMENT, 
  aut_nombre    varchar(50) NOT NULL, 
  aut_fecnac    date NOT NULL, 
  aut_biografia text NOT NULL, 
  updated_at    timestamp NULL, 
  created_at    timestamp NOT NULL, 
  PRIMARY KEY (aut_id));
CREATE TABLE Autor_Libro (
  ID         int(10) NOT NULL, 
  autor_id   int(10) NOT NULL, 
  libro_id   int(10) NOT NULL, 
  updated_at timestamp NULL, 
  created_at timestamp NOT NULL, 
  ses_id     int(10) NOT NULL, 
  PRIMARY KEY (ID, 
  autor_id, 
  libro_id));
CREATE TABLE Generos (
  gen_id          int(10) NOT NULL AUTO_INCREMENT, 
  gen_nombre      varchar(50) NOT NULL UNIQUE, 
  gen_descripcion text NOT NULL, 
  updated_at      timestamp NULL, 
  created_at      timestamp NOT NULL, 
  ses_id          int(10) NOT NULL, 
  PRIMARY KEY (gen_id));
CREATE TABLE Item_compra (
  item_id       int(10) NOT NULL AUTO_INCREMENT, 
  item_cantidad int(11) NOT NULL, 
  item_preciou  int(11) NOT NULL, 
  ejemplares_id int(10) NOT NULL, 
  compras_id    int(10) NOT NULL, 
  created_at    timestamp NOT NULL, 
  updated_at    timestamp NULL, 
  ses_id        int(10) NOT NULL, 
  PRIMARY KEY (item_id));
CREATE TABLE Transporte (
  trans_id           int(10) NOT NULL AUTO_INCREMENT, 
  envio_numero_track varchar(30) NOT NULL, 
  updated_at         timestamp NULL, 
  created_at         timestamp NOT NULL, 
  compras_id         int(10) NOT NULL, 
  ses_id             int(10) NOT NULL, 
  PRIMARY KEY (trans_id));
CREATE TABLE Sesiones (
  ses_id         int(10) NOT NULL AUTO_INCREMENT, 
  ses_token      char(32) NOT NULL, 
  ses_ultima_act datetime NULL, 
  ses_fin        datetime NULL, 
  ses_ip         varchar(15), 
  ses_so         varchar(20), 
  usr_id         int(10) NOT NULL,  
  created_at    timestamp NOT NULL, 
  updated_at    timestamp NULL, 
  PRIMARY KEY (ses_id));
CREATE TABLE Roles (
  rol_id     int(10) NOT NULL AUTO_INCREMENT, 
  rol_nombre varchar(50) NOT NULL, 
  ses_id     int(10) NOT NULL,  
  created_at    timestamp NOT NULL, 
  updated_at    timestamp NULL, 
  PRIMARY KEY (rol_id));
CREATE TABLE Permisos (
  perm_id       int(10) NOT NULL AUTO_INCREMENT, 
  perm_permisos varchar(20), 
  rol_id        int(10) NOT NULL, 
  ses_id        int(10) NOT NULL,  
  created_at    timestamp NOT NULL, 
  updated_at    timestamp NULL, 
  PRIMARY KEY (perm_id));
CREATE TABLE TipoEjemplares (
  tipo_id          int(10) NOT NULL AUTO_INCREMENT, 
  tipo_descripcion varchar(50) NOT NULL, 
  tipo_dimensiones varchar(50) NOT NULL, 
  ses_id           int(10) NOT NULL,  
  created_at    timestamp NOT NULL, 
  updated_at    timestamp NULL, 
  PRIMARY KEY (tipo_id));
  
-- INIT Sesiones-Usuarios-Roles-Permisos
INSERT INTO Direcciones (dir_id, dir_calle, dir_num, dir_colonia, dir_cd, dir_pais, ses_id, updated_at, created_at) 
VALUES (1, 'Calle 1', '666', 'Colonia 1', 'Matamoros', 'México', 1, NOW(), NOW());
INSERT INTO Roles(rol_nombre, ses_id, created_at, updated_at) VALUES ('SysAdmin', 1, NOW(), NOW());
INSERT INTO Permisos(perm_permisos, rol_id, ses_id, created_at, updated_at) VALUE ('FFFFFFFFFFFFFFFFFFFF', 1, 1, NOW(), NOW());
INSERT INTO Usuarios (usr_nombre, usr_apellidos, usr_admin, usr_email, usr_username, usr_password, usr_TipoInicio, usr_fnac, direccion_id, ses_id, roles_id, created_at, updated_at) 
VALUES (  'Antonio', 'Zandate', 1, 'joseantoniosp@live.com.mx', 'joseantoniosp', '1234', 'email', '1998-12-16', 1, 1, 1, NOW(), NOW());
INSERT INTO Sesiones (ses_id, ses_token, usr_id, created_at, updated_at) VALUES (1, 'abcdef123456', 1, NOW(), NOW());

ALTER TABLE Lotes ADD CONSTRAINT FKLotes448903 FOREIGN KEY (proveedor_id) REFERENCES Proveedores (prov_id);
ALTER TABLE Usuarios ADD CONSTRAINT FKUsuarios227162 FOREIGN KEY (direccion_id) REFERENCES Direcciones (dir_id);
ALTER TABLE Compras ADD CONSTRAINT FKCompras256871 FOREIGN KEY (usr_id) REFERENCES Usuarios (usr_id);
ALTER TABLE Imagen_libro ADD CONSTRAINT FKImagen_lib463402 FOREIGN KEY (libro_id) REFERENCES Libros (lib_id);
ALTER TABLE Libros ADD CONSTRAINT FKLibros994400 FOREIGN KEY (editorial_id) REFERENCES Editoriales (ed_id);
ALTER TABLE Autor_Libro ADD CONSTRAINT FKAutor_Libr149553 FOREIGN KEY (autor_id) REFERENCES Autores (aut_id);
ALTER TABLE Autor_Libro ADD CONSTRAINT FKAutor_Libr206080 FOREIGN KEY (libro_id) REFERENCES Libros (lib_id);
ALTER TABLE Ejemplares ADD CONSTRAINT FKEjemplares412760 FOREIGN KEY (libro_id) REFERENCES Libros (lib_id);
ALTER TABLE Ejemplares ADD CONSTRAINT FKEjemplares741490 FOREIGN KEY (lote_id) REFERENCES Lotes (lot_id);
ALTER TABLE Libros ADD CONSTRAINT FKLibros809936 FOREIGN KEY (genero_id) REFERENCES Generos (gen_id);
ALTER TABLE Proveedores ADD CONSTRAINT FKProveedore993281 FOREIGN KEY (direccion_id) REFERENCES Direcciones (dir_id);
ALTER TABLE Item_compra ADD CONSTRAINT FKItem_compr354842 FOREIGN KEY (ejemplares_id) REFERENCES Ejemplares (ejem_id);
ALTER TABLE Item_compra ADD CONSTRAINT FKItem_compr537480 FOREIGN KEY (compras_id) REFERENCES Compras (comp_id);
ALTER TABLE Compras ADD CONSTRAINT FKCompras569978 FOREIGN KEY (trans_id) REFERENCES Transporte (trans_id);
ALTER TABLE Sesiones ADD CONSTRAINT FKSesiones768548 FOREIGN KEY (usr_id) REFERENCES Usuarios (usr_id);
ALTER TABLE Usuarios ADD CONSTRAINT FKUsuarios547201 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);
ALTER TABLE Compras ADD CONSTRAINT FKCompras787282 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);
ALTER TABLE Transporte ADD CONSTRAINT FKTransporte340616 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);
ALTER TABLE Direcciones ADD CONSTRAINT FKDireccione632988 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);
ALTER TABLE Ejemplares ADD CONSTRAINT FKEjemplares901705 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);
ALTER TABLE Lotes ADD CONSTRAINT FKLotes362415 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);
ALTER TABLE Libros ADD CONSTRAINT FKLibros848476 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);
ALTER TABLE Autor_Libro ADD CONSTRAINT FKAutor_Libr451044 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);
ALTER TABLE Generos ADD CONSTRAINT FKGeneros535449 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);
ALTER TABLE Imagen_libro ADD CONSTRAINT FKImagen_lib851063 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);
ALTER TABLE Editoriales ADD CONSTRAINT FKEditoriale684392 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);
ALTER TABLE Proveedores ADD CONSTRAINT FKProveedore781081 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);
ALTER TABLE Item_compra ADD CONSTRAINT FKItem_compr986280 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);
ALTER TABLE Permisos ADD CONSTRAINT FKPermisos607332 FOREIGN KEY (rol_id) REFERENCES Roles (rol_id);
ALTER TABLE Usuarios ADD CONSTRAINT FKUsuarios277154 FOREIGN KEY (roles_id) REFERENCES Roles (rol_id);
ALTER TABLE Roles ADD CONSTRAINT FKRoles828971 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);
ALTER TABLE Permisos ADD CONSTRAINT FKPermisos122620 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);
ALTER TABLE Ejemplares ADD CONSTRAINT FKEjemplares487137 FOREIGN KEY (tipo_id) REFERENCES TipoEjemplares (tipo_id);
ALTER TABLE TipoEjemplares ADD CONSTRAINT FKTipoEjempl362329 FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id);


INSERT INTO `editoriales` (`ed_id`, `ed_nombre`, `ed_correo`, `updated_at`, `created_at`) VALUES
(1, 'NoBooks', 'NoBooks@gmail.com'              , NOW(), NOW()),
(2, 'Gnome Press', 'gnomepress@gmail.com'       , NOW(), NOW()),
(3, 'Pierre-Jules Hetzel', 'jules_ed@hotmail.com', NOW(), NOW()),
(4, 'Tor books', 'torbooks@gmail.com'           , NOW(), NOW()),
(5, 'Una editorial mas', 'mieditorial@gmail.com', NOW(), NOW());


INSERT INTO `generos` (`gen_id`, `gen_nombre`, `gen_descripcion`, `updated_at`, `created_at`) VALUES
(1, 'Novela', ''               , NOW(), NOW()),
(2, 'Ciencia Ficcion', ''      , NOW(), NOW()),
(3, 'Ficcion de aventuras', '' , NOW(), NOW()),
(4, 'Novela Sci-Fi', ''        , NOW(), NOW()),
(5, 'Literatura fantástica', '', NOW(), NOW());


INSERT INTO `autores` (`aut_id`, `aut_nombre`, `aut_fecnac`, `aut_biografia`, `updated_at`, `created_at`) VALUES
(1, 'Herman Melville', '1819-08-01', '', NOW(), NOW()),
(2, 'Isaac Asimov', '1920-01-02', '', NOW(), NOW()),
(3, 'Julio Verne', '1828-02-08', '', NOW(), NOW()),
(4, 'Pierce Brown', '1988-01-28', '', NOW(), NOW()),
(10, 'Brian Sanderson', '1975-12-19', '', NOW(), NOW()),
(11, 'Brandon Sanderson', '1975-12-19', '', NOW(), NOW());


-- CREATE TABLE Sesiones (
--   ses_id			int(10) NOT NULL AUTO_INCREMENT,
--   ses_token			char(32) NOT NULL,
--   ses_ultima_act	datetime NULL,
--   ses_fin			datetime NULL,
--   ses_ip			varchar(15) NULL,
--   ses_os			varchar(50) NULL,
--   usr_id			int(10) NOT NULL,
--   updated_at   		timestamp NULL, 
--   created_at   		timestamp NOT NULL,
--   PRIMARY KEY(ses_id)
-- );
-- CREATE TABLE Libros (
--   lib_id       int(10) NOT NULL AUTO_INCREMENT, 
--   titulo       varchar(255) NOT NULL, 
--   orig_titulo  varchar(255), 
--   isbn         bigint(15) NOT NULL UNIQUE, 
--   publicacion  date NOT NULL, 
--   paginas      int(4) NOT NULL, 
--   descripcion  text NOT NULL, 
--   fecha_pub    date NOT NULL, 
--   genero_id    int(10) NOT NULL, 
--   editorial_id int(10) NOT NULL, 
--   ses_id	   int(10) NOT NULL, -- SESION
--   updated_at   timestamp NULL, 
--   created_at   timestamp NOT NULL, 
--   PRIMARY KEY (lib_id));
-- CREATE TABLE Proveedores (
--   prov_id      int(10) NOT NULL AUTO_INCREMENT, 
--   prov_nombre  varchar(255) NOT NULL, 
--   prov_email   varchar(50) NOT NULL UNIQUE, 
--   direccion_id int(10) NOT NULL,
--   ses_id	   int(10) NOT NULL, -- SESION
--   updated_at   timestamp NULL, 
--   created_at   timestamp NOT NULL, 
--   PRIMARY KEY (prov_id));
-- CREATE TABLE Lotes (
--   lot_id           int(10) NOT NULL AUTO_INCREMENT, 
--   lot_descripcion varchar(50) NOT NULL, 
--   lot_fentrega         date NOT NULL, 
--   proveedor_id     int(10) NOT NULL, 
--   ses_id	   	     int(10) NOT NULL, -- SESION
--   updated_at       timestamp NULL, 
--   created_at       timestamp NOT NULL, 
--   PRIMARY KEY (lot_id));
-- CREATE TABLE Ejemplares (
--   ejem_id       int(10) NOT NULL AUTO_INCREMENT, 
--   ejem_cantidad int(100) NOT NULL, 
--   ejem_precio   int(10) NOT NULL, 
--   sku           varchar(20) NOT NULL, 
--   libro_id      int(10) NOT NULL, 
--   lote_id       int(10) NOT NULL, 
--   ses_id	      int(10) NOT NULL, -- SESION
--   tipo_id       int(10) NOT NULL,
--   updated_at    timestamp NULL, 
--   created_at    timestamp NOT NULL, 
--   PRIMARY KEY (ejem_id));
-- CREATE TABLE TipoEjemplar (
--   te_id         int(10) NOT NULL AUTO_INCREMENT,
--   te_nombre     varchar(20) NOT NULL,
--   ses_id        int(10) NOT NULL,
--   updated_at    timestamp NULL,
--   created_at    timestamp NOT NULL,
--   PRIMARY KEY (te_id));
-- CREATE TABLE Usuarios (
--   usr_id         int(10) NOT NULL AUTO_INCREMENT, 
--   usr_nombre     varchar(50) NOT NULL, 
--   usr_apellidos  varchar(50) NOT NULL, 
--   usr_admin      bit(1) NULL, 
--   usr_email      varchar(50) NOT NULL UNIQUE, 
--   usr_username   varchar(50) NOT NULL UNIQUE, 
--   usr_password   varchar(255) NOT NULL, 
--   usr_TipoInicio varchar(255) NULL, 
--   usr_fnac       date NOT NULL, 
--   direccion_id   int(10) NULL, -- NO ES OBLIGATORIO QUE TENGAN
--   ses_id	       int(10) NOT NULL, -- SESION
--   rol_id         int(10) NULL, -- ROL
--   updated_at     timestamp NULL, 
--   created_at     timestamp NOT NULL, 
--   PRIMARY KEY (usr_id));
-- CREATE TABLE Permisos (
--   perm_id         int(10) NOT NULL AUTO_INCREMENT,
--   perm_codigo     varchar(20) NULL,
--   rol_id          int(10) NOT NULL,
--   ses_id    	    int(10) NOT NULL, -- SESION
--   PRIMARY KEY(perm_id));
-- CREATE TABLE Roles (
--   rol_id          int(10) NOT NULL AUTO_INCREMENT,
--   rol_nombre      varchar(50) NOT NULL,
--   ses_id    	    int(10) NOT NULL, -- SESION
--   PRIMARY KEY (rol_id));
-- CREATE TABLE Direcciones (
--   dir_id      int(10) NOT NULL AUTO_INCREMENT, 
--   dir_calle   varchar(255) NOT NULL, 
--   dir_num     int(5) NOT NULL, 
--   dir_colonia varchar(50) NOT NULL, 
--   dir_cd      varchar(50) NOT NULL, 
--   dir_cp      int(5) NOT NULL, 
--   dir_pais    varchar(50) NOT NULL, 
--   ses_id	  int(10) NOT NULL, -- SESION
--   updated_at  timestamp NULL, 
--   created_at  timestamp NOT NULL, 
--   PRIMARY KEY (dir_id));
-- CREATE TABLE Compras (
--   comp_id     int(10) NOT NULL AUTO_INCREMENT, 
--   comp_verif  bit(1) NULL, -- NULL, 0, 1
--   comp_fpago  varchar(255) NOT NULL, 
--   comp_mpago  varchar(50) NOT NULL, 
--   comp_estado  varchar(255) NOT NULL, 
--   usuario_id  int(10) NOT NULL, 
--   empleado_id int(10) NOT NULL, 
--   ses_id	  int(10) NOT NULL, -- SESION
--   updated_at  timestamp NULL, 
--   created_at  timestamp NOT NULL, 
--   PRIMARY KEY (comp_id));
-- CREATE TABLE Imagen_libro (
--   img_id       int(10) NOT NULL AUTO_INCREMENT, 
--   img_path     varchar(255) NOT NULL,
--   -- data         blob NOT NULL, Ahora se guardan en el sistema de archivos del servidor
--   img_filename varchar(50) NOT NULL, 
--   libro_id     int(10) NOT NULL, 
--   ses_id	   int(10) NOT NULL, -- SESION
--   updated_at   timestamp NULL, 
--   created_at   timestamp NOT NULL, 
--   PRIMARY KEY (img_id));
-- CREATE TABLE Editoriales (
--   ed_id      int(10) NOT NULL AUTO_INCREMENT, 
--   ed_nombre  varchar(50) NOT NULL, 
--   ed_correo  varchar(50) NOT NULL UNIQUE, 
--   ses_id	 int(10) NOT NULL, -- SESION
--   updated_at timestamp NULL, 
--   created_at timestamp NOT NULL, 
--   PRIMARY KEY (ed_id));
-- CREATE TABLE Autores (
--   aut_id        int(10) NOT NULL AUTO_INCREMENT, 
--   aut_nombre    varchar(50) NOT NULL, 
--   aut_fecnac    date NOT NULL, 
--   aut_biografia text NOT NULL, 
--   ses_id	    int(10) NOT NULL, -- SESION
--   updated_at    timestamp NULL, 
--   created_at    timestamp NOT NULL, 
--   PRIMARY KEY (aut_id));
-- CREATE TABLE Autor_Libro (
--   ID         int(10) NOT NULL AUTO_INCREMENT,  -- ANTES NO TENIA EL AUTO INCREMENT
--   autor_id   int(10) NOT NULL, 
--   libro_id   int(10) NOT NULL, 
--   ses_id	 int(10) NOT NULL, -- SESION
--   updated_at timestamp NULL, 
--   created_at timestamp NOT NULL, 
--   PRIMARY KEY (ID, 
--   autor_id, 
--   libro_id));
-- CREATE TABLE Generos (
--   gen_id          int(10) NOT NULL AUTO_INCREMENT, 
--   gen_nombre      varchar(50) NOT NULL UNIQUE, 
--   gen_descripcion text NOT NULL, 
--   ses_id	  	  int(10) NOT NULL, -- SESION
--   updated_at      timestamp NULL, 
--   created_at      timestamp NOT NULL, 
--   PRIMARY KEY (gen_id));
-- CREATE TABLE Item_compra (
--   item_id       int(10) NOT NULL AUTO_INCREMENT, 
--   item_cantidad int(11) NOT NULL, 
--   item_preciou  int(11) NOT NULL, 
--   ejemplares_id int(10) NOT NULL, 
--   compras_id    int(10) NOT NULL, 
--   ses_id	    int(10) NOT NULL, -- SESION
--   created_at    timestamp NOT NULL, 
--   updated_at    timestamp NULL, 
--   PRIMARY KEY (item_id));
-- CREATE TABLE Transporte (
--   trans_id           int(10) NOT NULL AUTO_INCREMENT, 
--   envio_numero_track varchar(30) NOT NULL, 
--   ses_id	  		 int(10) NOT NULL, -- SESION
--   updated_at         timestamp NULL, 
--   created_at         timestamp NOT NULL, 
--   compras_id         int(10) NOT NULL, 
--   PRIMARY KEY (trans_id));

-- ALTER TABLE Lotes ADD CONSTRAINT FKLotes448903 FOREIGN KEY (proveedor_id) REFERENCES Proveedores (prov_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Usuarios ADD CONSTRAINT FKUsuarios227162 FOREIGN KEY (direccion_id) REFERENCES Direcciones (dir_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Compras ADD CONSTRAINT FKCompras824535 FOREIGN KEY (usuario_id) REFERENCES Usuarios (usr_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Imagen_libro ADD CONSTRAINT FKImagen_lib463402 FOREIGN KEY (libro_id) REFERENCES Libros (lib_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Libros ADD CONSTRAINT FKLibros994400 FOREIGN KEY (editorial_id) REFERENCES Editoriales (ed_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Autor_Libro ADD CONSTRAINT FKAutor_Libr149553 FOREIGN KEY (autor_id) REFERENCES Autores (aut_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Autor_Libro ADD CONSTRAINT FKAutor_Libr206080 FOREIGN KEY (libro_id) REFERENCES Libros (lib_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Ejemplares ADD CONSTRAINT FKEjemplares412760 FOREIGN KEY (libro_id) REFERENCES Libros (lib_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Ejemplares ADD CONSTRAINT FKEjemplares741490 FOREIGN KEY (lote_id) REFERENCES Lotes (lot_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Ejemplares ADD CONSTRAINT FKEjemplaresTIPO FOREIGN KEY (tipo_id) REFERENCES TipoEjemplar (te_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Libros ADD CONSTRAINT FKLibros809936 FOREIGN KEY (genero_id) REFERENCES Generos (gen_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Proveedores ADD CONSTRAINT FKProveedore993281 FOREIGN KEY (direccion_id) REFERENCES Direcciones (dir_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Item_compra ADD CONSTRAINT FKItem_compr354842 FOREIGN KEY (ejemplares_id) REFERENCES Ejemplares (ejem_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Item_compra ADD CONSTRAINT FKItem_compr537480 FOREIGN KEY (compras_id) REFERENCES Compras (comp_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Transporte ADD CONSTRAINT FKTransporte864377 FOREIGN KEY (compras_id) REFERENCES Compras (comp_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Permisos ADD CONTRAINT FKPermisosRol FOREIGN KEY (rol_id) REFERENCES Roles(rol_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Usuarios ADD CONSTRAINT FKUsuariosRol FOREIGN KEY (rol_id) REFERENCES Roles (rol_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- -- SESIONES
-- ALTER TABLE Sesiones 		ADD CONSTRAINT SESION_USER_ID 		FOREIGN KEY (usr_id) REFERENCES Usuarios (usr_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Usuarios 		ADD CONSTRAINT FKUsuariosSESID 		FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Autores 		ADD CONSTRAINT FKAutoresSESID 		FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Autor_Libro 	ADD CONSTRAINT FKAutorLibroSESID 	FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Compras 		ADD CONSTRAINT FKComprasSESID 		FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Libros 			ADD CONSTRAINT FKLibrosSESID 		FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Proveedores 	ADD CONSTRAINT FKProveedorSESID 	FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Lotes 			ADD CONSTRAINT FKLotesSESID 		FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Ejemplares 		ADD CONSTRAINT FKEjemplaresSESID 	FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Direcciones 	ADD CONSTRAINT FKDireccionesSESID 	FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Imagen_libro 	ADD CONSTRAINT FKImagenlibroSESID 	FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Editoriales 	ADD CONSTRAINT FKEditoralesSESID	FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Generos 		ADD CONSTRAINT FKGenerosSESID		FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Item_compra		ADD CONSTRAINT FKItemcompraSESID	FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Transporte		ADD CONSTRAINT FKTransporteSESID	FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Roles		    ADD CONSTRAINT FKRolesSESID	FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE Permisos		ADD CONSTRAINT FKPermisosSESID	FOREIGN KEY (ses_id) REFERENCES Sesiones (ses_id) ON DELETE CASCADE ON UPDATE CASCADE;