drop schema SaboresDelMundo;
create schema SaboresDelMundo;
use SaboresDelMundo;

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100) UNIQUE,
    contraseña VARCHAR(255),
    rol ENUM('admin', 'chef', 'usuario') DEFAULT 'usuario',
    estado ENUM('activo', 'inactivo') DEFAULT 'activo',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Recetas (
    id_receta INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    nombre VARCHAR(255),
    descripcion TEXT,
    tiempo_estimado INT, 
    dificultad ENUM('fácil', 'media', 'dificil'),
    pais_origen INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (pais_origen) REFERENCES Países(id_pais)
);

CREATE TABLE Ingredientes (
    id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Unidades (
    id_unidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Etiquetas (
    id_etiqueta INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Comentarios (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_receta INT,
    comentario TEXT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_receta) REFERENCES Recetas(id_receta)
);

CREATE TABLE Valoraciones (
    id_valoracion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_receta INT,
    puntuacion INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_receta) REFERENCES Recetas(id_receta)
);

CREATE TABLE Favoritos (
    id_usuario INT,
    id_receta INT,
    PRIMARY KEY (id_usuario, id_receta),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_receta) REFERENCES Recetas(id_receta)
);

CREATE TABLE Recetas_Ingredientes (
    id_receta INT,
    id_ingrediente INT,
    cantidad DECIMAL(10,2),
    id_unidad INT,
    PRIMARY KEY (id_receta, id_ingrediente),
    FOREIGN KEY (id_receta) REFERENCES Recetas(id_receta),
    FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes(id_ingrediente),
    FOREIGN KEY (id_unidad) REFERENCES Unidades(id_unidad)
);

CREATE TABLE Recetas_Categorias (
    id_receta INT,
    id_categoria INT,
    PRIMARY KEY (id_receta, id_categoria),
    FOREIGN KEY (id_receta) REFERENCES Recetas(id_receta),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE Recetas_Etiquetas (
    id_receta INT,
    id_etiqueta INT,
    PRIMARY KEY (id_receta, id_etiqueta),
    FOREIGN KEY (id_receta) REFERENCES Recetas(id_receta),
    FOREIGN KEY (id_etiqueta) REFERENCES Etiquetas(id_etiqueta)
);

CREATE TABLE Países (
    id_pais INT AUTO_INCREMENT PRIMARY KEY,
    nombre_pais VARCHAR(100)
);
