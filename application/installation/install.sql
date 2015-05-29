DROP TABLE `items`;

CREATE TABLE `items` (
 `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `id_state` int(11) NOT NULL,
 `id_city` int(11) NOT NULL,
 `id_neighborhood` int(11) NOT NULL,
 `id_type` int(11) NOT NULL,
 `id_identity` int(11) NOT NULL,
 `id_furnished` int(11) NOT NULL,
 `price` int(11) NOT NULL,
 `expenses` int(11) NOT NULL,
 `rooms` int(11) NOT NULL,
 `surface` int(11) NOT NULL,
 `email` varchar(196) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE `furnished`;

CREATE TABLE `furnished` (
 `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `description` varchar(64) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `furnished` VALUES (null, 'Sin Amoblar');
INSERT INTO `furnished` VALUES (null, 'Amoblado');


DROP TABLE `identities`;

CREATE TABLE `identities` (
 `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `description` varchar(64) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `identities` VALUES (null, 'Dueño Directo');
INSERT INTO `identities` VALUES (null, 'Inmobiliaria');

DROP TABLE `types`;

CREATE TABLE `types` (
 `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `description` varchar(64) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `types` VALUES (null, 'Apartamentos');
INSERT INTO `types` VALUES (null, 'Casas');
INSERT INTO `types` VALUES (null, 'Otros');

DROP TABLE `states`;

CREATE TABLE `states` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `description` varchar(128) NOT NULL,
 `url` varchar(128) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `states` VALUES (null, 'Bogotá', 'bogota.olx.com.co');
INSERT INTO `states` VALUES (null, 'Valle del Cauca', 'valledelcauca.olx.com.co');
INSERT INTO `states` VALUES (null, 'Antioquia', 'antioquia.olx.com.co');
INSERT INTO `states` VALUES (null, 'Santander', 'santander.olx.com.co');
INSERT INTO `states` VALUES (null, 'Atlántico', 'atlantico.olx.com.co');
INSERT INTO `states` VALUES (null, 'Cundinamarca', 'cundinamarca.olx.com.co');
INSERT INTO `states` VALUES (null, 'Norte de Santander', 'nortedesantander.olx.com.co');
INSERT INTO `states` VALUES (null, 'Risaralda', 'risaralda.olx.com.co');

DROP TABLE `cities`;

CREATE TABLE `cities` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `id_state` int(11) NOT NULL,
 `description` varchar(128) NOT NULL,
 `url` varchar(128) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `cities` VALUES (null, 1, 'Bogotá', 'bogotacity.olx.com.co');

INSERT INTO `cities` VALUES (null, 2, 'Cali', 'cali.olx.com.co');
INSERT INTO `cities` VALUES (null, 2, 'Palmira', 'palmira.olx.com.co');
INSERT INTO `cities` VALUES (null, 2, 'Tulúa', 'tulua.olx.com.co');

INSERT INTO `cities` VALUES (null, 3, 'Medellín', 'medellin.olx.com.co');
INSERT INTO `cities` VALUES (null, 3, 'Envigado', 'envigado.olx.com.co');
INSERT INTO `cities` VALUES (null, 3, 'Bello', 'bello.olx.com.co');
INSERT INTO `cities` VALUES (null, 3, 'Itagüí', 'itagui.olx.com.co');

INSERT INTO `cities` VALUES (null, 4, 'Bucaramanga', 'bucaramanga.olx.com.co');
INSERT INTO `cities` VALUES (null, 4, 'Floridablanca', 'floridablanca.olx.com.co');
INSERT INTO `cities` VALUES (null, 4, 'Barrancabermeja', 'barrancabermeja.olx.com.co');

INSERT INTO `cities` VALUES (null, 5, 'Barranquilla', 'barranquilla.olx.com.co');

INSERT INTO `cities` VALUES (null, 6, 'Soacha', 'soacha.olx.com.co');
INSERT INTO `cities` VALUES (null, 6, 'Chía', 'chia.olx.com.co');
INSERT INTO `cities` VALUES (null, 6, 'Fusagasugá', 'fusagasuga.olx.com.co');

INSERT INTO `cities` VALUES (null, 7, 'Cúcuta', 'cucuta.olx.com.co');

INSERT INTO `cities` VALUES (null, 8, 'Pereira', 'pereira.olx.com.co');
INSERT INTO `cities` VALUES (null, 8, 'Dosquebradas', 'dosquebradas.olx.com.co');


DROP TABLE `neighborhoods`;

CREATE TABLE `neighborhoods` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `id_city` int(11) NOT NULL,
 `description` varchar(128) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `neighborhoods` VALUES (null, 1, 'Usaquén');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Chapinero');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Santa Fe');
INSERT INTO `neighborhoods` VALUES (null, 1, 'San Cristóbal');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Usme');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Tunjuelito');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Bosa');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Kennedy');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Fontibón');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Engativá');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Suba');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Barrios Unidos');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Teusaquillo');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Los Mártires');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Antonio Nariño');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Puente Aranda');
INSERT INTO `neighborhoods` VALUES (null, 1, 'La Candelaria');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Rafael Uribe Uribe');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Ciudad Bolívar');
INSERT INTO `neighborhoods` VALUES (null, 1, 'Sumapaz');

INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 1');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 2');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 3');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 4');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 5');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 6');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 7');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 8');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 9');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 10');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 11');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 12');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 13');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 14');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 15');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 16');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 17');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 18');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 19');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 20');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 21');
INSERT INTO `neighborhoods` VALUES (null, 2, 'Comuna 22');

INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 1');
INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 2');
INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 3');
INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 4');
INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 5');
INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 6');
INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 7');
INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 8');
INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 9');
INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 10');
INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 11');
INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 12');
INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 13');
INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 14');
INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 15');
INSERT INTO `neighborhoods` VALUES (null, 3, 'Comuna 16');

INSERT INTO `neighborhoods` VALUES (null, 4, 'Comuna 1');
INSERT INTO `neighborhoods` VALUES (null, 4, 'Comuna 2');
INSERT INTO `neighborhoods` VALUES (null, 4, 'Comuna 3');
INSERT INTO `neighborhoods` VALUES (null, 4, 'Comuna 4');
INSERT INTO `neighborhoods` VALUES (null, 4, 'Comuna 5');
INSERT INTO `neighborhoods` VALUES (null, 4, 'Comuna 6');
INSERT INTO `neighborhoods` VALUES (null, 4, 'Comuna 7');
INSERT INTO `neighborhoods` VALUES (null, 4, 'Comuna 8');
INSERT INTO `neighborhoods` VALUES (null, 4, 'Comuna 9');

INSERT INTO `neighborhoods` VALUES (null, 5, 'Barrio Popular');
INSERT INTO `neighborhoods` VALUES (null, 5, 'Santa Cruz');
INSERT INTO `neighborhoods` VALUES (null, 5, 'Manrique');
INSERT INTO `neighborhoods` VALUES (null, 5, 'Aranjuez');
INSERT INTO `neighborhoods` VALUES (null, 5, 'Castilla');
INSERT INTO `neighborhoods` VALUES (null, 5, 'Doce de Octubre');
INSERT INTO `neighborhoods` VALUES (null, 5, 'Robledo');
INSERT INTO `neighborhoods` VALUES (null, 5, 'Villa Hermosa');
INSERT INTO `neighborhoods` VALUES (null, 5, 'Buenos Aires');
INSERT INTO `neighborhoods` VALUES (null, 5, 'La Candelaria');
INSERT INTO `neighborhoods` VALUES (null, 5, 'Laureles-Estadio');
INSERT INTO `neighborhoods` VALUES (null, 5, 'La América');
INSERT INTO `neighborhoods` VALUES (null, 5, 'San Javier');
INSERT INTO `neighborhoods` VALUES (null, 5, 'El Poblado');
INSERT INTO `neighborhoods` VALUES (null, 5, 'Guayabal');
INSERT INTO `neighborhoods` VALUES (null, 5, 'Belén');

INSERT INTO `neighborhoods` VALUES (null, 6, 'Las Palmas');
INSERT INTO `neighborhoods` VALUES (null, 6, 'El Vallano');
INSERT INTO `neighborhoods` VALUES (null, 6, 'El Escobero');
INSERT INTO `neighborhoods` VALUES (null, 6, 'Santa Catalina');
INSERT INTO `neighborhoods` VALUES (null, 6, 'Pantanillo');
INSERT INTO `neighborhoods` VALUES (null, 6, 'Perico');

INSERT INTO `neighborhoods` VALUES (null, 7, 'Paris');
INSERT INTO `neighborhoods` VALUES (null, 7, 'La Madera');
INSERT INTO `neighborhoods` VALUES (null, 7, 'Santa Ana');
INSERT INTO `neighborhoods` VALUES (null, 7, 'Suárez');
INSERT INTO `neighborhoods` VALUES (null, 7, 'La Cumbre');
INSERT INTO `neighborhoods` VALUES (null, 7, 'Bellavista');
INSERT INTO `neighborhoods` VALUES (null, 7, 'Mirador y Altos de Niquía');
INSERT INTO `neighborhoods` VALUES (null, 7, 'Niquia');
INSERT INTO `neighborhoods` VALUES (null, 7, 'Fontidueño');
INSERT INTO `neighborhoods` VALUES (null, 7, 'Acevedo');

