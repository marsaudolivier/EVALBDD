<--Création de la  table complexes-->
DROP TABLE IF EXISTS complexes;
CREATE TABLE complexes(
   Id_complexes INT NOT NULL AUTO_INCREMENT,
   nom VARCHAR(50),
   PRIMARY KEY(Id_complexes)
);
<!--intégration de donnée fictive-->
INSERT INTO complexes VALUES
   (1, 'gaumont'),
    (2, 'pathe'),
    (3, 'ugc'),
    (4, 'cgr'),
    (5, 'mk2'),
    (6, 'kinepolis');
<!--Création de la table cinema-->
DROP TABLE IF EXISTS cinema;
CREATE TABLE cinema(
   Id_cinema INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   nom VARCHAR(50),
   adresse VARCHAR(255),
   Id_complexes INT NOT NULL,
   FOREIGN KEY(Id_complexes) REFERENCES complexes(Id_complexes)
);
<!--intégration de donnée fictive-->
INSERT INTO cinema VALUES
   (1, 'Cinéma de la ville de Cholet', 'Cholet', 1),
   (2, 'Cinéma de la ville de Paris', 'Paris', 2),
   (3, 'Cinéma de la ville de Nantes', 'Nantes', 3);
<!--Création de la table film-->
DROP TABLE IF EXISTS film;
CREATE TABLE film(
   Id_film INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   titre VARCHAR(50),
   duree TIME,
   synopsie TEXT,
);
<!--intégration de donnée fictive-->
INSERT INTO film VALUES
   (1, 'Le seigneur des anneaux', '3h30', 'Un film de Peter Jackson'),
   (2, 'Le seigneur des anneaux 2', '3h10', 'Un film de Peter Jackson'),
   (3, 'Le seigneur des anneaux 3', '3h00', 'Un film de Peter Jackson');
<!--Création de la table prix-->
DROP TABLE IF EXISTS prix;
CREATE TABLE prix(
   Id_tarif INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   prix DECIMAL(3,2),
);
<!--intégration de donnée fictive-->
INSERT INTO prix VALUES
   (1, 5.90),
   (2, 7.60),
   (3, 9.20);
<!--Création de la table salle-->
DROP TABLE IF EXISTS salle;
CREATE TABLE salle(
   Id_salle INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   places INT,
   nom VARCHAR(50),
   Id_cinema INT NOT NULL,
   FOREIGN KEY(Id_cinema) REFERENCES cinema(Id_cinema)
);
<!--intégration de donnée fictive-->
INSERT INTO salle VALUES
   (1, 100, 'Salle 1', 1),
   (2, 200, 'Salle 2', 1),
   (3, 300, 'Salle 3', 2),
   (4, 400, 'Salle 4', 2),
   (5, 500, 'Salle 5', 3),
   (6, 600, 'Salle 6', 3);
<!--Création de la table role-->
DROP TABLE IF EXISTS role;
CREATE TABLE role(
   Id_role INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   fonction VARCHAR(50),
);
<!--intégration de donnée fictive-->
INSERT INTO role VALUES
   (1, 'Directeur général'),
   (2, 'Directeur cinéma');
<!--Création de la table sceance-->
DROP TABLE IF EXISTS sceance;
CREATE TABLE sceance(
   Id_sceance INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   début DATETIME,
   fin DATETIME,
   Id_salle INT NOT NULL,
   FOREIGN KEY(Id_salle) REFERENCES salle(Id_salle)
);
<!--intégration de donnée fictive-->
INSERT INTO sceance VALUES
   (1, '14:00', '16:00', 1),
   (2, '16:00', '18:00', 1),
   (3, '18:00', '20:00', 2),
   (4, '20:00', '22:00', 2),
   (5, '22:00', '00:00', 3),
   (6, '00:00', '02:00', 3);
<!--Création de la table client-->
DROP TABLE IF EXISTS client;
CREATE TABLE client(
   Id_client INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   numéro INT,
   Id_tarif INT NOT NULL,
   UNIQUE(numéro),
   FOREIGN KEY(Id_tarif) REFERENCES prix(Id_tarif)
);
<!--intégration de donnée fictive-->
INSERT INTO client VALUES
   (1, 1, 1),
   (2, 2, 2),
   (3, 3, 3);
<!--Création de la table employer-->
DROP TABLE IF EXISTS employer;
CREATE TABLE employer(
   Id_employer INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   Id_role INT NOT NULL,
   Id_complexes INT NOT NULL,
   FOREIGN KEY(Id_role) REFERENCES role(Id_role),
   FOREIGN KEY(Id_complexes) REFERENCES complexes(Id_complexes)
);
<!--intégration de donnée fictive-->
INSERT INTO employer VALUES
   (1, 'Dupont', 'Jean', 1, 1),
   (2, 'Dupont', 'Jean', 2, 2),
   (3, 'Dupont', 'Jean', 1, 3);
<!--Création de la table diffuser-->
DROP TABLE IF EXISTS diffuser;
CREATE TABLE diffuser(
   Id_film INT,
   Id_salle INT,
   FOREIGN KEY(Id_film) REFERENCES film(Id_film),
   FOREIGN KEY(Id_salle) REFERENCES salle(Id_salle)
);
<!--intégration de donnée fictive-->
INSERT INTO diffuser VALUES
   (1, 1),
   (2, 2),
   (3, 3);
<!--Création de la table couter-->
DROP TABLE IF EXISTS couter;
CREATE TABLE couter(
   Id_tarif INT,
   Id_sceance INT,
   FOREIGN KEY(Id_tarif) REFERENCES prix(Id_tarif),
   FOREIGN KEY(Id_sceance) REFERENCES sceance(Id_sceance)
);
<!--intégration de donnée fictive-->
INSERT INTO couter VALUES
   (1, 1),
   (2, 1),
    (3, 1),
    (1, 2),
    (2, 2),
    (3, 2),
    (1, 3),
    (2, 3),
    (3, 3),
    (1, 4),
    (2, 4),
    (3, 4),
    (1, 5),
    (2, 5),
    (3, 5),
    (1, 6),
    (2, 6),
    (3, 6);