/*
	Borra las tablas de la BD si existe,
    las vuelve a crear y carga los datos básicos
*/

/* BORRAR TABLAS */
drop table if exists personaje_tiene_trasfondo;
drop table if exists personaje_tiene_ventaja;
drop table if exists usuario_modifica_pnj;
drop table if exists invitacion;
drop table if exists paso;
drop table if exists historia;
drop table if exists resumen;
drop table if exists sesion;
drop table if exists cronica;
drop table if exists pj;
drop table if exists pnj;
drop table if exists imagen;
drop table if exists caracteristicas;
drop table if exists descripcion_personaje;
drop table if exists nota;
drop table if exists relato;
drop table if exists personaje;
drop table if exists pais;
drop table if exists religion;
drop table if exists virtud;
drop table if exists hibris;
drop table if exists arcano;
drop table if exists ventaja;
drop table if exists trasfondo;
drop table if exists usuario;
drop table if exists permisos;


/* CREAR TABLAS */
create table usuario (
	idUsuario int,
    nick varchar(20),
    email varchar(255),
    pass varchar(255),
    administrador tinyint
);

create table invitacion (
	idInvitacion int,
    email varchar(255),
    fecha date,
    clave varchar(20),
    invitadoPor int
);

create table historia (
	idHistoria int,
    nombre varchar(50),
    descripcion varchar(500),
    recompensa varchar(250),
    meta varchar(200),
	abierta tinyint,
    conseguida tinyint,
    idPj int
);

create table paso (
	idPaso int,
    orden int,
    descripcion varchar(500),
	idHistoria int
);


create table sesion (
	idSesion int,
    fecha date,
    sumario text(5000),
    idCronica int,
    masterizadaPor int
);


create table resumen (
	idResumen int,
    resumen text(2500),
    idPj int,
    idSesion int
);


create table cronica (
	idCronica int,
    nombre varchar(100),
    fechaInicio date,
    fechaFinal date
);


create table pais (
	idPais int,
    nombre varchar(30)
);


create table nota (
	idNota int,
    fecha date,
    orden int,
    nota text(1000),
    idPersonaje int
);


create table religion (
	idReligion int,
    nombre varchar(50)
);


create table arcano (
	idArcano int,
    nombre varchar(30)
);

create table virtud(
	idVirtud int,
    nombre varchar(20),
    descripcion varchar(500),
    idArcano int
);

create table hibris(
	idHibris int,
    nombre varchar(20),
    descripcion varchar(500),
    idArcano int
);


create table relato (
	idRelato int,
    fecha date,
    orden int,
    relato text(50000),
    idPersonaje int
);


create table ventaja (
	idVentaja int,
    nombre varchar(50),
    descripcion text(2500),
    coste int,
    costeReducido int,
    reducidoRestriccion varchar(20),
    pericia tinyInt,
    innata tinyInt
);

create table personaje_tiene_ventaja(
	idPersonajeTieneVentaja int,
    idVentaja int,
    idPersonaje int
);


create table trasfondo (
	idTrasfondo int,
    nombre varchar(50),
    descripcion varchar(500),
    peculiaridad varchar(500),
    restriccion varchar(20)
);

create table personaje_tiene_trasfondo(
	idPersonajeTieneTrasfondo int,
    idTrasfondo int,
    idPersonaje int
);


create table imagen (
	idImagen int,
    nombre varchar(50),
    orden int,
    pie varchar(100),
    idPersonaje int
);


create table usuario_modifica_pnj (
	idUsuarioModificaPNJ int,
    fecha datetime,
    idPnj int,
    idUsuario int
);


create table personaje (
	idPersonaje int,
    nombre varchar(50),
    apodo varchar(100),
    concepto varchar(20),
    reputacion varchar(50),
    riqueza int,
    heridasDramaticas int,
    avatar varchar(50),
    vivo tinyInt,
    idVirtud int,
    idHibris int,
    idReligion int,
    idPais int,
    
    apuntar tinyint,
    armas tinyint,
    atletismo tinyint,
    conocimiento tinyint,
    convencer tinyint,
    empatia tinyint, 
    equitacion tinyint,
    esconder tinyint,
    interpretar tinyint,
    intimidar tinyint,
    navegacion tinyint,
    pelear tinyint,
    percepcion tinyint,
    robar tinyint,
    tacticasDeGuerra tinyint,
    tentar tinyint
);

create table descripcion_personaje(
	idDescripcionPersonaje int,
    biografia text(15000),
    fisico text(5000),
    psicologia text(5000),
    idPersonaje int
);

create table caracteristicas(
	idCaracteristicas int,
    musculo tinyint,
    mana tinyint,
    brio tinyint,
    ingenio tinyint,
    donaire tinyint,
    idPersonaje int
);
create table pj (
	idPj int,
    idPersonaje int,
    idUsuario int
);


create table pnj (
	idPnj int,
    idPersonaje int,
    creadoPor int
);

create table permisos(
	idPermiso int,
    controlador varchar(20),
    accion varchar(20),
    permisoAdministrador tinyint    
);


/* CLAVES */ 

alter table arcano 	change  idArcano idArcano int(11)auto_increment primary key;
alter table caracteristicas change  idCaracteristicas idCaracteristicas int(11)auto_increment primary key;
alter table cronica change idCronica idCronica int(11)auto_increment primary key;
alter table descripcion_personaje change idDescripcionPersonaje idDescripcionPersonaje int(11)auto_increment primary key;
alter table hibris change idHibris idHibris int(11)auto_increment primary key;
alter table historia change idHistoria idHistoria int(11)auto_increment primary key;
alter table imagen change idImagen idImagen int(11)auto_increment primary key;
alter table invitacion change idInvitacion idInvitacion int(11)auto_increment primary key;
alter table nota change idNota idNota int(11)auto_increment primary key;
alter table pais change idPais idPais int(11)auto_increment primary key;
alter table paso change idPaso idPaso int(11)auto_increment primary key;
alter table personaje change idPersonaje idPersonaje int(11)auto_increment primary key;
alter table personaje_tiene_trasfondo change idPersonajeTieneTrasfondo idPersonajeTieneTrasfondo int(11)auto_increment primary key;
alter table personaje_tiene_ventaja change idPersonajeTieneVentaja idPersonajeTieneVentaja int(11)auto_increment primary key;
alter table pj change idPj idPj int(11)auto_increment primary key;
alter table pnj change idPnj idPnj int(11)auto_increment primary key;
alter table relato change idRelato idRelato int(11)auto_increment primary key;
alter table religion change idReligion idReligion int(11)auto_increment primary key;
alter table resumen change idResumen idResumen int(11)auto_increment primary key;
alter table sesion change idSesion idSesion int(11)auto_increment primary key;
alter table trasfondo change idTrasfondo idTrasfondo int(11)auto_increment primary key;
alter table usuario change idUsuario idUsuario int(11)auto_increment primary key;
alter table usuario_modifica_pnj change idUsuarioModificaPnj idUsuarioModificaPnj int(11)auto_increment primary key;
alter table ventaja change idVentaja  idVentaja int(11)auto_increment primary key;
alter table virtud change idVirtud idVirtud int(11)auto_increment primary key;
alter table permisos change idPermiso idPermiso int(11)auto_increment primary key;

alter table caracteristicas add constraint FK_caracteristicas_personaje
	foreign key (idPersonaje)
    references Personaje(idPersonaje);
    
alter table descripcion_personaje add constraint FK_descripcionPersonaje_personaje
	foreign key (idPersonaje)
    references Personaje(idPersonaje);
        
alter table hibris add constraint FK_hibris_arcano
	foreign key (idArcano)
    references Arcano(idArcano);
    
alter table historia add constraint FK_historia_pj
	foreign key (idPj)
    references Pj(idPj);
    
alter table imagen add constraint FK_imagen_personaje
	foreign key (idPersonaje)
    references Personaje(idPersonaje);
    
alter table invitacion add constraint FK_invitacion_usuario
	foreign key (invitadoPor)
    references Usuario(idUsuario);
    
alter table nota add constraint FK_nota_personaje
	foreign key (idPersonaje)
    references Personaje(idPersonaje);
    
alter table paso add constraint FK_paso_historia
	foreign key (idHistoria)
    references Historia(idHistoria);
    
alter table personaje add constraint FK_personaje_virtud
	foreign key (idVirtud)
    references Virtud(idVirtud);
    
alter table personaje add constraint FK_personaje_hibris
	foreign key (idHibris)
    references Hibris(idHibris);
    