INSERT INTO `neighborhoods` VALUES (null, 8, 'Comuna 1');
INSERT INTO `neighborhoods` VALUES (null, 8, 'Comuna 2');
INSERT INTO `neighborhoods` VALUES (null, 8, 'Comuna 3');
INSERT INTO `neighborhoods` VALUES (null, 8, 'Comuna 4');
INSERT INTO `neighborhoods` VALUES (null, 8, 'Comuna 5');
INSERT INTO `neighborhoods` VALUES (null, 8, 'Comuna 6');
INSERT INTO `neighborhoods` VALUES (null, 8, 'La Verde (La María)');
INSERT INTO `neighborhoods` VALUES (null, 8, 'Los Olivales');
INSERT INTO `neighborhoods` VALUES (null, 8, 'El Pedregal');
INSERT INTO `neighborhoods` VALUES (null, 8, 'Loma de los Zuleta');
INSERT INTO `neighborhoods` VALUES (null, 8, 'El Progreso');
INSERT INTO `neighborhoods` VALUES (null, 8, 'Los Gómez');
INSERT INTO `neighborhoods` VALUES (null, 8, 'El Ajizal');
INSERT INTO `neighborhoods` VALUES (null, 8, 'El Porvenir');

INSERT INTO `neighborhoods` VALUES (null, 9, 'Norte');
INSERT INTO `neighborhoods` VALUES (null, 9, 'Nororiental');
INSERT INTO `neighborhoods` VALUES (null, 9, 'San Francisco');
INSERT INTO `neighborhoods` VALUES (null, 9, 'Occidental');
INSERT INTO `neighborhoods` VALUES (null, 9, 'García Rovira');
INSERT INTO `neighborhoods` VALUES (null, 9, 'La Concordia');
INSERT INTO `neighborhoods` VALUES (null, 9, 'La Ciudadela');
INSERT INTO `neighborhoods` VALUES (null, 9, 'Sur-Oriental');
INSERT INTO `neighborhoods` VALUES (null, 9, 'La Pedregosa');
INSERT INTO `neighborhoods` VALUES (null, 9, 'Provenza');
INSERT INTO `neighborhoods` VALUES (null, 9, 'Comuna Sur');
INSERT INTO `neighborhoods` VALUES (null, 9, 'Cabecera del llano');
INSERT INTO `neighborhoods` VALUES (null, 9, 'Centro oriental');
INSERT INTO `neighborhoods` VALUES (null, 9, 'Morrorrico');
INSERT INTO `neighborhoods` VALUES (null, 9, 'Centro');
INSERT INTO `neighborhoods` VALUES (null, 9, 'Lagos del cacique');
INSERT INTO `neighborhoods` VALUES (null, 9, 'Mutis');

INSERT INTO `neighborhoods` VALUES (null, 10, 'Estrato 1');
INSERT INTO `neighborhoods` VALUES (null, 10, 'Estrato 2');
INSERT INTO `neighborhoods` VALUES (null, 10, 'Estrato 3');
INSERT INTO `neighborhoods` VALUES (null, 10, 'Estrato 4');
INSERT INTO `neighborhoods` VALUES (null, 10, 'Estrato 5');
INSERT INTO `neighborhoods` VALUES (null, 10, 'Estrato 6');

INSERT INTO `neighborhoods` VALUES (null, 11, 'Comuna 1');
INSERT INTO `neighborhoods` VALUES (null, 11, 'Comuna 2');
INSERT INTO `neighborhoods` VALUES (null, 11, 'Comuna 3');
INSERT INTO `neighborhoods` VALUES (null, 11, 'Comuna 4');
INSERT INTO `neighborhoods` VALUES (null, 11, 'Comuna 5');
INSERT INTO `neighborhoods` VALUES (null, 11, 'Comuna 6');
INSERT INTO `neighborhoods` VALUES (null, 11, 'Comuna 7');

INSERT INTO `neighborhoods` VALUES (null, 12, 'Metropolitana');
INSERT INTO `neighborhoods` VALUES (null, 12, 'Riomar');
INSERT INTO `neighborhoods` VALUES (null, 12, 'Norte-Centro Histórico');
INSERT INTO `neighborhoods` VALUES (null, 12, 'Sur Occidente');
INSERT INTO `neighborhoods` VALUES (null, 12, 'Sur Oriente');

INSERT INTO `neighborhoods` VALUES (null, 13, 'Soacha Central');
INSERT INTO `neighborhoods` VALUES (null, 13, 'Compartir');
INSERT INTO `neighborhoods` VALUES (null, 13, 'La Despensa');
INSERT INTO `neighborhoods` VALUES (null, 13, 'Cazucá');
INSERT INTO `neighborhoods` VALUES (null, 13, 'San Mateo');
INSERT INTO `neighborhoods` VALUES (null, 13, 'San Humberto');

