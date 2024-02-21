create database GRTransportista
use GRTransportista

--TABLA AUXILIAR
create table Auxiliar(
COD_AUX char(8) not null,
NOM_AUX varchar(25),
APE_AUX varchar(25),
DNI_AUX int,
TEL_AUX int,
primary key (COD_AUX asc));

--TABLA PROVINCIA
create table provincia(
COD_PROV char(8),
NOMBRE varchar(15),
primary key (COD_PROV asc));

--TABLA CATEGORIA_LICENCIA
create table categoria_licencia(
CATG_LIC varchar(15),
CATEGORIA varchar(10),
primary key (CATG_LIC asc));

--TABLA DESCRIPCION
create table descripcion(
NUM_DES int,
DES_TRA varchar(15),
primary key (NUM_DES asc));

--TABLA CONDUTOR
create table conductor(
COD_COND char(8),
NOM_COND varchar(15),
APE_COND varchar(15),
DNI_COND int,
TEL_COND int,
LIC_COND varchar(15),
CATG_LIC varchar(15),
primary key (COD_COND asc),
foreign key(CATG_LIC) references categoria_licencia(CATG_LIC)
on delete cascade on update cascade);

--TABLA VEHICULO
create table vehiculo(
COD_VEH char(8),
PLA_VEH varchar(9),
MAR_VEH varchar(9),
NUM_INS char(15),
COD_COND char(8),
primary key (COD_VEH asc),
foreign key (COD_COND) references conductor(COD_COND)
on delete cascade on update cascade);

--TABLA DISTRITO
create table distrito(
COD_DIS char(8),
NOMBRE varchar(30),
COD_PROV char(8),
DEPARTAMENTO varchar(15),
primary key (COD_DIS asc),
foreign key (COD_PROV) references provincia(COD_PROV)
on delete cascade on update cascade);

--TABLA CLIENTE
create table cliente(
COD_CLI char(8),
RUC_CLI varchar(15),
NOM_CLI varchar(25),
DIR_CLI varchar(60),
COD_DIS char(8),
primary key (COD_CLI asc),
foreign key (COD_DIS) references distrito(COD_DIS)
on delete cascade on update cascade);

--TABLE GUIA_REMISION
create table guia_remision(
NUM_GR int,
FEC_TRA date,
COD_CLI char(8),
COD_VEH char(8),
COD_COND char(8),
COD_AUX char(8),
primary key (NUM_GR asc),
foreign key (COD_CLI) references cliente(COD_CLI)
on delete cascade on update cascade,
foreign key (COD_VEH) references vehiculo(COD_VEH)
on delete no action on update no action,
foreign key (COD_COND) references conductor(COD_COND)
on delete no action on update no action,
foreign key (COD_AUX) references auxiliar(COD_AUX)
on delete no action on update no action);

--TABLA DETALLE_GuiRemision
create table detalle_GuiaRemision(
NUM_DES int,
NUM_GR int,
DES_TRA varchar(15),
KG_TRA int,
primary key (NUM_DES asc ,NUM_GR asc),
foreign key (NUM_DES) references descripcion(NUM_DES) 
on delete cascade on update cascade,
foreign key (NUM_GR) references guia_remision(NUM_GR) 
on delete cascade on update cascade);


insert into Auxiliar values
('AUX000',	'SIN AUXILIAR', 'XXXXXX' , 000000000,	000000000),
('AUX001',	'Fermin Abreu', 'FLORES QUISPE', 794574051,	973778161),
('AUX002',	'Antonio', 'SANCHEZ RODRIGUEZ', 420739213,	976663248),
('AUX003',	'Javier', 'GARCIA ROJAS',	206911055,	985050290),
('AUX004',	'Dario', 'RAMOS MENDOZA', 978782119,	925649433),
('AUX005',	'Joel Martin', 'GUTIERREZ HUAMAN', 397333855,969317995);

insert into provincia values
('PRV001','LIMA'),
('PRV002','CALLAO'),
('PRV003','CAÑETE');