alter table personaje add constraint FK_personaje_Religion
	foreign key (idReligion)
    references Religion(idReligion);
    
alter table personaje add constraint FK_personaje_pais
	foreign key (idPais)
    references Pais(idPais);
    
alter table personaje_tiene_trasfondo add constraint FK_personajeTieneTrasfondo_trasfondo
	foreign key (idTrasfondo)
    references Trasfondo(idTrasfondo);
    
alter table personaje_tiene_trasfondo add constraint FK_personajeTieneTrasfondo_personaje
	foreign key (idPersonaje)
    references Personaje(idPersonaje);
    
alter table personaje_tiene_ventaja add constraint FK_personajeTieneVentaja_ventaja
	foreign key (idVentaja)
    references Ventaja(idVentaja);
    
alter table personaje_tiene_ventaja add constraint FK_personajeTieneVentaja_personaje
	foreign key (idPersonaje)
    references Personaje(idPersonaje);
    
alter table pj add constraint FK_pj_personaje
	foreign key (idPersonaje)
    references Personaje(idPersonaje);
    
alter table pj add constraint FK_pj_usuario
	foreign key (idUsuario)
    references Usuario(idUsuario);
    
alter table pnj add constraint FK_pnj_personaje
	foreign key (idPersonaje)
    references Personaje(idPersonaje);
    
alter table pnj add constraint FK_pnj_usuario
	foreign key (creadoPor)
    references Usuario(idUsuario);
    
alter table relato add constraint FK_relato_personaje
	foreign key (idPersonaje)
    references Personaje(idPersonaje);
    
alter table resumen add constraint FK_resumen_sesion
	foreign key (idSesion)
    references Sesion(idSesion);
    
alter table resumen add constraint FK_resumen_pj
	foreign key (idPj)
    references Pj(idPj);
    
alter table sesion add constraint FK_sesion_cronica
	foreign key (idCronica)
    references Cronica(idCronica);
    
alter table sesion add constraint FK_sesion_usuario
	foreign key (masterizadaPor)
    references Usuario(idUsuario);
    
alter table usuario_modifica_pnj add constraint FK_usuarioModificaPnj_pnj
	foreign key (idPnj)
    references Pnj(idPnj);    
    
alter table usuario_modifica_pnj add constraint FK_usuarioModificaPnj_usuario
	foreign key (idUsuario)
    references Usuario(idUsuario);
    
alter table virtud add constraint FK_virtud_arcano
	foreign key (idArcano)
    references Arcano(idArcano);



alter table invitacion add constraint UQ_invitacion_email
	UNIQUE (email);
    
alter table usuario add constraint UQ_usuario_email
	UNIQUE (email);
alter table usuario add constraint UQ_usuario_nick
	UNIQUE (nick);
    
/* ARCANO */
insert into arcano (nombre) values('El bufón');
	insert into virtud (nombre, descripcion, idArcano) values('Astuto','Activa tu Virtud para escapar del peligro en la escena actual. Solo te puedes salvar a ti mismo.', (select idArcano from arcano where nombre like 'El bufón'));
	insert into hibris (nombre, descripcion, idArcano) values('Curioso','Recibe 1 punto de héroe cuando investigues algo inusual, especialmente si parece peligroso.', (select idArcano from arcano where nombre like 'El bufón'));
insert into arcano (nombre) values('El camino');
	insert into virtud (nombre, descripcion, idArcano) values('Amigable','Activa tu Virtud cuando te encuentres con un personaje (incluso un villano) por primera vez. Te tratará como a un amigo durante una escena.', (select idArcano from arcano where nombre like 'El camino'));
	insert into hibris (nombre, descripcion, idArcano) values('Inseguro','Recibe 1 punto de héroe cuando tu héroe decida queno puede realizar una acción sin la ayuda de otro héroe. Por ejemplo, puedes insistir para que otro héroe gaste 1 punto de héroe y te dé dados adicionales o pedirle que use una de sus ventajas para ayudarte.', (select idArcano from arcano where nombre like 'El camino'));
insert into arcano (nombre) values('El mago');
	insert into hibris (nombre, descripcion, idArcano) values('Ambicioso', 'Recibe 1 punto de héroe cuando busques poder y el trato que persigas sea peligroso o cause problemas.', (select idArcano from arcano where nombre like 'El mago'));
    insert into virtud (nombre, descripcion, idArcano) values('Decidido','Activa tu Virtud y apunta a un villano. Hasta el final de esta escena, no puedes gastar puntos de héroe y el villano no puede gastar puntos de peligro.', (select idArcano from arcano where nombre like 'El mago'));
insert into arcano (nombre) values('Los amantes');
	insert into hibris (nombre, descripcion, idArcano) values('Malhadado','Recibe 1 punto de héroe cuando tu héroe se enamore de alguien de quien realmente no debería enamorarse.', (select idArcano from arcano where nombre like 'Los amantes'));
	insert into virtud (nombre, descripcion, idArcano) values('Apasionado','Activa tu Virtud para evitar que otro héroe sufra Heridas, pero tú sufrirás 1 Herida Dramática en su lugar.', (select idArcano from arcano where nombre like 'Los amantes'));
insert into arcano (nombre) values('El timón');
	insert into hibris (nombre, descripcion, idArcano) values('Desafortunado','Recibe 2 puntos de héroe cuando decidas fallar un Riesgo importante antes de tirar los dados.', (select idArcano from arcano where nombre like 'El timón'));
	insert into virtud (nombre, descripcion, idArcano) values('Afortunado','Activa tu Virtud para retrasar en una acción una Oportunidad o una Consecuencia.', (select idArcano from arcano where nombre like 'El timón'));
insert into arcano (nombre) values('El diablo');
	insert into hibris (nombre, descripcion, idArcano) values('Cándido','Recibe 1 punto de héroe cuando aceptes las mentiras de alguien o un trato injusto.', (select idArcano from arcano where nombre like 'El diablo'));
	insert into virtud (nombre, descripcion, idArcano) values('Agudo','Activa tu Virtud después de que un villano gaste Aumentos en una acción. Esa acción falla y el villano pierde los Aumentos que gastó.', (select idArcano from arcano where nombre like 'El diablo'));
insert into arcano (nombre) values('La torre');
	insert into hibris (nombre, descripcion, idArcano) values('Arrogante','Recibe 1 punto de héroe cuando tu héroe demuestre desdén o desprecio o subestime a un villano o a alguien que podría dañar a tus amigos.', (select idArcano from arcano where nombre like 'La torre'));
	insert into virtud (nombre, descripcion, idArcano) values('Humilde','Activa tu Virtud para conseguir 2 puntos de héroe, en lugar 1, cuando actives tu Hibris o una Peculiaridad.', (select idArcano from arcano where nombre like 'La torre'));
insert into arcano (nombre) values('El mendigo');
	insert into hibris (nombre, descripcion, idArcano) values('Envidioso','Recibe 1 punto de héroe cuando tu héroe codicie algo y haga algo imprudente para conseguirlo.', (select idArcano from arcano where nombre like 'El mendigo'));
	insert into virtud (nombre, descripcion, idArcano) values('Sagaz','Activa tu Virtud para saber la especialidad de la banda de matones a la que te enfrentas o para descubrir el nivel y las ventajas de un villano.', (select idArcano from arcano where nombre like 'El mendigo'));
insert into arcano (nombre) values('La bruja');
	insert into hibris (nombre, descripcion, idArcano) values('Manipulador','Recibe 1 punto de héroe cuando intentes hacer que otra persona haga el trabajo sucio por ti y te salga el tiro por la culata.', (select idArcano from arcano where nombre like 'La bruja'));
	insert into virtud (nombre, descripcion, idArcano) values('Intuitivo','Activa tu Virtud para hacerle al DJ una pregunta sobre un PNJ que pueda responderse con un «sí» o «no». Si hay algún matiz en la respuesta, el DJ debería ser generoso y responder con más detalle.', (select idArcano from arcano where nombre like 'La bruja'));
insert into arcano (nombre) values('La guerra');
	insert into hibris (nombre, descripcion, idArcano) values('Leal','Recibe 1 punto de héroe cuando tu héroe vuelva atrás a por un compañero caído o se niegue a dejar a un aliado herido.', (select idArcano from arcano where nombre like 'La guerra'));
	insert into virtud (nombre, descripcion, idArcano) values('Victorioso','Activa tu Virtud la primera vez que inflijas Heridas a un villano durante una pelea para obligarle a que reciba 1 Herida Dramática, además de las Heridas que normalmente infligirías.', (select idArcano from arcano where nombre like 'La guerra'));
