-- =====================================================
-- Script de creacion y carga de datos (MariaDB)
-- Escenario: plataforma de torneos de eSports
-- =====================================================

DROP TABLE IF EXISTS participacion;
DROP TABLE IF EXISTS partida;
DROP TABLE IF EXISTS torneo;
DROP TABLE IF EXISTS jugador;
DROP TABLE IF EXISTS equipo;

CREATE TABLE equipo (
  id_equipo   INT PRIMARY KEY AUTO_INCREMENT,
  nombre      VARCHAR(60) NOT NULL,
  pais        VARCHAR(40)
) ENGINE=InnoDB;

CREATE TABLE jugador (
  id_jugador  INT PRIMARY KEY AUTO_INCREMENT,
  apodo       VARCHAR(40) NOT NULL,
  fecha_alta  DATE NOT NULL,
  id_equipo   INT,
  FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo)
) ENGINE=InnoDB;

CREATE TABLE torneo (
  id_torneo   INT PRIMARY KEY AUTO_INCREMENT,
  nombre      VARCHAR(60) NOT NULL,
  juego       VARCHAR(40) NOT NULL,
  fecha_inicio DATE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE partida (
  id_partida  INT PRIMARY KEY AUTO_INCREMENT,
  id_torneo   INT NOT NULL,
  fecha       DATE NOT NULL,
  id_equipo_ganador INT,
  FOREIGN KEY (id_torneo) REFERENCES torneo(id_torneo),
  FOREIGN KEY (id_equipo_ganador) REFERENCES equipo(id_equipo)
) ENGINE=InnoDB;

CREATE TABLE participacion (
  id_partida  INT NOT NULL,
  id_jugador  INT NOT NULL,
  puntuacion  INT NOT NULL DEFAULT 0,
  PRIMARY KEY (id_partida, id_jugador),
  FOREIGN KEY (id_partida) REFERENCES partida(id_partida),
  FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador)
) ENGINE=InnoDB;

-- Equipos
INSERT INTO equipo (nombre, pais) VALUES
('Dragones Rojos', 'España'), ('Lobos de Medianoche', 'España'), ('Fenix Gaming', 'Francia'), ('Titanes del Norte', 'Alemania'), ('Sombra Tactica', 'Italia'), ('Cometa Azul', 'Portugal'), ('Vikingos FC', 'Suecia'), ('Estrella Polar', 'Reino Unido');

-- Jugadores
INSERT INTO jugador (apodo, fecha_alta, id_equipo) VALUES
  ('NeonBlade', '2025-05-05', 1),
  ('SilentArrow', '2024-06-04', 1),
  ('ViperX', '2024-07-04', 1),
  ('WinterFall', '2025-06-20', 1),
  ('NovaStrike', '2025-01-24', 2),
  ('SteelFang', '2025-09-04', 2),
  ('RustyBlade', '2025-02-18', 2),
  ('CobraStrike', '2025-11-20', 2),
  ('VoidWalker', '2025-10-07', 3),
  ('TitanClaw', '2026-02-02', 3),
  ('PhantomLynx', '2026-04-25', 3),
  ('FrostByte', '2025-02-28', 3),
  ('RapidFire', '2024-02-13', 4),
  ('EmberSoul', '2025-08-21', 4),
  ('GhostPanda', '2025-03-12', 4),
  ('MysticOwl', '2025-04-22', 4),
  ('EchoDrift', '2025-12-22', 5),
  ('SilverHowl', '2026-02-20', 5),
  ('StormBreaker', '2026-03-18', 5),
  ('RogueSpark', '2026-04-06', 5),
  ('ShadowFox', '2025-07-09', 6),
  ('CopperWasp', '2026-09-08', 6),
  ('CrimsonEdge', '2026-06-27', 6),
  ('DarkRaven', '2024-04-27', 6),
  ('BlazeRunner', '2024-06-13', 7),
  ('GlacialRex', '2025-02-07', 7),
  ('ZenithFox', '2026-06-07', 7),
  ('BlitzKrieg', '2026-08-13', 7),
  ('IronWolf', '2026-08-05', 8),
  ('AshenKnight', '2025-03-08', 8),
  ('PixelKnight', '2026-09-18', 8),
  ('LunarWave', '2025-12-19', 8),
  ('ThunderPaw', '2025-10-13', NULL),
  ('SolarFlare', '2025-04-05', NULL),
  ('NightHawk', '2026-08-03', NULL),
  ('QuietStorm', '2024-02-05', NULL);