insert into categoria_licencia values
('LIC001','A1'),
('LIC002','A2A'),
('LIC003','A2b'),
('LIC004','A3B'),
('LIC005','A3a'),
('LIC006','A3b');

insert into descripcion values
(1,		'B687-714001'),
(2,		'B687-714002'),
(3,		'B687-714003'),
(4,		'B687-714004'),
(5,		'B687-714005'),
(6,		'F001-924781'),
(7,		'F001-924782'),
(8,		'F001-924783'),
(9,		'F001-924784'),
(10,	'F001-924785'),
(11,	'B01-714006'),
(12,	'B01-714007'),
(13,	'B01-714008'),
(14,	'B01-714009'),
(15,	'B01-714010'),
(16,	'F-924786'),
(17,	'F-924787'),
(18,	'F-924788'),
(19,	'F-924789'),
(20,	'F-924790'),
(21,	'B-3425666'),
(22,	'B-3425667'),
(23,	'B-3425668'),
(24,	'B-3425669'),
(25,	'B-342567'),
(26,	'F-245678'),
(27,	'F-245679'),
(28,	'F-245680'),
(29,	'F-245681'),
(30,	'F-245682'),
(31,	'F-245683'),
(32,	'F-30005'),
(33,	'F-71200'),
(34,	'F-35556'),
(35,	'F-12466'),
(36,	'F-34568'),
(37,	'F-45000');

select * from distrito
insert into conductor values
('COND01','LUCIO ROLDAN','REYES FLORES',368060877,982607816,'T01694466','LIC001'),
('COND02','BENITO','LEON CHAVEZ',519130575,	999102321,'Q70914622','LIC001'),
('COND03','OLIVER','SALAZAR PEREZ',	536648512,	920837599,'R70865241','LIC001'),
('COND04','ERIK','ROMERO MARTINEZ',	139801139,	953164347,'T66887031','LIC006'),
('COND05','ANTONIO MIGUEL','CASTRO ESPINOZA',695957264,995630499,'Q02583646','LIC006'),
('COND06','LUIS ANTONIO','TORRES DIAZ',253390461,937155576,'S44410709','LIC001'),
('COND07','ERNESTO','VARGAS MAMANI',581593613,983771659,'T08091817','LIC006'),
('COND08','JUAN ANGEL','ROJAS QUISPE',721370123,992035702,'Q63440504','LIC006'),
('COND09','JONATHAN FELIPE','FERNANDEZ DIAZ',621902759,	907592359,'S40432468','LIC002'),
('COND10','SAUL','FLORES REYES',340295526,901694466,'T61486164','LIC002');


insert into vehiculo values
('VEH001',	'AKK856',	'TOYOTA',	'151901110',	'COND01'),
('VEH002',	'BJJ876',	'HYUNDAI',  '161486164',	'COND02'),
('VEH003',	'AEN749',	'KIA',	    '108134534',	'COND03'),
('VEH004',	'CJU789',	'KIA',		'158742605',	'COND04'),
('VEH005',	'DOI846',	'KIA',		'149712052',	'COND05'),
('VEH006',	'C8V723',	'CHEVROLET','172865252',	'COND06'),
('VEH007',	'AZS817',	'NISSAN',	'150918276',	'COND07'),
('VEH008',	'BHT911',	'KIA',		'135222387',	'COND08'),
('VEH009',	'BHM855',	'KIA',		'125371311',	'COND09'),
('VEH010',	'BRO821',	'CHEVROLET','135072389',	'COND10');



