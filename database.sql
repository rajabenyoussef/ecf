CREATE TABLE if not exists images(
  img_id bigint(20) primary key NOT NULL AUTO_INCREMENT,
  img_data blob NOT NULL
) ;

create table role
(
 role_id int PRIMARY KEY AUTO_INCREMENT,
 label varchar (50) 
);

CREATE TABLE if not exists habitat (
  habitat_id bigint(20) primary key NOT NULL AUTO_INCREMENT,
  nom varchar(255) NOT NULL,
  description text NOT NULL,
  img_id bigint(20)
) ;
alter table habitat add FOREIGN KEY (img_id) REFERENCES images(img_id) ON UPDATE CASCADE ON DELETE cascade;

CREATE TABLE if not exists race (
 race_id bigint(20) primary key NOT NULL AUTO_INCREMENT,
 nom VARCHAR(50),
 description TEXT
); 

create table if not exists nourriture(
 nourriture_id bigint(20) primary key NOT NULL AUTO_INCREMENT,
 nom varchar(255) 
);

CREATE TABLE if not exists animal(
 animal_id bigint(20) primary key NOT NULL AUTO_INCREMENT,
 prenom varchar(255) NOT NULL,
 race_id bigint,
 img_id bigint ,
 habitat_id bigint
);
alter table animal add FOREIGN KEY (habitat_id) REFERENCES habitat(habitat_id) ON UPDATE CASCADE ON DELETE cascade;
alter table animal add FOREIGN KEY (race_id) REFERENCES race(race_id) ON UPDATE CASCADE ON DELETE cascade;
alter table animal add FOREIGN KEY (img_id) REFERENCES images(img_id) ON UPDATE CASCADE ON DELETE cascade;

CREATE TABLE information_animal(
 info_id bigint(20) primary key NOT NULL AUTO_INCREMENT,
 animal_id bigint ,
 etat_id text ,
 nourriture_id bigint ,
 grammage DECIMAL(10, 2),
 date_passage TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
 detail text

);
alter table information_animal add FOREIGN KEY (animal_id) REFERENCES animal(animal_id) ON UPDATE CASCADE ON DELETE cascade;
alter table information_animal add FOREIGN KEY (nourriture_id) REFERENCES nourriture(nourriture_id) ON UPDATE CASCADE ON DELETE cascade;
alter table information_animal add FOREIGN KEY (etat_id) REFERENCES etat(etat_id) ON UPDATE CASCADE ON DELETE cascade;

CREATE TABLE service (
 service_id INT PRIMARY KEY AUTO_INCREMENT,
 nom VARCHAR(100) UNIQUE,
 description TEXT
);

CREATE TABLE etat (
 etat_id INT PRIMARY KEY AUTO_INCREMENT,
 nom VARCHAR(100) UNIQUE
);

create table utilisateur(
 compte_id INT PRIMARY KEY AUTO_INCREMENT,
 username VARCHAR(50) UNIQUE not null,
 motdepasse VARCHAR(100) not null,
 role_id(250) bigint(20)
);

CREATE TABLE contact (
 contact_id INT PRIMARY KEY AUTO_INCREMENT,
 email VARCHAR(100),
 titre VARCHAR(255),
 description TEXT,
 isread BOOLEAN DEFAULT FALSE
);

CREATE TABLE aliment_quoti (
 alimentation_id INT PRIMARY KEY AUTO_INCREMENT,
 date_heure_alim TIMESTAMP,
 animal_id bigint(20),
 nourriture_id bigint(20),
 qte DECIMAL(10, 2)
);
alter table aliment_quoti add FOREIGN KEY (animal_id) REFERENCES animal(animal_id) ON UPDATE CASCADE ON DELETE cascade;
alter table aliment_quoti add FOREIGN KEY (nourriture_id) REFERENCES nourriture(nourriture_id) ON UPDATE CASCADE ON DELETE cascade;

-- role
insert into role (label) values ('vetirinaire');
insert into role (label) values ('jardinier');
insert into role (label) values ('guichet');
insert into role (label) values ('securite');

-- utilisateur 

insert into utilisateur (role_id,username,motdepasse) values (1,'user_vetirinaire1@arcadia.fr','12345678');
insert into utilisateur (role_id,username,motdepasse) values (1,'user_vetirinaire2@arcadia.fr','87654321');
insert into utilisateur (role_id,username,motdepasse) values (2,'user_employe1@arcadia.fr','123456');
insert into utilisateur (role_id,username,motdepasse) values (3,'user_employe2@arcadia.fr','654321');
insert into utilisateur (role_id,username,motdepasse) values (3,'user_employe3@arcadia.fr','1369');
insert into utilisateur (role_id,username,motdepasse) values (4,'user_employe4@arcadia.fr','9631');

-- habitat

insert into habitat (nom,description,img_id) values ('savane','origine savane',null);
insert into habitat (nom,description,img_id) values ('jungle','origine jungle',null);
insert into habitat (nom,description,img_id) values ('marais','origine marais',null);

-- etat

insert into etat (nom) values ('bonne santé');
insert into etat (nom) values ('malade');

-- race

insert into race (nom,description) values ('bovines','desc1');
insert into race (nom,description) values ('canines','desc2');
insert into race (nom,description) values ('félines','desc3');
insert into race (nom,description) values ('caprines','desc4');

-- animal

insert into animal (prenom,habitat_id,race_id,img_id) values('chat',1,1,null);
insert into animal (prenom,habitat_id,race_id,img_id) values('chien loup',1,2,null);
insert into animal (prenom,habitat_id,race_id,img_id) values('tigre',2,3,null);
insert into animal (prenom,habitat_id,race_id,img_id) values('pinguin',3,4,null);
insert into animal (prenom,habitat_id,race_id,img_id) values('singe',3,4,null);

-- nourriture

insert into nourriture (nom) values ('herbes');
insert into nourriture (nom) values ('graines');
insert into nourriture (nom) values ('fruits');
insert into nourriture (nom) values ('viandes');
insert into nourriture (nom) values ('poissons');

-- information_animal

INSERT INTO information_animal (animal_id, etat_id,nourriture_id,grammage,date_passage,detail) VALUES
( 1, 1, 1, 50, '2024-02-10 09:18:22', 'en bonne santé');
INSERT INTO information_animal (animal_id, etat_id,nourriture_id,grammage,date_passage,detail) VALUES
( 1, 2, 1, 5000, '2024-02-10 09:18:22', 'en bonne santé');