insert into arcano (nombre) values('El ahorcado');
	insert into hibris (nombre, descripcion, idArcano) values('Indeciso','Recibe 1 punto de héroe cuando tu héroe gaste una acción para detenerse vacilando, dudando o inseguro antes de realizar un movimiento.', (select idArcano from arcano where nombre like 'El ahorcado'));
	insert into virtud (nombre, descripcion, idArcano) values('Altruista','Activa tu Virtud para sufrir las Consecuencias de un Riesgo en lugar de otro héroe.', (select idArcano from arcano where nombre like 'El ahorcado'));
insert into arcano (nombre) values('Monedas (para el barquero)');
	insert into hibris (nombre, descripcion, idArcano) values('Firme','Recibe 1 punto de héroe cuando te metas en problemas si te niegas a irte o cuando te retiras en un momento en el que tengas ventaja.', (select idArcano from arcano where nombre like 'El'));
	insert into virtud (nombre, descripcion, idArcano) values('Flexible','Activa tu Virtud para realizar tu primera acción antes que todos los demás en una ronda.', (select idArcano from arcano where nombre like 'El'));
insert into arcano (nombre) values('Los tronos');
	insert into hibris (nombre, descripcion, idArcano) values('Testarudo','Recibe 1 punto de héroe cuando tu héroe sea testarudo y se niegue a cambiar de opinión ante la evidencia.', (select idArcano from arcano where nombre like 'Los tronos'));
	insert into virtud (nombre, descripcion, idArcano) values('Confortador','Activa tu Virtud para cancelar los efectos del Miedo sobre tus amigos y tú.', (select idArcano from arcano where nombre like 'Los tronos'));
insert into arcano (nombre) values('La noche sin luna');
	insert into hibris (nombre, descripcion, idArcano) values('Confuso','Recibe 1 punto de héroe cuando tu héroe no consiga entender un elemento importante de la trama y el malentendido conduzca además a un peligro, para sí mismo o para otros.', (select idArcano from arcano where nombre like 'La noche sin luna'));
	insert into virtud (nombre, descripcion, idArcano) values('Sutil','Activa tu Virtud cuando actúes entre bambalinas, desde las sombras o a través de un representante. Para el siguiente Riesgo, cuando determines los Aumentos, cada dado cuenta como 1 Aumento.', (select idArcano from arcano where nombre like 'La noche sin luna'));
insert into arcano (nombre) values('El sol');
	insert into hibris (nombre, descripcion, idArcano) values('Orgulloso','Recibe 1 punto de héroe cuando tu héroe se niegue a aceptar la ayuda que se le ofrece. Por ejemplo, cuando un héroe quiera gastar 1 punto de héroe para darte 1 dado adicional y tú lo rechaces.', (select idArcano from arcano where nombre like 'El sol'));
	insert into virtud (nombre, descripcion, idArcano) values('Glorioso','Activa tu Virtud cuando seas el centro de atención. Para el siguiente Riesgo, cuando determines tus Aumentos, cada dado cuenta como 1 Aumento.', (select idArcano from arcano where nombre like 'El sol'));
insert into arcano (nombre) values('El profeta');
	insert into hibris (nombre, descripcion, idArcano) values('Prepotente','Recibe 1 punto de héroe cuando tu héroe defienda firmemente una de sus opiniones en un momento o lugar inadecuados.', (select idArcano from arcano where nombre like 'El profeta'));
	insert into virtud (nombre, descripcion, idArcano) values('Iluminado','Activa tu Virtud para saber, hasta el final de la escena, cuándo te está mintiendo cualquier otro personaje.', (select idArcano from arcano where nombre like 'El profeta'));
insert into arcano (nombre) values('Reunión');
	insert into hibris (nombre, descripcion, idArcano) values('Rencoroso','Recibe 1 punto de héroe cuando saques antiguos rencores o malos sentimientos y eso haga que te metas en problemas.', (select idArcano from arcano where nombre like 'Reunión'));
	insert into virtud (nombre, descripcion, idArcano) values('Ejemplar','Activa tu Virtud y elige otro héroe que se encuentre en la misma escena para sumar vuestra reserva de Aumentos durante toda la ronda. Para realizar acciones gastáis Aumentos de esta reserva compartida.', (select idArcano from arcano where nombre like 'Reunión'));
insert into arcano (nombre) values('El héroe');
	insert into hibris (nombre, descripcion, idArcano) values('Imprudente','Recibe 1 punto de héroe cuando tus acciones atrevidas, arrogantes o temerarias te provoquen problemas a ti y a otro héroe.', (select idArcano from arcano where nombre like 'El héroe'));
	insert into virtud (nombre, descripcion, idArcano) values('Valiente','Activa tu Virtud para añadir tantos dados adicionales a tu Riesgo como el valor de Miedo de tu objetivo.', (select idArcano from arcano where nombre like 'El héroe'));
insert into arcano (nombre) values('El glifo');
	insert into hibris (nombre, descripcion, idArcano) values('Supersticioso','Recibe 1 punto de héroe cuando te niegues a resolver un problema usando Hechicería, un artefacto o cualquier otro efecto místico en el que no confías.', (select idArcano from arcano where nombre like 'El glifo'));
	insert into virtud (nombre, descripcion, idArcano) values('Frugal','Activa tu Virtud para evitar que te afecte cualquier efecto mágico (hechicería, artefactos, monstruos, etcétera).', (select idArcano from arcano where nombre like 'El glifo'));
insert into arcano (nombre) values('El emperador');
	insert into hibris (nombre, descripcion, idArcano) values('Temperamental','Recibe 1 punto de héroe cuando tu héroe pierda los estribos y se enfurezca y eso cause problemas.', (select idArcano from arcano where nombre like 'El emperador'));
	insert into virtud (nombre, descripcion, idArcano) values('Imponente','Activa tu Virtud y el DJ le dará 1 punto de héroe al resto de héroes que se encuentren en esta escena.', (select idArcano from arcano where nombre like 'El emperador'));

/* PAÍS */
insert into pais (nombre) values ('Ávalon');
insert into pais (nombre) values ('Inismore');
insert into pais (nombre) values ('Las Marcas Altas');
insert into pais (nombre) values ('Castilla');
insert into pais (nombre) values ('Eisen');
insert into pais (nombre) values ('La mancomunidad Sármata');
insert into pais (nombre) values ('Montaigne');
insert into pais (nombre) values ('Ussura');
insert into pais (nombre) values ('Vestenmennavenjar');
insert into pais (nombre) values ('Vodacce');

/*RELIGIÓN*/
insert into religion (nombre) values ('Iglesia Vaticana');
insert into religion (nombre) values ('Iglesia de Ávalon');
insert into religion (nombre) values ('Iglesia Ortodoxa Ussura');
insert into religion (nombre) values ('Objeccionismo');
insert into religion (nombre) values ('Druidas de Ávalon');
insert into religion (nombre) values ('Atigua Fe de Inismore');
insert into religion (nombre) values ('Antigua Fe de las Marcas Altas');
insert into religion (nombre) values ('Antigua Fe de Ussura');
insert into religion (nombre) values ('Tradición Rzeczpospolita');
insert into religion (nombre) values ('Tradición Curonia');
insert into religion (nombre) values ('Tradición Vestenia');
insert into religion (nombre) values ('Ateo');
insert into religion (nombre) values ('Agnóstico');
insert into religion (nombre) values ('NS/NC');