insert into distrito values
('DIS001','ANCON','PRV001','LIMA'),
('DIS002','BREÑA','PRV001','LIMA'),
('DIS003','CARABAYLLO','PRV001','LIMA'),
('DIS004','COMAS','PRV001','LIMA'),
('DIS005','INDEPENDENCIA','PRV001','LIMA'),
('DIS006','JESUS MARIA','PRV001','LIMA'),
('DIS007','LA VICTORIA','PRV001','LIMA'),
('DIS008','LIMA','PRV001','LIMA'),
('DIS009','LINCE','PRV001','LIMA'),
('DIS010','LOS OLIVOS','PRV001','LIMA'),
('DIS011','MAGDALENA DEL MAR','PRV001','LIMA'),
('DIS012','MIRAFLORES','PRV001','LIMA'),
('DIS013','PUEBLO LIBRE','PRV001','LIMA'),
('DIS014','PUENTE PIEDRA','PRV001','LIMA'),
('DIS015','RIMAC','PRV001','LIMA'),
('DIS016','SAN BORJA','PRV001','LIMA'),
('DIS017','SAN ISIDRO','PRV001','LIMA'),
('DIS018','SAN LUIS','PRV001','LIMA'),
('DIS019','SAN MARTIN DE PORRES','PRV001','LIMA'),
('DIS020','SAN MIGUEL','PRV001','LIMA'),
('DIS021','SANTA ROSA','PRV001','LIMA'),
('DIS022','SURQUILLO','PRV001','LIMA'),
('DIS023','BARRANCO','PRV001','LIMA'),
('DIS024','CHORRILLOS','PRV001','LIMA'),
('DIS025','LURIN','PRV001','LIMA'),
('DIS026','PACHACAMAC','PRV001','LIMA'),
('DIS027','PUCUSANA','PRV001','LIMA'),
('DIS028','PUNTA HERMOSA','PRV001','LIMA'),
('DIS029','MALA','PRV003','LIMA'),
('DIS030','SAN BARTOLO','PRV001','LIMA'),
('DIS031','SAN JUAN DE MIRAFLORES','PRV001','LIMA'),
('DIS032','SANTIAGO DE SURCO','PRV001','LIMA'),
('DIS033','VILLA EL SALVADOR','PRV001','LIMA'),
('DIS034','VILLA MARIA DEL TRIUNFO','PRV001','LIMA'),
('DIS035','ATE','PRV001',	'LIMA'),
('DIS036','CHACLACAYO','PRV001','LIMA'),
('DIS037','CIENEGUILLA','PRV001','LIMA'),
('DIS038','EL AGUSTINO','PRV001','LIMA'),
('DIS039','LA MOLINA','PRV001','LIMA'),
('DIS040','SAN JUAN DE LURIGANCHO','PRV001','LIMA'),
('DIS041','SANTA ANITA','PRV001','LIMA'),
('DIS042','BELLAVISTA','PRV002','LIMA'),
('DIS043','CALLAO','PRV002','LIMA'),
('DIS044','CARMEN DE LA LEGUA REYNOSO','PRV002','LIMA'),
('DIS045','LA PERLA','PRV002','LIMA'),
('DIS046','LA PUNTA','PRV002','LIMA'),
('DIS047','VENTANILLA','PRV002','LIMA'),
('DIS048','ASIA','PRV003','LIMA'),
('DIS049','CALANGO','PRV003','LIMA'),
('DIS050','CERRO AZUL','PRV003','LIMA'),
('DIS051','CHILCA','PRV003','LIMA'),
('DIS052','MALA','PRV003','LIMA');


insert into cliente values
('CLI001',	'20537161729',	'SORAYA SAC',				'Car. Car. Panamericana Sur Km. 18.5 Mza. G Lote. 1b',	'DIS031'),
('CLI002',	'20506421781',	'CORPORACION RICO',			'Car. Panamericana Sur Mza. B Lote. 12 Z.I.',			'DIS033'),
('CLI003',	'20507963375',	'ZEDINA',					'Lote 1 Acumulado Lote 3 a Nro. S/n',					'DIS025'),
('CLI004',	'20500453827',	'PECUARIA EL CHANCHITO SAC','Av. Alipio Ponce Nro. 195',							'DIS024'),
('CLI005',	'20100070970',	'SUPERMERCADOS PERUANOS',	'Cal. Morelli Nro. 181 Int. P-2',						'DIS016'),
('CLI006',	'20136974697',	'SUSPENSA',					'Av Defensores del Morro (atrás Tottus Huaylas)',		'DIS024'),
('CLI007',	'20566014069',	'TIGO PERU SAC',			'Ovl. Pereyra Nro. 135 Cercado de Chosica',				'DIS040');