-- Torneos
INSERT INTO torneo (nombre, juego, fecha_inicio) VALUES
  ('Copa Primavera', 'League of Legends', '2025-03-10'),
  ('Liga de Verano', 'League of Legends', '2025-06-15'),
  ('Torneo Otono', 'Valorant', '2025-10-05'),
  ('Copa Invierno', 'Rocket League', '2026-01-20');

-- Partidas
INSERT INTO partida (id_torneo, fecha, id_equipo_ganador) VALUES
  (2, '2025-06-28', 2), (4, '2026-01-28', 8), (3, '2025-10-22', 1), (1, '2025-03-27', 5), (3, '2025-10-08', 5),
  (4, '2026-01-25', 8), (1, '2025-03-18', 3), (1, '2025-03-28', 5), (2, '2025-06-19', 6), (2, '2025-06-28', 1),
  (3, '2025-10-20', 1), (1, '2025-03-21', 5), (2, '2025-06-16', 4), (1, '2025-03-12', 8), (1, '2025-03-27', 3),
  (2, '2025-06-28', 3), (3, '2025-10-21', 7), (2, '2025-06-28', 4), (3, '2025-10-17', 6), (4, '2026-01-28', 8),
  (1, '2025-03-17', 4), (1, '2025-03-20', 1), (2, '2025-06-28', 4), (1, '2025-03-12', 1), (2, '2025-06-17', 1),
  (3, '2025-10-07', 4), (3, '2025-10-20', 4), (2, '2025-06-28', 8), (2, '2025-06-28', 7), (2, '2025-06-18', 2),
  (4, '2026-01-28', 7), (4, '2026-01-28', 1), (1, '2025-03-11', 7), (3, '2025-10-08', 4), (2, '2025-06-21', 8),
  (2, '2025-06-28', 3), (3, '2025-10-19', 4), (1, '2025-03-24', 2), (1, '2025-03-28', 1), (1, '2025-03-17', 3),
  (4, '2026-01-28', 8), (2, '2025-06-27', 1), (2, '2025-06-27', 1), (4, '2026-01-28', 8), (3, '2025-10-18', 8),
  (2, '2025-06-21', 5), (2, '2025-06-16', 1), (3, '2025-10-06', 1), (4, '2026-01-28', 3), (1, '2025-03-26', 2),
  (2, '2025-06-17', 2), (2, '2025-06-27', 2), (2, '2025-06-28', 1), (1, '2025-03-23', 6), (3, '2025-10-11', 6),
  (2, '2025-06-23', 7), (2, '2025-06-28', 5), (4, '2026-01-28', 2), (1, '2025-03-24', 2), (1, '2025-03-27', 4),
  (3, '2025-10-09', 6), (1, '2025-03-17', 6), (3, '2025-10-10', 8), (3, '2025-10-24', 1), (3, '2025-10-08', 3);