INSERT INTO `neighborhoods` VALUES (null, 14, 'Área Urbana');
INSERT INTO `neighborhoods` VALUES (null, 14, 'Cerca de Piedra');
INSERT INTO `neighborhoods` VALUES (null, 14, 'Fagua');
INSERT INTO `neighborhoods` VALUES (null, 14, 'Fonquetá');
INSERT INTO `neighborhoods` VALUES (null, 14, 'Fusca');
INSERT INTO `neighborhoods` VALUES (null, 14, 'La Balsa');
INSERT INTO `neighborhoods` VALUES (null, 14, 'Samaria');
INSERT INTO `neighborhoods` VALUES (null, 14, 'Tíquiza');
INSERT INTO `neighborhoods` VALUES (null, 14, 'Yerbabuena');
INSERT INTO `neighborhoods` VALUES (null, 14, 'Bojaca');

INSERT INTO `neighborhoods` VALUES (null, 15, 'Norte');
INSERT INTO `neighborhoods` VALUES (null, 15, 'Centro');
INSERT INTO `neighborhoods` VALUES (null, 15, 'Oriental');
INSERT INTO `neighborhoods` VALUES (null, 15, 'Sur Oriental');
INSERT INTO `neighborhoods` VALUES (null, 15, 'Occidental');
INSERT INTO `neighborhoods` VALUES (null, 15, 'Sur Occidental');

INSERT INTO `neighborhoods` VALUES (null, 16, 'Centro');
INSERT INTO `neighborhoods` VALUES (null, 16, 'Centro Oriental');
INSERT INTO `neighborhoods` VALUES (null, 16, 'Oriental');
INSERT INTO `neighborhoods` VALUES (null, 16, 'Sur Oriental');
INSERT INTO `neighborhoods` VALUES (null, 16, 'Nororiental');
INSERT INTO `neighborhoods` VALUES (null, 16, 'Norte');
INSERT INTO `neighborhoods` VALUES (null, 16, 'Noroccidental');
INSERT INTO `neighborhoods` VALUES (null, 16, 'Occidental');
INSERT INTO `neighborhoods` VALUES (null, 16, 'Suroccidental');
INSERT INTO `neighborhoods` VALUES (null, 16, 'Cementerio');

INSERT INTO `neighborhoods` VALUES (null, 17, 'Ferrocarril');
INSERT INTO `neighborhoods` VALUES (null, 17, 'Olímpica');
INSERT INTO `neighborhoods` VALUES (null, 17, 'San Joaquín');
INSERT INTO `neighborhoods` VALUES (null, 17, 'Cuba');
INSERT INTO `neighborhoods` VALUES (null, 17, 'Del Café');
INSERT INTO `neighborhoods` VALUES (null, 17, 'El Oso');
INSERT INTO `neighborhoods` VALUES (null, 17, 'Perla del Otún');
INSERT INTO `neighborhoods` VALUES (null, 17, 'Consota');
INSERT INTO `neighborhoods` VALUES (null, 17, 'El Rocío');
INSERT INTO `neighborhoods` VALUES (null, 17, 'El Poblado');
INSERT INTO `neighborhoods` VALUES (null, 17, 'El Jardín');
INSERT INTO `neighborhoods` VALUES (null, 17, 'San Nicolás');
INSERT INTO `neighborhoods` VALUES (null, 17, 'Centro');
INSERT INTO `neighborhoods` VALUES (null, 17, 'Río Otún');
INSERT INTO `neighborhoods` VALUES (null, 17, 'Boston');
INSERT INTO `neighborhoods` VALUES (null, 17, 'Universidad');
INSERT INTO `neighborhoods` VALUES (null, 17, 'Villavicencio');
INSERT INTO `neighborhoods` VALUES (null, 17, 'Oriente');
INSERT INTO `neighborhoods` VALUES (null, 17, 'Villasantana');

INSERT INTO `neighborhoods` VALUES (null, 18, 'Comuna 1');
INSERT INTO `neighborhoods` VALUES (null, 18, 'Comuna 2');
INSERT INTO `neighborhoods` VALUES (null, 18, 'Comuna 3');
INSERT INTO `neighborhoods` VALUES (null, 18, 'Comuna 4');
INSERT INTO `neighborhoods` VALUES (null, 18, 'Comuna 5');
INSERT INTO `neighborhoods` VALUES (null, 18, 'Comuna 6');
INSERT INTO `neighborhoods` VALUES (null, 18, 'Comuna 7');
INSERT INTO `neighborhoods` VALUES (null, 18, 'Comuna 8');
INSERT INTO `neighborhoods` VALUES (null, 18, 'Comuna 9');
INSERT INTO `neighborhoods` VALUES (null, 18, 'Comuna 10');
INSERT INTO `neighborhoods` VALUES (null, 18, 'Comuna 11');
INSERT INTO `neighborhoods` VALUES (null, 18, 'Comuna 12');