INSERT INTO guia_remision VALUES
(1000, '2022-05-25', 'CLI002', 'VEH003', 'COND01', 'AUX001'),
(1001, '2022-05-25', 'CLI002', 'VEH002', 'COND02', 'AUX002'),
(1002, '2022-05-25', 'CLI002', 'VEH001', 'COND03', 'AUX003'),
(1003, '2022-05-25', 'CLI001', 'VEH008', 'COND04', 'AUX000'),
(1004, '2022-05-25', 'CLI001', 'VEH009', 'COND05', 'AUX000'),
(1005, '2022-05-25', 'CLI001', 'VEH010', 'COND06', 'AUX000'),
(1006, '2022-05-25', 'CLI001', 'VEH005', 'COND07', 'AUX003'),
(1007, '2022-05-25', 'CLI003', 'VEH006', 'COND08', 'AUX000'),
(1008, '2022-05-25', 'CLI003', 'VEH007', 'COND09', 'AUX000'),
(1009, '2022-05-25', 'CLI003', 'VEH004', 'COND10', 'AUX005'),
(1010, '2022-05-26', 'CLI001', 'VEH010', 'COND05', 'AUX005'),
(1011, '2022-05-26', 'CLI001', 'VEH005', 'COND06', 'AUX003'),
(1012, '2022-05-26', 'CLI003', 'VEH006', 'COND07', 'AUX000'),
(1013, '2022-05-26', 'CLI003', 'VEH007', 'COND03', 'AUX000'),
(1014, '2022-05-26', 'CLI003', 'VEH004', 'COND04', 'AUX000'),
(1015, '2022-05-26', 'CLI002', 'VEH003', 'COND01', 'AUX001'),
(1016, '2022-05-26', 'CLI002', 'VEH002', 'COND02', 'AUX004'),
(1017, '2022-05-26', 'CLI002', 'VEH001', 'COND08', 'AUX002'),
(1018, '2022-05-26', 'CLI001', 'VEH008', 'COND09', 'AUX000'),
(1019, '2022-05-26', 'CLI001', 'VEH009', 'COND10', 'AUX000');


insert into detalle_guiaremision values
(1,		1000,	'B687-714001',	10),
(2,		1000,	'B687-714002',	150),
(3,		1000,	'B687-714003',	30),
(4,		1000,	'B687-714004',	250),
(5,		1000,	'B687-714005',	94),
(6,		1000,	'F001-924781',	1450),
(7,		1000,	'F001-924782',	10),
(8,		1000,	'F001-924783',	15),
(9,		1000,	'F001-924784',	20),
(10,	1000,	'F001-924785',	12),
(11,	1001,	'B01-714006',	300),
(12,	1001,	'B01-714007',	12),
(13,	1001,	'B01-714008',	35),
(14,	1001,	'B01-714009',	400),
(15,	1001,	'B01-714010',	100),
(16,	1001,	'F-924786',		120),
(17,	1001,	'F-924787',		15),
(18,	1001,	'F-924788',		500),
(19,	1001,	'F-924789',		30),
(20,	1001,	'F-924790',		30),
(21,	1002,	'B-3425666',	1600),
(22,	1002,	'B-3425667',	400),
(23,	1003,	'B-3425668',	3000),
(24,	1003,	'B-3425669',	1000),
(25,	1003,	'B-3425670',	50),
(26,	1004,	'F-245678',		50),
(27,	1004,	'F-245679',		150),
(28,	1004,	'F-245680',		75),
(29,	1004,	'F-245681',		34),
(30,	1004,	'F-245682',		1500),
(31,	1004,	'F-245683',		15),
(32,	1005,	'F-30005',		3400),
(33,	1006,	'F-71200',		2400),
(34,	1007,	'F-35556',		1560),
(35,	1008,	'F-12466',		2000),
(36,	1008,	'F-34568',		1500),
(37,	1009,	'F-45000',		3500);
delete from conductor where COD_COND='COND12'
SELECT * FROM guia_remision;
SELECT * FROM conductor;