CREATE TABLE if not exists images(
  img_id bigint(20) primary key NOT NULL AUTO_INCREMENT,
  img_nom varchar(50) NOT NULL,
  img_blob blob NOT NULL
) ;

CREATE TABLE if not exists habitat (
  habitat_id bigint(20) primary key NOT NULL AUTO_INCREMENT,
  nom varchar(255) NOT NULL,
  description text NOT NULL
) ;

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
    img_blob blob ,
    habitat_id bigint
);
alter table animal add FOREIGN KEY (habitat_id) REFERENCES habitat(habitat_id) ON UPDATE CASCADE ON DELETE cascade;
alter table animal add FOREIGN KEY (race_id) REFERENCES race(race_id) ON UPDATE CASCADE ON DELETE cascade;

CREATE TABLE information_animal(
    info_id bigint(20) primary key NOT NULL AUTO_INCREMENT,
    animal_id bigint ,
    etat_id text ,
    nourriture_id bigint ,
    grammage DECIMAL(10, 2),
    date_passage TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
    detail_etat_animal text

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

create table compte(
    compte_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE not null,
    motdepasse VARCHAR(100) not null,
    type varchar(250) not null
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

-- compte

insert into compte (type,username,motdepasse) values ('veterinaire','user_vetirinaire1@arcadia.fr','12345678');
insert into compte (type,username,motdepasse) values ('veterinaire','user_vetirinaire2@arcadia.fr','87654321');
insert into compte (type,username,motdepasse) values ('employe','user_employe1@arcadia.fr','123456');
insert into compte (type,username,motdepasse) values ('employe','user_employe2@arcadia.fr','654321');
insert into compte (type,username,motdepasse) values ('employe','user_employe3@arcadia.fr','1369');
insert into compte (type,username,motdepasse) values ('employe','user_employe4@arcadia.fr','9631');

-- habitat

insert into habitat (nom,description) values ('savane','origine savane');
insert into habitat (nom,description) values ('jungle','origine jungle');
insert into habitat (nom,description) values ('marais','origine marais');

-- etat

insert into etat (nom) values ('bonne santé');
insert into etat (nom) values ('malade');

-- race

insert into race (nom,description) values ('bovines','desc1');
insert into race (nom,description) values ('canines','desc2');
insert into race (nom,description) values ('félines','desc3');
insert into race (nom,description) values ('caprines','desc4');

-- animal

insert into animal (prenom,habitat_id,race_id,img_blob) values('chat',1,1,null);
insert into animal (prenom,habitat_id,race_id,img_blob) values('chien loup',1,2,null);
insert into animal (prenom,habitat_id,race_id,img_blob) values('tigre',2,3,null);
insert into animal (prenom,habitat_id,race_id,img_blob) values('pinguin',3,4,null);
insert into animal (prenom,habitat_id,race_id,img_blob) values('singe',3,4,null);

-- nourriture

insert into nourriture (nom) values ('herbes');
insert into nourriture (nom) values ('graines');
insert into nourriture (nom) values ('fruits');
insert into nourriture (nom) values ('viandes');
insert into nourriture (nom) values ('poissons');