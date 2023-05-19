


-- ************************************************************
--              SELECT    Le Read de notre CRUD
-- ***********************************************************

-- * pour ALL
SELECT * FROM employes; --  affiche toutes les données de la table employes

--  afficher le nom et le prenom de tout les employes
SELECT nom, prenom FROM employes;

-- afficher les services des employes
SELECT service FROM employes;

--   affiche les différents services dedoublonnés
SELECT DISTINCT service FROM employes;


--  clause WHERE

SELECT * FROM employes WHERE service='informatique';

-- LIKE
--  employes dont le prenom commence par s
SELECT * FROM employes WHERE prenom LIKE 's%';
-- employes dont le prénom se termine par un e
SELECT * FROM employes WHERE prenom LIKE '%e';

SELECT * FROM employes WHERE prenom LIKE '%-%';

SELECT * FROM employes WHERE date_embauche BETWEEN '2000-01-01' AND '2000-12-31';

--  operateur de comparaison:
--  <
--  >
--  =
--  <=
-- >=
-- !=  ou  <>

SELECT * FROM employes WHERE service != 'informatique';

-- ORDER BY

SELECT * FROM employes ORDER BY salaire ASC;   --  sinon DESC pour decroissant

-- equivaut à car ASC est la valeur par defaut
SELECT * FROM employes ORDER BY salaire;

SELECT * FROM employes ORDER BY salaire, prenom DESC;

--  LIMIT

SELECT * FROM employes ORDER BY salaire LIMIT 0,1;-- 0 correspond à l'offset (le point de départ du jeu de résultats). Il est définipar défaut à 0 si non renseigné
SELECT * FROM employes ORDER BY salaire LIMIT 1;


--  attention à respecter l'ordre
--   SELECT .... FROM .... WHERE ... BETWEEEN ... ORDER BY ... LIMIT

-- L'alias AS
SELECT salaire*12 AS salaire_annuel FROM employes;

--  Fonction d'agregat    nomfonction()

--   SUM()
SELECT SUM(salaire*12) as masse_salariale FROM employes;
-- MIN()  et MAX()

SELECT MIN(salaire) FROM employes;

-- AVG pour average
SELECT AVG(salaire) FROM employes;


-- arrondi avec ROUND
SELECT ROUND(AVG(salaire),1) FROM employes;


--COUNT()
SELECT COUNT(id_employes) FROM employes WHERE sexe='f';

-- IN

SELECT * FROM employes WHERE service IN ('comptabilite', 'informatique');

SELECT * FROM employes WHERE service NOT IN ('comptabilite', 'informatique');

-- AND et OR
SELECT * FROM  employes WHERE service='comptabilite' AND salaire >=2000;

SELECT * FROM employes WHERE (service ='production' AND salaire=1900) OR salaire =2300;

-- cd C:\xampp\mysql\bin
--
--     mysql.exe -u root

-- GROUP BY
SELECT service, count(*) AS nbr_employe_service FROM employes GROUP BY service;


-- GROUP BY ... HAVING

SELECT service, count(*) AS nbr_employe_service FROM employes GROUP BY service HAVING nbr_employe_service >1;


-- ************************************
-- Requêtes d'insertion
-- ************************************

-- INSERT INTO
INSERT employes (prenom, nom, sexe, service, date_embauche, salaire) VALUES ('alexis', 'richy', 'm', 'informatique', '2011-12-28', 1800); -- Insertion d'un employé dans la table employes. L'ordre des champs et des valeurs entre les 2 paires de () doit être le même. L'id_employes n'étant pas précisé, il sera auto-incrémenté par la BDD.

-- Insertion sans préciser le nom des champs :
INSERT INTO employes VALUES (NULL, 'John', 'Doe', 'm', 'communication', '2019-12-15', 2000); -- on peut insérer un employé sans préciser la liste des champs SI les valeurs données respectent l'ordre des champs de la BDD, y compris l'id_employes pour lequel nous mettons la mention NULL afin qu'il soit auto-incrémenté par la BDD.


-- ************************************
-- Requêtes de modification
-- ************************************

-- UPDATEr
UPDATE employes SET salaire = 1871 WHERE id_employes = 699; -- on modifie le salaire de l'employé d'identifiant 699 pour ne pas modifier tous les employés qui porteraient le même nom.

-- A NE PAS FAIRE : un UPDATE sans clause WHERE quand on veut ne modifier qu'un seul enregistrement :
UPDATE employes SET salaire = 1871; -- ici on modifierait TOUTE la table.

-- REPLACE
REPLACE INTO employes (id_employes, prenom, nom, sexe, service, date_embauche, salaire) VALUES (2000, 'test', 'test', 'm', 'marketing', '2010-07-05', 2600); -- se comporte comme un INSERT INTO car l'identifiant n'existe pas

REPLACE INTO employes (id_employes, prenom, nom, sexe, service, date_embauche, salaire) VALUES (2000, 'test', 'test', 'm', 'marketing', '2010-07-05', 2601); -- se comporte comme un UPDATE car l'identifiant existe en BDD (il a été inséré juste avant).


-- ***********************************
-- Requêtes de suppression
-- ***********************************

-- DELETE
DELETE FROM employes WHERE id_employes = 900;  -- suppression de l'employé d'id 900 (Lagarde)

DELETE FROM employes WHERE id_employes = 388 OR id_employes = 990; -- ici il s'agit d'un OR car un même employé ne peut pas avoir deux identifiants différents en même temps

-- A NE PAS FAIRE : un DELETE sans clause WHERE
DELETE FROM employes;  -- revient à vider la table comme avec TRUNCATE







-- ***************************
-- Exercices
-- ***************************
-- 1. Afficher le service de l'employé 547
SELECT       FROM employes      ;
-- 2. Afficher la date d'embauche d'Amandine
SELECT       FROM employes      ;
-- 3. Afficher le nombre de commerciaux
SELECT       FROM employes      ;
-- 4. Afficher le salaire des commerciaux sur 1 année
SELECT       FROM employes      ;
-- 5. Afficher le salaire moyen par service
SELECT       FROM employes      ;

-- 6. Afficher le nombre de recrutement sur 2010
SELECT       FROM employes      ;
-- 8. Afficher le nombre de services DIFFERENTS
SELECT       FROM employes      ;
-- 9. Afficher le nombre d'employés par service
SELECT       FROM employes      ;
-- 10. Afficher les informations de l'employé du service commercial gagnant le salaire le plus élevé
SELECT       FROM employes      ;
-- 11. Afficher l'employé ayant été embauché en dernier
SELECT       FROM employes      ;