-- Participaciones
INSERT INTO participacion (id_partida, id_jugador, puntuacion) VALUES
  (1, 15, 43), (1, 5, 18), (1, 14, 50), (1, 7, 26), (2, 32, 7), (2, 6, 5), (2, 8, 26), (2, 29, 54), (2, 30, 13),
  (3, 2, 49), (3, 3, 14), (3, 4, 39), (3, 25, 7), (3, 27, 58), (3, 28, 28), (4, 17, 55), (4, 20, 60), (4, 22, 7),
  (4, 23, 27), (5, 5, 56), (5, 6, 56), (5, 7, 16), (5, 17, 31), (5, 18, 6), (6, 32, 29), (6, 5, 60), (6, 6, 7),
  (6, 7, 59), (6, 29, 35), (6, 31, 19), (7, 5, 17), (7, 7, 30), (7, 9, 26), (7, 10, 22), (7, 11, 60), (8, 1, 16),
  (8, 2, 42), (8, 4, 21), (8, 18, 7), (8, 19, 11), (8, 20, 43), (9, 13, 50), (9, 14, 32), (9, 16, 5), (9, 21, 38),
  (9, 22, 56), (9, 23, 39), (10, 27, 25), (10, 2, 47), (10, 3, 59), (10, 28, 12), (11, 2, 40), (11, 3, 13),
  (11, 4, 17), (11, 26, 31), (11, 27, 47), (11, 28, 29), (12, 27, 18), (12, 26, 32), (12, 18, 55), (12, 19, 42),
  (13, 14, 15), (13, 15, 47), (13, 16, 10), (13, 23, 23), (13, 24, 37), (14, 32, 6), (14, 21, 7), (14, 22, 20),
  (14, 29, 35), (14, 30, 44), (15, 32, 30), (15, 10, 20), (15, 12, 14), (15, 30, 46), (16, 27, 38), (16, 9, 34),
  (16, 10, 8), (16, 26, 40), (17, 6, 58), (17, 7, 40), (17, 8, 33), (17, 25, 15), (17, 28, 52), (18, 32, 22),
  (18, 13, 33), (18, 14, 9), (18, 16, 50), (18, 29, 23), (18, 31, 20), (19, 9, 29), (19, 10, 49), (19, 21, 14),
  (19, 23, 50), (19, 24, 18), (20, 32, 29), (20, 1, 54), (20, 2, 42), (20, 4, 49), (20, 30, 6), (20, 31, 59),
  (21, 32, 36), (21, 13, 19), (21, 14, 22), (21, 16, 32), (21, 29, 36), (21, 30, 6), (22, 1, 30), (22, 3, 42),
  (22, 4, 41), (22, 17, 47), (22, 18, 6), (22, 19, 10), (23, 13, 25), (23, 14, 18), (23, 16, 34), (23, 26, 25),
  (23, 27, 26), (24, 32, 52), (24, 2, 39), (24, 3, 8), (24, 4, 27), (24, 29, 19), (25, 1, 44), (25, 26, 14),
  (25, 4, 20), (25, 25, 13), (26, 14, 54), (26, 16, 57), (26, 17, 15), (26, 19, 24), (26, 20, 11), (27, 15, 9),
  (27, 16, 42), (27, 21, 49), (27, 23, 58), (27, 24, 45), (28, 32, 39), (28, 5, 32), (28, 6, 47), (28, 31, 28),
  (29, 2, 45), (29, 4, 58), (29, 25, 34), (29, 26, 50), (29, 27, 14), (30, 7, 25), (30, 8, 59), (30, 18, 20),
  (30, 19, 58), (30, 20, 10), (31, 9, 16), (31, 10, 36), (31, 11, 18), (31, 26, 27), (31, 27, 56), (31, 28, 21),
  (32, 1, 51), (32, 3, 31), (32, 4, 36), (32, 13, 40), (32, 16, 53), (33, 5, 30), (33, 7, 49), (33, 25, 20),
  (33, 26, 24), (33, 28, 47), (34, 14, 22), (34, 15, 24), (34, 16, 21), (34, 22, 19), (34, 23, 12), (34, 24, 51),
  (35, 32, 35), (35, 6, 22), (35, 7, 51), (35, 29, 42), (35, 31, 53), (36, 9, 24), (36, 10, 5), (36, 12, 50),
  (36, 21, 39), (36, 23, 13), (37, 10, 11), (37, 11, 60), (37, 12, 5), (37, 13, 41), (37, 15, 23), (38, 5, 12),
  (38, 6, 57), (38, 8, 9), (38, 18, 30), (38, 19, 36), (39, 1, 40), (39, 2, 53), (39, 5, 31), (39, 7, 43),
  (39, 8, 43), (40, 32, 24), (40, 10, 41), (40, 12, 44), (40, 30, 8), (40, 31, 44), (41, 24, 10), (41, 23, 15),
  (41, 30, 20), (41, 31, 16), (42, 1, 23), (42, 2, 7), (42, 22, 19), (42, 23, 23), (42, 24, 50), (43, 1, 39),
  (43, 3, 19), (43, 4, 46), (43, 13, 14), (43, 14, 22), (43, 16, 57), (44, 32, 34), (44, 5, 49), (44, 6, 24),
  (44, 7, 49), (44, 29, 30), (45, 32, 6), (45, 10, 10), (45, 11, 19), (45, 12, 48), (45, 29, 58), (45, 31, 60),
  (46, 24, 38), (46, 19, 46), (46, 20, 33), (46, 22, 22), (47, 1, 47), (47, 2, 11), (47, 4, 59), (47, 10, 15),
  (47, 11, 26), (47, 12, 31), (48, 2, 25), (48, 3, 21), (48, 4, 25), (48, 25, 12), (48, 28, 54), (49, 19, 28),
  (49, 10, 44), (49, 18, 53), (49, 12, 36), (50, 5, 49), (50, 6, 36), (50, 8, 12), (50, 26, 6), (50, 27, 45),
  (51, 8, 19), (51, 24, 58), (51, 21, 12), (51, 6, 34), (52, 2, 35), (52, 3, 20), (52, 4, 34), (52, 7, 40),
  (52, 8, 14), (53, 1, 57), (53, 2, 5), (53, 18, 23), (53, 19, 51), (53, 20, 24), (54, 32, 34), (54, 22, 25),
  (54, 23, 60), (54, 24, 17), (54, 30, 49), (54, 31, 20), (55, 18, 29), (55, 19, 47), (55, 20, 55), (55, 21, 57),
  (55, 22, 46), (55, 24, 14), (56, 13, 38), (56, 14, 34), (56, 16, 5), (56, 26, 51), (56, 27, 14), (57, 14, 46),
  (57, 15, 10), (57, 16, 59), (57, 17, 26), (57, 18, 59), (58, 6, 45), (58, 7, 48), (58, 8, 23), (58, 25, 19),
  (58, 28, 52), (59, 2, 6), (59, 3, 7), (59, 4, 25), (59, 5, 55), (59, 7, 8), (59, 8, 23), (60, 9, 10),
  (60, 10, 44), (60, 11, 60), (60, 13, 29), (60, 15, 44), (60, 16, 48), (61, 5, 56), (61, 6, 34), (61, 8, 23),
  (61, 21, 48), (61, 22, 39), (61, 24, 15), (62, 2, 17), (62, 3, 29), (62, 4, 59), (62, 22, 35), (62, 23, 11),
  (62, 24, 20), (63, 32, 5), (63, 14, 41), (63, 16, 60), (63, 30, 48), (63, 31, 54), (64, 25, 45), (64, 2, 17),
  (64, 27, 44), (64, 4, 21), (65, 27, 7), (65, 9, 42), (65, 26, 28), (65, 11, 51);