/*TRASFONDO*/
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Aristócrata',
        'Naciste en el seno de la nobleza de tu país natal y asistes con regularidad a las cortes.',
        'Ganas 1 punto de héroe cuando demuestres que la nobleza es algo más que ropa cara y estar en la corte.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Arqueólogo',
        'Estudias las ruinas syrneth y exploras los lugares perdidos de Terra.',
        'Ganas 1 punto de héroe cuando lleves un artefacto de valor a una universidad, un museo o un lugar donde se expondrá públicamente.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Artesano',
        'Trabajas sin descanso para crear objetos útiles.',
        'Ganas 1 punto de héroe cuando uses tus habilidades artesanas diarias para resolver un problema aparentemente demasiado complejo como para tener una solución tan simple.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Artista',
        'Trabajas sin descanso para crear objetos de gran belleza.',
        'Ganas 1 punto de héroe cuando te sacrifiques para hacer de Théah un lugar más hermoso.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Asesino',
        'Acechas en la sombra como un espectro de la muerte silenciosa a cambio de una moneda ensangrentada, pero no más.',
        'Ganas 1 punto de héroe cuando te desvíes del camino marcado para evitar así la muerte de un adversario o evitar hacer algo que podría resultar en la muerte de otra persona.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Caballero',
        'Eres un guerrero a caballo y formas parte de la estimada caballería de tu nación.',
        'Ganas 1 punto de héroe cuando apliques tus habilidades montando a caballo en una situación poco común.',
		null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Capitán de Barco',
        'Das órdenes a una tripulación y surcas los mares por cualquier bandera que hondees.',
        'Ganas 1 punto de héroe cuando seas el último de tu tripulación en ponerse a salvo.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Cazador',
        'Duermes bajo las estrellas y cazas tu comida con tus propias manos.',
        'Ganas 1 punto de héroe cuando uses tu perspicacia de cazador para salvar a alguien del peligro.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Cortesano',
        'Asistes con regularidad a las cortes de tu nación natal y actúas como diplomático en las cortes extranjeras.',
        'Ganas 1 punto de héroe cuando consigas aplacar una situación violenta con tu encanto y talento.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Granjero',
        'Te criaste en una granja pequeña, trabajando para sobrevivir, y nunca has conocido la vida de aventura.',
        'Ganas 1 punto de héroe cuando resuelvas un problema complejo de una forma sencilla que ya conoces de tu vida en la granja.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Criminal',
        'Rompes las leyes injustas para conseguir lo que crees que es un bien mayor.',
        'Ganas 1 punto de héroe cuando rompas la ley para perseguir una empresa noble.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Erudito',
        'Te dedicas a aprender y a documentar todas las maravillas de Terra.',
        'Ganas 1 punto de héroe cuando te pongas en peligro por ir tras el conocimiento.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Espadachín',
        'Has dedicado tu vida a dominar la espada.',
        'Ganas 1 punto de héroe cuando recurras al filo de tu espada para defender un ideal noble.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Espía',
        'Sirves a tu nación infiltrándote entre sus enemigos y consiguiendo sus secretos.',
        'Ganas 1 punto de héroe cuando corras un gran riesgo para descubrir un secreto.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Explorador',
        'Vives para ver los lugares más lejanos que Terra tiene para ofrecer.',
        'Ganas 1 punto de héroe cuando pongas la mirada sobre un paisaje que pocos théanos, o ninguno, han visto antes.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Huérfano',
        'Perdiste a tus padres a una edad temprana y te has visto obligado a cuidar de ti mismo.',
        'Ganas 1 punto de héroe cuando te pongas en peligro para asegurarte de que otra persona no tenga que estar sola.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Ingeniero',
        'Estás interesado en aplicar el conocimiento científico, las matemáticas y el ingenio para desarrollar soluciones a los problemas técnicos, sociales y comerciales.',
        'Ganas 1 punto de héroe cuando utilices tu destreza tecnológica para resolver un problema.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Intendente',
        'Sirves en un barco y te haces cargo de todas las cosas que ignoran los marineros.',
        'Ganas 1 punto de héroe cuando resuelvas un problema para tu tripulación.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Intérprete',
        'Trabajas sin descanso para crear una experiencia de belleza.',
        'Ganas 1 punto de héroe cuando uses tus habilidades de complacer al público por algo más que conseguir unas cuantas monedas.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Jenny',
        'Seduces a otros para divertirte y sacar beneficio.',
        'Ganas 1 punto de héroe cuando resuelvas un conflicto con la seducción o con artimañas.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Marinero',
        'No sirves a ningún país ni dueño, pero el barco y tu tripulación son toda la familia que necesitas.',
        'Ganas 1 punto de héroe cuando pongas a un lado tus deseos personales para asegurar la seguridad y la comodidad de tus aliados.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Médico',
        'Trabajas para curar a los enfermos y asistir a los heridos.',
        'Ganas 1 punto de héroe cuando cures las heridas de un villano o de inocentes heridos por un villano.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Mercader',
        'Viajas por la campiña para vender tus mercancías en mercados o puertos.',
        'Ganas 1 punto de héroe cuando vendas un objeto por mucho menos de lo que vale a alguien que lo necesita desesperadamente.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Mercenario',
        'Vendes tus habilidades en batalla al mejor postor.',
        'Ganas 1 punto de héroe cuando elijas llevar a cabo tu trabajo por una razón que para ti vale más que el dinero.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Oficial de la Marina',
        'Te enrolaste en la marina y te abriste paso en la tripulación de un barco.',
        'Ganas 1 punto de héroe cuando pongas las necesidades de la tripulación por encima de las de la misión.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Oficial del Ejército',
        'Te enrolaste en el ejército y pronto te encontraste en una posición de mando.',
        'Ganas 1 punto de héroe cuando tomes el mando durante un momento de intensa violencia o de extremo peligro.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Pirata',
        'Surcas los mares tomando lo que necesitas y otorgando verdadera libertad a todos los que acepten la llamada.',
        'Ganas 1 punto de héroe cuando hagas un sacrificio personal para asegurar la libertad de otro.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Profesor',
        'Enseñas a otros en una prestigiosa institución de enseñanza.',
        'Ganas 1 punto de héroe cuando uses conocimientos sacados de un texto enrevesado para resolver un problema complejo.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Pugilista',
        'Confías en tus manos y en tus pies para resolver todos los problemas violentos de tu vida.',
        'Ganas 1 punto de héroe cuando tires lo que estés sujetando para luchar con los puños, independientemente del arma de tu oponente.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Sacerdote',
        'Sirves a una causa mayor con cada aliento que respiras.',
        'Ganas 1 punto de héroe cuando dejes a un lado la retórica y pongas en práctica las virtudes que predicas.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Sirviente',
        'Trabajas para otro haciendo lo que tu amo te dice que hagas.',
        'Ganas 1 punto de héroe cuando te pongas en peligro para ayudar a otro personaje en una tarea difícil.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Soldado',
        'Sabes cómo luchar y cómo matar, y te has ganado la vida haciéndolo bajo estandartes y para otros señores.',
        'Ganas 1 punto de héroe cuando te ciñas al plan independientemente del peligro que te suponga.',
        null
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Agente Unificador',
        'La Corona de Ávalon te ha encomendado la tarea de mantener la paz entre sus islas.',
        'Ganas 1 punto de héroe cuando asegures la estabilidad de la Unificación de las Islas del Glamour.',
        'Islas Glamour'
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Bardo',
        'Cuentas antiguos relatos y las historias de las Leyendas, y te aseguras de que el alma de Ávalon nunca se olvide.',
        'Ganas 1 punto de héroe cuando resuelvas un problema siguiendo un ejemplo establecido por una Leyenda.',
        'Islas Glamour'
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Caballero Errante',
        'Estás imbuido con la magia legendaria de los caballeros del rey Elilodd.',
        'Ganas 1 punto de héroe cuando defiendas un ideal de virtud caballeresca de una forma que haga que te metas en problemas.',
        'Islas Glamour'
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Corsario',
        'Se te ha dado un acta constitutiva para hundir cualquier barco que sea enemigo de la Corona de Ávalon.',
        'Ganas 1 punto de héroe cuando derrotes enemigos de la Corona de Ávalon.',
        'Islas Glamour'
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Puritano',
        'Eres un objecionista reformado que busca «purificar» la Iglesia de Ávalon de todas las prácticas vaticanas.',
        'Ganas 1 punto de héroe cuando expongas la corrupción, la hipocresía o la inefectividad dentro de la Iglesia vaticana.',
        'Ávalon'
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Saoi (Sabio)',
        'Tienes el mayor honor concedido por Aosdána, una asociación de artistas creativos inismoreses financiada por el Estado.',
        'Ganas 1 punto de héroe cuando te interpongas ante el daño para proteger a los artistas de Théah.',
        'Inismore'
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Seanchaidh (Guerrero-Poeta)',
        'Eres un cuentacuentos y un historiador, versado en las leyes de tu pueblo y sus antiguas costumbres.',
        'Ganas 1 punto de héroe cuando hagas cumplir las antiguas leyes de tu pueblo.',
        'Marcas Altas'
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Alquimista',
        'Buscaste durante mucho tiempo y arduamente hasta que descubriste el misterio de la creación alquímica.',
        'Ganas 1 punto de héroe cuando mejores la vida de otro théano a través de la alquimia.',
        'Castilla'
    );
insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Antropólogo',
        'Eres primo del arqueólogo, pero te centras en la gente que encuentras, no en las ruinas que dejaron detrás.',
        'Ganas 1 punto de héroe cuando resuelvas un problema para un grupo de extranjeros.',
        'Castilla'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Diestro',
        'Has dedicado tu vida a entender la espada, no solo su función.',
        'Ganas 1 punto de héroe cuando superes a un espadachín en su propio terreno.',
        'Castilla'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Mirabilis (Sacerdote)',
        'Eres un maestro erudito de la Iglesia vaticana y miembro de la Ordo Doctorem Mirabilis.',
        'Ganas 1 punto de héroe cuando te desvivas por demostrar la calidez y la compasión de la Iglesia vaticana.',
        'Castilla'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Hexe',
        'Eres un maestro de la Hexenwerk, la hechicería de los muertos.',
        'Ganas 1 punto de héroe cuando te apartes de tu camino para asegurarte de que lo muerto permanece muerto.',
        'Eisen'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Krieger (Guerrero)',
        'Sobreviviste a la Guerra de la Cruz y llevas las cicatrices de muchas batallas en tu piel.',
        'Ganas 1 punto de héroe cuando decidas luchar para defender al indefenso o evitar la destrucción.',
        'Eisen'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Ungetümjäger (Cazamonstruos)',
        'Sabes que hay criaturas antinaturales que merodean por tu tierra natal y has jurado destruirlas.',
        'Ganas 1 punto de héroe cuando decidas cazar criaturas inhumanas para que no vuelvan a hacerle daño a nadie.',
        'Eisen'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Vitalienbruder (Pirata)',
        'Eres uno de los muchos hermanos de Eisen dedicados al comercio justo y al reparto equitativo.',
        'Ganas 1 punto de héroe cuando les robes a los ricos para dárselo a los pobres.',
        'Eisen'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'L''ami du Roi (Cortesano)',
        'Eres, literalmente, uno de los cortesanos favoritos del rey de Montaigne.',
        'Ganas 1 punto de héroe cuando utilices la influencia del favor del rey para resolver un problema.',
        'Montaigne'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Mousquetaire',
        'Has jurado proteger al rey de Montaigne y a tus compañeros mosqueteros hasta la muerte.',
        'Has jurado proteger al rey de Montaigne y a tus compañeros mosqueteros hasta la muerte.',
        'Montaigne'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Révolutionnaire',
        'Te has prometido a ti mismo ver a tu país liberado de la tiranía de la aristocracia.',
        'Ganas 1 punto de héroe cuando hagas un sacrificio personal por el bien de la libertad.',
        'Montaigne'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Sorcier Porté',
        'Has dominado el arte de Porté, la magia que abre portales.',
        'Ganas 1 punto de héroe cuando cierres una blessure que rasgó un villano.',
        'Montaigne'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Húsar alado',
        'Sirves en el regimiento de caballería más respetado, una unidad de élite del ejército sármata.',
        'Ganas 1 punto de héroe cuando tu montura y tú os precipitéis de cabeza a una batalla o conflicto, sin preocuparte del peligro.',
        'Sarmacia'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Poseł (Enviado)',
        'Actúas como consejero de todos los votantes de la Mancomunidad.',
        'Ganas 1 punto de héroe cuando exijas cumplir con la democracia precisamente en los momentos en los que sería más ventajoso para ti que no se realizase una votación.',
        'Sarmacia'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Tremtis (Expatriado)',
        'Huiste a la Mancomunidad en busca de asilo después de  que se declarara la Libertad Dorada.',
        'Ganas 1 punto de héroe cuando algo de tu pasado vuelva para atormentarte.',
        'Sarmacia'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Žynys (Adivino)',
        'Te encontraste con el Diablo en tu caminar, lo engañaste y conseguiste que sus poderes estuvieran a tus órdenes.',
        'Ganas 1 punto de héroe cuando uses algo malvado para hacer el bien.',
        'Sarmacia'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Ballenero',
        'Surcas los mares helados de Ussura con lanzas y barcos persiguiendo la vida marina más peligrosa.',
        'Ganas 1 punto de héroe cuando te enfrentes a una criatura que podría tragarse a un hombre entero.',
        'Ussura'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Cosaco',
        'Vives en las estepas orientales de Ussura, un lugar con una orgullosa herencia de equitación y guerra.',
        'Ganas 1 punto de héroe cuando dejes atrás algo importante para poder viajar ligero de equipaje.',
        'Ussura'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Progresista',
        'Viajas por Théah para llevar a tu hogar las innovaciones que modernizarán a tu antiguo país.',
        'Ganas 1 punto de héroe cuando arriesgues tu vida y tu integridad para proteger un objeto de tecnología avanzada.',
        'Ussura'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Tocado por Matushka',
        'Matushka te ha tocado y te ha concedido un gran poder a cambio de un precio terrible.',
        'Ganas 1 punto de héroe cuando le enseñes a alguien una lección de un modo que haría que Matushka se sintiera orgullosa.',
        'Ussura'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Bearsark',
        'Luchas con una furia casi incontrolable, como en un trance.',
        'Ganas 1 punto de héroe cuando dejes que el director de juego elija la siguiente acción de tu personaje.',
        'Vestenmennavenjar'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Guildmästaren',
        'Sirves a la Liga de Vendel y manejas gremiales con una cierta habilidad.',
        'Ganas 1 punto de héroe cuando uses los vastos recursos de la Liga de Vendel para algo más noble que el beneficio.',
        'Vestenmennavenjar'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Sjørøver (Pirata)',
        'Rindes honor a la antigua herencia de Vestenmennavenjar de combate naval, saqueo y pillaje.',
        'Ganas 1 punto de héroe cuando te pongas en peligro para asegurarte tu lugar de honor en la mesa del Padre de Todos.',
        'Vestenmennavenjar'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Skald',
        'Interpretas los misterios del fuego y los huesos, compartiendo relatos de gloria y derrota.',
        'Ganas 1 punto de héroe cuando uses tu conocimiento como Seidr para ayudar a otro héroe a resolver un problema o boicotear a un villano.',
        'Vestenmennavenjar'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Bravo',
        'Has jurado proteger a alguien y siempre estarás a su lado.',
        'Ganas 1 punto de héroe cuando te pongas a ti mismo en peligro para defender la vida de la persona que has jurado proteger.',
        'Vodacce'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Consigliere',
        'Trabajas como «consejero» para un Príncipe Mercader.',
        'Ganas 1 punto de héroe cuando corras un gran riesgo para proteger el secreto de otra persona.',
        'Vodacce'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Esploratore',
        'Viajas por el mundo en beneficio de un Príncipe Mercader.',
        'Ganas 1 punto de héroe cuando uses objetos o conocimiento que no sean de Théah para resolver un problema.',
        'Vodacce'
    );

insert into trasfondo (nombre, descripcion, peculiaridad, restriccion) values(
		'Sorte Strega',
        'Puedes sentir los hilos del Destino, torcerlos y controlarlos a tu voluntad… pero no sin un precio.',
        'Ganas 1 punto de héroe cuando te comprometas a una acción peligrosa que crees que es el destino.',
        'Mujeres de Vodacce'
    );


