CREATE DATABASE eventos_deportivos;

USE eventos_deportivos;

-- Tablas independientes
CREATE TABLE comisario (
id int primary key auto_increment,
nombre varchar(35),
telefono int,
papel varchar(15)
);
CREATE TABLE equipamiento (
id int primary key auto_increment,
nombre varchar(45)
);
CREATE TABLE deporte (
id int primary key auto_increment,
nombre varchar(45)
);
CREATE TABLE sede (
id int primary key auto_increment,
nombre varchar(35),
presupuesto decimal(10,2),
num_complejos int
);

-- Tablas que dependen de las iniciales
CREATE TABLE complejo (
id int primary key auto_increment,
tipo varchar(15), -- Puede ser polideportivo o solo deportivo
nombre varchar(35),
id_deportes int,
foreign key (id_deportes) references deportes_complejo(id),
localizacion varchar(35),
jefe varchar(35),
area_total decimal(10,1),
id_sede int,
foreign key (id_sede) references sede(id)
);
CREATE TABLE evento (
id int primary key auto_increment,
id_complejo int,
foreign key (id_complejo) references complejo(id),
nombre varchar(35),
fecha datetime,
presupuesto decimal(10,2),
num_participantes int,
id_deportes int, -- conecta con listado de deportes para evento
foreign key (id_deportes) references deportes_evento(id),
id_equipamiento int,  -- conecta con listado de equipamiento para evento
foreign key (id_equipamiento) references equipamiento(id)
);

-- Conecciones entre items de tablas para más de una sola coneccion directa
CREATE TABLE deportes_complejo (
id int primary key auto_increment,
id_deporte int,
foreign key (id_deporte) references deporte(id),
complejo int,
foreign key (id_evento) references complejo(id)
);
CREATE TABLE deportes_evento (
id int primary key auto_increment,
id_deporte int,
foreign key (id_deporte) references deporte(id),
id_evento int,
foreign key (id_evento) references evento(id)
);
CREATE TABLE equipamiento_evento (
id int primary key auto_increment,
id_equipamiento int,
foreign key (id_deporte) references equipamiento(id),
id_evento int,
foreign key (id_evento) references eveto(id));

show tables;

insert sede values (1,"Prueba",9342.98,1);

-- Consultas de datos:
