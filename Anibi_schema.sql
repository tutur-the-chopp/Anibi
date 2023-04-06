drop database if exists anibi;
create database anibi;
use anibi;

create table visite(
	id int primary key,
    nbVisiteursAdultes int,
    nbVisiteursEnfants int,
    dateHeureArrivee datetime,
    dateHeureDepart datetime
) engine InnoDB DEFAULT CHARSET=utf8mb4;

create table exposition(
	id int primary key,
    nomExpo varchar(2000),
    tarifAdulte decimal(6,2),
    tarifEnfant decimal(6,2),
    active bool
)engine InnoDB DEFAULT CHARSET=utf8mb4;

create table visite_exposition(
	idVisite int,
    idExpo int,
    constraint foreign key (idVisite) references visite(id),
    constraint foreign key (idExpo) references exposition(id),
    primary key (idVisite,idExpo)
)engine InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `utilisateur` (
  `mailU` varchar(150) NOT NULL,
  `mdpU` varchar(50) DEFAULT NULL,
  `pseudoU` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`mailU`, `mdpU`, `pseudoU`) VALUES
('alex.garat@gmail.com', '$1$zvN5hYSQSQDFUIQSdufUQSDFznHF5osT.', '@lex'),
('jj.soueix@gmail.com', '$1$zvN5hYMI$SDFGSDFGJqJSDJF.', 'drskott'),
('mathieu.capliez@gmail.com', 'seSzpoUAQgIl.', 'pich'),
('michel.garay@gmail.com', '$1$zvN5hYMI$VSatLQ6SDFGdsfgznHF5osT.', 'Mitch'),
('nicolas.harispe@gmail.com', '$1$zvNDSFQSdfqsDfQsdfsT.', 'Nico40'),
('test@bts.sio', 'seSzpoUAQgIl.', 'testeur SIO'),
('yann@lechambon.fr', 'sej6dETYl/ea.', 'yann');


insert into visite values (1, 1, 0, '2022-01-31 09:00:00', '2022-01-31 11:14:45'),
	(2, 2, 0, '2022-01-31 09:30:00', '2022-01-31 11:24:45'),
    (3, 2, 3, '2022-01-31 10:05:00', '2022-01-31 13:04:00'),
    (4, 2, 1, '2022-01-31 11:00:00', '2022-01-31 14:12:00'),
    (5, 1, 1, '2022-01-31 12:03:00', null),
    (6, 1, 2, '2022-01-31 13:00:00', null);
    
insert into exposition values (1, 'Exposition permanente', 21.50, 13.70, true),
	(2, 'L\'age d\'or du bronze', 13.50, 4.5, true),
    (3, 'Les relations familiales chez les Ouzbeck du moyen âge', 6.50, 0.00, true),
    (4, 'Tenues vestimentaires des péruviens du milieu du 17e siècle', 13.50, 4.5, true),
    (5, 'La conquête de l\'ouest ougandais', 8.90, 3.30, false);
    
insert into visite_exposition values (1, 1),(1,2),(1,3),(1,4),(2,1),(2,4),(3,1),(3,3),(4,2),(5,1),(5,2),(6,1),(6,3),(6,4);