/*VENTAJAS*/
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Buen bebedor',
    'El alcohol nunca te afecta negativamente, no importa cuánto bebas.',
    1,
    1,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Estómago de hierro',
    'La comida estropeada o cruda nunca te afecta negativamente y sigues consiguiendo el sustento necesario de ella.',
    1,
    1,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Extranjero',
    'Elige una nación de Théah que no sea tu tierra natal; ahí será donde te criaste. Por ejemplo, si tus padres eran castellanos pero te criaste en Vodacce, podrías ser Extranjero (Vodacce). Cualquier Riesgo que realices que se beneficiaría de una herencia doble (como usar Convencer para negociar entre dos mercaderes originarios de tus dos culturas o usar Tentar para saber qué decir para sobornar a una patrulla fronteriza y que te deje pasar sin inspeccionarte) consigue 1 dado adicional.',
    1,
    1,
    null,
    0,
    1
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Grande',
    'No puedes adquirir la ventaja «Pequeño». Consigues 1 dado adicional en cualquier Riesgo que se vea beneficiado debido a tu tamaño, como por ejemplo, usar Atletismo para correr a toda velocidad mientras llevas a cuestas a otro héroe o acercarte a alguien para achantarlo con Intimidar.',
    1,
    1,
    null,
    0,
    1
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Lingüista',
    'Hablas, lees y escribes todas las lenguas de Théah, incluso las muertas.',
    1,
    1,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Noción del tiempo',
    'Siempre sabes qué hora es. Sabes cuánto falta hasta el siguiente amanecer o puesta de sol con menos de un minuto de margen de error.',
    1,
    1,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Pequeño',
    'No puedes adquirir la ventaja «Grande». Eres más pequeño que el resto de théanos medios. Mucho más pequeño. Consigues 1 dado adicional si tu tamaño hace que un Riesgo sea más fácil (como usar Esconder para escabullirte en un espacio pequeño y escapar de una patrulla de guardias o usar Atletismo para deslizarte entre los barrotes de una celda).',
    1,
    1,
    null,
    0,
    1
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Sentido de la orientación',
    'Nunca te pierdes mientras tengas un punto de referencia, aunque eso no es lo mismo que saber exactamente dónde estás. Si te dejan inconsciente y te despiertas en una mazmorra, no tienes por qué saber en qué ciudad estás, pero si consigues escapar de la celda nunca te desviarás en los serpenteantes túneles de la mazmorra.',
    1,
    1,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Superviviente',
    'Si te encuentras en la naturaleza, puedes forrajear o cazar y encontrar comida suficiente para ti y otras cinco personas. Bajo circunstancias extremas (perdido en medio de un desierto o abandonado en la tundra ussura, por ejemplo), encuentras comida suficiente para ti y otras dos personas.',
    1,
    1,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Uno con el barco',
    'Nunca pierdes el equilibrio mientras te encuentres a bordo de un barco. Además, consigues 1 dado adicional en cualquier Riesgo físico mientras estés a bordo de un barco en el mar (como enzarzarte en una lucha con espadas en la cubierta de un barco inclinado o escalar por el cordaje durante una tormenta).',
    1,
    1,
    null,
    0,
    0
	);
    
    
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Allanamiento de morada',
    'Puedes gastar 1 punto de héroe para localizar un modo de entrar en un edificio o en un área restringida. Puedes llevar contigo hasta un personaje, pero el resto tiene que encontrar su propio modo de entrar o esperar hasta que les abras un camino.',
    2,
    2,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Amigos en la corte',
    'Cuando estés en un baile, un banquete o un acto similar de la alta sociedad, gasta 1 punto de héroe para revelar que tienes un amigo cercano que también está presente.',
    2,
    2,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Callejero',
    'Puedes gastar 1 punto de héroe para localizar a alguien que te arregle un asunto, un soplón, un contrabandista o una figura similar de los bajos fondos.',
    2,
    2,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Casado con el mar',
    'Tienes acceso a un barco. Si tus aliados y tú ya tenéis acceso a un barco, entonces este gana un Trasfondo adicional. Ver el capítulo de «Navegación» para más información.',
    2,
    2,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Chist, por aquí',
    'Mientras no te detecten, puedes gastar 1 punto de héroe para atraer a un solo personaje hasta tu posición y noquearlo. Otros personajes que se encuentren en la misma área no se dan cuenta de tu presencia.',
    2,
    2,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Contactos',
    'Tienes contactos que pueden darte información o ayudarte cuando lo necesites. Elije un tipo de contacto, como «Bajos fondos de Freiburg», «Guardia de la ciudad de Cinco Velas» o «Cortesanos de la clase alta de Vodacce», por ejemplo. Siempre puedes contactar con alguien de ese grupo que te dará información básica o te ayudará de alguna forma menor, siempre y cuando no le cueste nada o no lo ponga en peligro. Si quieres información más difícil de encontrar o un favor peligroso, debes gastar 1 punto de héroe o aceptar un precio que estipule tu contacto, como pagarle dinero o aceptar hacerle un favor a cambio.',
    2,
    2,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Derrota temeraria',
    'Gasta 1 punto de héroe para derrotar de manera inmediata a una sola banda de matones, independientemente de su Fuerza, pero recibes 1 Herida Dramática.',
    2,
    2,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Equilibrio perfecto',
    'Gasta 1 punto de héroe para moverte por una viga estrecha, saltar de un lugar a otro o realizar cualquier otra hazaña de perfecta agilidad y equilibrio.',
    2,
    2,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Espíritu valiente',
    'Empiezas cada partida con 2 puntos de héroe, en lugar de 1.',
    2,
    2,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Fascinar',
    'Gasta 1 punto de héroe para llamar la atención de otro personaje, que sólo estará atento a ti hasta el final de la escena o hasta que dejes de hablarle o prestarle atención, lo que suceda primero.',
    2,
    2,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Hechicería',
    'Consigues la Hechicería de la línea sanguínea de tu nación. Si adquieres esta ventaja después de crear el héroe, solo puedes hacerlo con una historia de héroe. Ver el capítulo de «Hechicería» para más información.',
    2,
    2,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Inmunidad al veneno',
    'El veneno nunca te afecta, aparte de un ligero malestar. Si normalmente el veneno te mataría, solo te hará vomitar, pero no tiene otros efectos secundarios.',
    2,
    1,
    'Vodaccio',
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Inspirar generosidad',
    'Gasta 1 punto de héroe para convencer a otro personaje de que te dé un objeto que quieres sin ningún coste. Podría darte algo que ya tiene o intentar conseguírtelo por todos los medios, legales o ilegales, sea cual sea la forma más fácil para él de echarle el guante a lo que quieres.',
    2,
    2,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Liberarse',
    'Gasta 1 punto de héroe para liberar tus manos de unas esposas, desatarte la cuerda que te ata a una silla o liberarte a ti mismo de cualquier otra forma similar.',
    2,
    2,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Liderazgo',
    'Gasta 1 punto de héroe para inspirar a un grupo a que actúe. El grupo debe poder oírte, pero si pueden hacerlo y son neutrales o tienen una buena disposición, harán lo que les mandes mientras sea algo razonable (probablemente no se tiren por un puente hacia una muerte segura, por ejemplo).',
    2,
    1,
    'Sármata',
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'¡Lo tengo!',
    'Gasta 1 punto de héroe para abrir una cerradura, abrir una caja fuerte o desactivar una trampa de manera inmediata.',
    2,
    2,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Mañoso',
    'Gasta 1 punto de héroe para reparar un objeto roto, apañar una pistola estropeada, parchear un barco que tiene una fuga o realizar milagros similares que hagan que el objeto funcione con normalidad durante el resto de la escena. Al final de la escena, o si el objeto sufre cualquier daño adicional, este se vuelve inservible hasta que tengas tiempo de realizar una reparación seria con las herramientas adecuadas.',
    2,
    2,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Mirar fijamente',
    'Gasta 1 punto de héroe para intimidar a un personaje y que retire una amenaza, te deje entrar donde no deberías o que se quite de tu camino de cualquier otro modo.',
    2,
    1,
    'Eiseno',
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Parientes lejanos',
    'Gasta 1 punto de héroe para revelar que tienes un primo lejano que vive cerca y que puede ayudarte con materiales, información o refugio.',
    2,
    1,
    'Ussuro',
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Regatear',
    'Gasta 1 punto de héroe para convencer a alguien de que haga un trato contigo, que te haga un descuento razonable o que le asegure a alguien que te conoce que «eres bueno en algo».',
    2,
    1,
    'Islas Glamour',
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Reputación',
    'Determina cuál es tu reputación con un solo adjetivo («Honorable», «Vicioso», etcétera). Cuando uses tu reputación para sacar ventaja en los Riesgos sociales, consigues 1 dado adicional. Puedes comprar esta ventaja varias veces; cada vez que lo hagas, puedes ganar una nueva Reputación o aumentar el número de dados adicionales que consigues cuando invocas una Reputación ya definida.',
    2,
    2,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Sonrisa encantadora',
    'Gasta 1 punto de héroe para evitar que otro personaje saque un arma, empiece una pelea o recurra a la violencia. Se defenderá si le atacan, pero no empezará ningún conflicto violento.',
    2,
    2,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Trabajo en equipo',
    'Puedes gastar 2 Aumentos para crear una Oportunidad y activar la Oportunidad en beneficio de otro héroe voluntario, que no necesita gastar su propio Aumento.',
    2,
    2,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Ven aquí',
    'Gasta 1 punto de héroe para atraer a otro personaje a una habitación privada y marcharte después de dicha habitación sin él, con lo que lo sacas de la escena. Puede ser rescatado después de que te marches.',
    2,
    2,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Vista de lince',
    'Puedes ver perfectamente hasta una distancia de un kilómetro y medio mientras tengas una línea de visión despejada. Si usas un catalejo incluso puedes distinguir detalles, como la inscripción de un anillo. Si realizas un Riesgo que se base principalmente en tu visión, consigues 1 dado adicional.',
    2,
    2,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Voluntad indómita',
    'Gasta 1 punto de héroe para resistirte automáticamente después de que otro personaje intente intimidarte, seducirte o provocarte.',
    2,
    2,
    null,
    1,
    0
	);
    
    
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Boxeador',
    'Ganas 1 dado adicional cuando realices un Riesgo de Pelear para dar un puñetazo, una patada, un cabezazo o para herir de cualquier otro modo a un personaje usando únicamente tu cuerpo.',
    3,
    3,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Camaradería',
    'Cuando gastes 1 punto de héroe para ayudar a un aliado, este gana 4 dados en lugar de 3.',
    3,
    2,
    'Montaignés',
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Donde pongo el ojo',
    'Consigues 1 dado adicional cuando realizas un Riesgo de Apuntar usando una pistola, un trabuco o un arma arrojadiza como un cuchillo o un hacha.',
    3,
    3,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Enfoque dinámico',
    'Gasta 1 punto de héroe para cambiar tu Enfoque durante una secuencia de acción o una secuencia dramática.',
    3,
    3,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Esgrimista',
    'Consigues 1 dado adicional cuando realizas un Riesgo de Armas usando un florete, una daga, un alfanje u otra arma similar.',
    3,
    3,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Francotirador',
    'Ganas 1 dado adicional cuando realices un Riesgo de Apuntar usando un mosquete de cañón largo, un arco largo o una ballesta.',
    3,
    3,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Gorila',
    'Ganas 1 dado adicional cuando realices un Riesgo de Armas usando un claymore, zweihander, hacha de batalla, alabarda o cualquier otra arma similar de dos manos.',
    3,
    3,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Hurto',
    'Gasta 1 punto de héroe para hurtar algo de un bolsillo, robar un anillo que otro personaje lleva puesto o colocar un pequeño objeto en la mano de otro personaje sin que se dé cuenta.',
    3,
    3,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Jack mal tiempo',
    'Tu héroe consigue una segunda historia; créala del mismo modo que el resto de historias de héroe y su progreso y recompensas se determinan de manera independiente. Puede escribir otra nueva cuando esta historia se complete.',
    3,
    3,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Maestro artesano',
    'Elige un tipo de objeto (armas, armaduras, pinturas, etcétera). Cuando creas un objeto de este tipo, puedes aumentar el tiempo de creación para hacer un objeto de mayor calidad. Si usas materiales típicos y normales, esto no tiene ningún efecto adicional, aparte del cosmético: se nota que el objeto es mejor que los objetos similares e incluso puede llevar tu marca, con lo que consigues notoriedad por un buen trabajo, obtienes un mayor precio si lo vendes, etcétera. Pero si usas materiales exóticos (como forjar una espada usando metal de una estrella caída, por ejemplo), puedes crear un Objeto distintivo para ti o para otro héroe. El tiempo necesario para crear un Objeto distintivo, y si un material es o no lo suficientemente «especial» para reunir las condiciones, siempre queda a discreción del DJ.',
    3,
    2,
    'Vestenio',
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Mecenas',
    'Tienes un mecenas, ya sea un individuo o una organización, que aprecia tu trabajo y te proporciona un trabajo fijo. Empiezas cada sesión con Riqueza 1. Puedes gastar 1 punto de héroe para pedirle un favor a tu mecenas. Este favor suele ser político o mercantil de algún modo: tu mecenas podría darte una carta de presentación, mover hilos para colarte en una fiesta exclusiva, etcétera. Tu mecenas te puede pedir favores o tener otras expectativas para ti, como que produzcas bienes o arte en su beneficio si eres un artista o que ayudes al populacho en su nombre si eres un caballero.',
    3,
    3,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Miembro de la orden',
    'Puedes esperar refugio, un lugar donde quedarte y comida caliente en cualquier iglesia. También tienes acceso a muchas de las bibliotecas de la Iglesia, pero no a todas. Finalmente, también consigues 2 dados para cualquier Riesgo social contra personajes que sean adeptos de tu fe.',
    3,
    2,
    'Castellano',
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Numerario',
    'Puedes esperar refugio, un lugar donde quedarte y comida caliente en cualquier universidad. También tienes acceso a muchas de las bibliotecas de la universidad simplemente con pedirlo. Finalmente, también consigues 2 dados para cualquier Riesgo social contra personajes que sean miembros de una institución de enseñanza superior o que respete tal nivel de educación.',
    3,
    3,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Objeto distintivo',
    'Elige un objeto específico que sea importante para ti. Descríbelo, decide por qué es importante y puedes incluso darle un nombre. Siempre puedes gastar 1 punto de héroe para: 1) Hacer que tu Objeto distintivo aparezca en la siguiente escena si lo has perdido o te lo han robado. 2) Conseguir 2 dados adicionales en un Riesgo cuando uses tu Objeto distintivo. 3) Si usas tu Objeto distintivo para atacar a un enemigo puedes infligirle tantas Heridas como Aumentos gastes más tu mayor característica. 4) Evitar tantas Heridas como Aumentos gastes, más tu mayor característica, cuando uses el Objeto distintivo. Siempre debes describir cómo te ayuda tu Objeto distintivo y tiene que tener sentido que el objeto te dé bonificaciones de este modo, a discreción del DJ.',
    3,
    3,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Oportunista',
    'Cuando otro héroe gaste un Aumento para crear una Oportunidad puedes gastar 1 punto de héroe para activarla inmediatamente para ti.',
    3,
    3,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Pelea de bar',
    'Ganas 1 dado adicional cuando realices un Riesgo con Pelear para luchar usando una mesa al revés, un taburete, un tablón de madera o cualquier otra arma improvisada.',
    3,
    3,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Reflejos rápidos',
    'Elige una habilidad. Siempre realizas las acciones como si tuvieras un Aumento adicional para gastar cuando uses esa habilidad. Por ejemplo, si un héroe tiene Reflejos Rápidos con Armas y saca 3 Aumentos, realiza su primera acción a los 4 Aumentos. Si gasta 1 Aumento para realizar una acción (y le quedan 2 Aumentos), su siguiente acción se realiza a los 3 Aumentos. Un héroe puede adquirir esta ventaja más de una vez; elige una habilidad diferente cada vez.',
    3,
    3,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Rico',
    'Empiezas cada sesión con Riqueza 3.',
    3,
    3,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Un inocente malentendido',
    'Gasta 1 punto de héroe para corregir, eliminar o cambiar algo que tú u otro héroe acabáis de decir y «reinterpretar» las palabras en un cumplido amable.',
    3,
    3,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Virtuoso',
    'Elige un tipo de interpretación específica, como cantar, tocar un instrumento concreto o bailar. Consigues 1 dado adicional cuando realizas un Riesgo de Interpretar usando dicho arte.',
    3,
    3,
    null,
    0,
    0
	);
    
    
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Academia',
    'Estudiaste estrategia, equitación y cómo ser un soldado en una de las muchas academias militares de Théah. Cuando realices un Riesgo usando Atletismo, Tácticas de Guerra o Equitación, todos tus dados consiguen un +1 a su valor.',
    4,
    4,
    null,
    0,
    1
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Alquimista',
    'Sólo castellanos.Gasta 1 punto de héroe para fabricar un elixir o una poción que proporcione un efecto inmediato. Usar el brebaje alquímico requiere 1 Aumento durante una secuencia de acción o una secuencia dramática. Aquí tienes algunos ejemplos de usos de brebajes alquímicos, pero puede haber otros. Si quieres crear el tuyo propio, consúltalo con tu DJ. Explosión: El preparado provoca una explosión de humo asfixiante y fuego, lo que crea una Oportunidad que tú y otros podéis usar para huir de la escena. Mejora: Ganas 1 nivel en 1 característica durante 1 ronda. Aceite resbaladizo: Cualquier cosa que se cubra con este preparado se vuelve muy escurridiza y casi imposible de sostener. Si se vierte sobre el suelo, cualquiera que camine o corra sobre la superficie se resbalará y caerá. Si se vierte sobre un muro, cualquiera que intente escalarlo también se resbalará y caerá.',
    4,
    4,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Camorrista',
    'Estás acostumbrado a que tus oponentes vengan en bandadas. Resta tu Brío a las Heridas recibidas cuando te enfrentes a una banda de matones; el resultado son las Heridas que recibes, hasta un mínimo de 1.',
    4,
    4,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Característica legendaria',
    'Elige una característica. Cuando hagas una tirada en un Riesgo usando esa característica, aparta un dado de tu reserva antes de tirar. Ese dado siempre se considera como un 10. Si tus 10 explotan, tu dado por la Característica legendaria también explota.',
    4,
    4,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Compañero de confianza',
    'Tienes un pequeño grupo de individuos que te son fieles o un único aliado de confianza que caminaría sobre fuego por ti (un guardaespaldas, un caballo, etcétera). Si tus aliados te ayudan directamente en un Riesgo, consigues 1 dado adicional si describes específicamente cómo te ayudan. Si les envías a cumplir alguna misión y necesitan realizar un Riesgo (a discreción del DJ), tiran 5 dados. Estos compañeros pueden recibir 5 Heridas antes de quedar Indefensos y es más que probable que requieran tu ayuda para que los rescates.',
    4,
    4,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Duro de matar',
    'Ya no te quedas Indefenso cuando tienes 4 Heridas Dramáticas. En cambio, cuando eso suceda, cualquier villano que realice un Riesgo contra ti consigue 3 dados adicionales (en lugar de 2). Además, consigues una hilera adicional de Heridas. Cuando recibas tu quinta Herida Dramática, te quedas Indefenso.',
    4,
    4,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Especialista',
    'Cuando adquieras esta ventaja, elige una habilidad en la que tengas al menos nivel 3 para que se convierta en tu habilidad de especialista. Cuando realices un Riesgo usando cualquier otra habilidad durante una secuencia de acción o dramática, no tienes que pagar Aumentos adicionales para Improvisar con tu habilidad de especialista. Un héroe solo puede tener una única habilidad de especialista; adquirir esta ventaja de nuevo te permite elegir una nueva habilidad, pero pierdes la anterior.',
    4,
    4,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Liceo',
    'Estudiaste retórica y debate y refinaste tus dotes sociales en uno de los muchos liceos de Théah o escuelas de señoritas normalmente reservados para la élite social y noble. Cuando realices un Riesgo usando Convencer, Intimidar o Tentar, todos tus dados suman un +1 a su valor.',
    4,
    4,
    null,
    0,
    1
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Seidr',
    'Sólo vestenios. Has estudiado con un skald vestenio. Has aprendido cómo ver los Nombres de las cosas, cómo conocer el futuro según el baile de las llamas de una hoguera y cómo guiar las pasiones de la gente, ya sea para alabar a tus héroes o ridiculizar a tus enemigos. Gasta 1 punto de héroe y pronuncia un discurso sobre otro personaje, que gana 1 nivel de Reputación (como la ventaja del mismo nombre) de tu elección, aumenta una Reputación existente en 1 nivel o cambia su Reputación a otra diferente a tu elección (pero el nivel sigue siendo el mismo). Si cambias la Reputación existente de un personaje, cualquiera que use la nueva Reputación contra él consigue tantos dados adicionales como el nivel de esa Reputación. Gasta 1 punto de héroe para lanzar runas, dados o huesos. Cuando lo hagas, hazle al DJ una pregunta sencilla sobre el futuro. El DJ debe responder con honestidad, pero solo tiene que decir sí o no. Si el evento en cuestión puede cambiar debido a las acciones de otros, como si una persona morirá o no, entonces la respuesta dada representa el resultado que actualmente es más probable, pero por lo demás este poder nunca se equivoca. Gasta 1 punto de héroe cuando mires a otro humano mortal para saber el nombre de esa persona. Ningún disfraz puede esconder el nombre ante ti ni tampoco creerás ninguna mentira diseñada para ocultar el nombre. Siempre reconocerás a esa persona durante el resto de la escena, no importa lo que ella haga por cambiar.',
    4,
    4,
    null,
    0,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Toque milagroso',
    'Quizás fue por estudiar con la Iglesia o con un chamán local, pero conoces las heridas y sabes cómo curarlas. Gasta 1 punto de héroe y 1 Aumento durante tu acción para curar a otro héroe, que recuperará 1 Herida Dramática. Debes poder tocar al héroe que vayas a curar.',
    4,
    4,
    null,
    1,
    0
	);
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Universidad',
    'Fuiste a una de las universidades regladas de Théah y estás familiarizado con muchos campos académicos de estudio como las matemáticas, la arquitectura y la astronomía. Cuando realices un Riesgo usando Conocimiento, Empatía o Percepción, todos tus dados ganan un +1 a su valor.',
    4,
    4,
    null,
    0,
    1
	);
    
    
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Academia de esgrima',
    'Puedes elegir un estilo de Esgrima. Si adquieres esta ventaja otra vez, consigues un estilo de Esgrima adicional. Ver el capítulo «Duelos» (página 234) para más información.',
    5,
    5,
    null,
    0,
    0
	);    
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Chispa de genialidad',
    'Elige un campo específico de estudio académico (astronomía, matemáticas, arquitectura, historia, etcétera). Cuando hagas un Riesgo y recurras a tu campo de estudio especializado, gasta 1 punto de héroe para conseguir tantos Aumentos adicionales como tu Ingenio.',
    5,
    3,
    'Castellano',
    1,
    0
	);    
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'La fuerza de diez',
    'Cuando lleves a cabo una proeza de fuerza bruta (levantar el rastrillo de un castillo, mantener una puerta cerrada contra un ariete que empuja al otro lado, etcétera), gasta 1 punto de héroe para aumentar, en ese Riesgo, todos los valores de tus dados tanto como tu Músculo o Brío, lo que sea mayor. Por ejemplo, si estás intentando evitar que una pared en ruinas colapse para que tus amigos puedan escapar, gasta 1 punto de héroe para sumarle tu Músculo al número de cada uno de tus dados.',
    5,
    3,
    'Ussuro',
    1,
    0
	);    
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Joie de vivre',
    'Justo antes de que tenga lugar una confrontación con un villano, gasta 1 punto de héroe y haz algún tipo de comentario breve o inteligente como: «El alma brilla más cuando las cosas parecen más oscuras». Todos los héroes que lo escuchen cuentan como 10 todos los dados que tiren en su siguiente tirada y tengan un valor igual o inferior a su habilidad.',
    5,
    3,
    'Montaignés',
    1,
    0
	);    
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Juntos somos más fuertes',
    'Gasta 1 punto de héroe para darle cualquiera de tus Aumentos a otro héroe que se encuentre en la misma escena, siempre y cuando te pueda ver o escuchar. Puedes darle todos los Aumentos que desees.',
    5,
    3,
    'Sármata',
    1,
    0
	);    
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'No somos tan diferentes...',
    'Gasta 1 punto de héroe para convencer a un villano de que estás de su lado, considerándote así un aliado de confianza. La ilusión se acaba en cuanto el villano te vea realizar una acción heroica o te niegues a realizar una acción de villanía. Solo puedes usar esta ventaja en cada villano una vez. «Si me engañas una vez…».',
    5,
    3,
    'Vodaccio',
    1,
    0
	);    
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'No voy a morir aquí',
    'Gasta 1 punto de héroe para ignorar todos los efectos negativos de Heridas Dramáticas durante la ronda: el villano no consigue dados adicionales si tienes 2 Heridas Dramáticas y tú no te quedas Indefenso con 4 Heridas Dramáticas.',
    5,
    3,
    'Eiseno',
    1,
    0
	);    
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'La suerte del diablo',
    'Gasta 1 punto de héroe después de realizar un Riesgo para volver a tirar tantos dados como quieras. Debes quedarte con la nueva tirada, a menos que tengas otro efecto que te permita volver a tirar los dados. Solo puedes utilizar esta ventaja una vez por escena.',
    5,
    3,
    'Islas Glamour',
    1,
    0
	);    
insert into ventaja (nombre, descripcion, coste, costeReducido, reducidoRestriccion, pericia, innata) values(
	'Tú te vienes conmigo',
    'Gasta 1 punto de héroe para hacer que todo el daño que inflijas esta ronda aumente tanto como Heridas Dramáticas tengas.',
    5,
    3,
    'Vestenio',
    1,
    0
	);

/* USUARIO ADMINISTRADOR */
insert into usuario (nick, email, pass) values('admin','septimomar@ksei.es', '$2y$12$98c6Z/1nrD6tkKjUOJDz2e3CM2BYs08Q/CywDa82SgVf1L2zy.qou');