-- 1 
select apodo fecha_alta
from jugador
order by fecha_alta desc;

-- 2

select pais
from equipo
where pais = 'España';


-- 3

select count (*) id_jugador
from jugador;


-- 4

select nombre from torneo
where juego like '%League%'
order by fecha_inicio


-- 5
select AVG(p.puntuacion)
from participacion p 

-- 6
select apodo 
from jugador
where id_equipo is null ;


-- Hito 2 No me he acordado de usar los union y me ha tocado investigalro

-- Para cada equipo, nombre del equipo y número de partidas ganadas. 
	select e.nombre as nombre_equipo,
	count (p.id_equipo_ganador ) as partidas_ganadas
	from equipo e
	left join 
	partida p on e.id_equipo = p.id_equipo_ganador 
	group by p.id_equipo_ganador ;


-- Apodo del jugador con mayor puntuación total acumulada. 

select j.apodo from jugador j 
join participacion p on j.id_jugador = p.id_jugador
group by j.id_jugador, j.apodo 
order by sum(p.puntacion) desc
limit 1;

--  he tenido que mirar como se calculaba con los grupos usando el having, no me acordaba.


select e.nombre from equipo e
join partida p on e.id_equipo = p.id_equipo_ganador 
group by e.nombre 
having count (p.id_equipo_ganador >3);


-- He tenido que repasar y mirar los joins,  no lo sacabe

select  apodo from jugador j 
join participacion p on j.id_jugador = p.id_jugador 
join partida pa on      p.id_partida         = pa.id_partida 
join torneo t on  pa.id_torneo  = t.id_torneo 
where juego = 'League of Legends';
										
                                        