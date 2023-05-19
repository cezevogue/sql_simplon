table: abonne
+-----------+-----------+
| id_abonne | prenom    |
+-----------+-----------+
|         1 | Guillaume |
|         2 | Benoit    |
|         3 | Chloe     |
|         4 | Laura     |
+-----------+-----------+

table: emprunt
+------------+----------+-----------+--------------+------------+
| id_emprunt | id_livre | id_abonne |  date_sortie | date_rendu |
+------------+----------+-----------+--------------+------------+
|          1 |      100 |         1 | 2011-12-17   | 2011-12-18 |
|          2 |      101 |         2 | 2011-12-18   | 2011-12-20 |
|          3 |      100 |         3 | 2011-12-19   | 2011-12-22 |
|          4 |      103 |         4 | 2011-12-19   | 2011-12-22 |
|          5 |      104 |         1 | 2011-12-19   | 2011-12-28 |
|          6 |      105 |         2 | 2012-03-20   | 2012-03-26 |
|          7 |      105 |         3 | 2013-06-13   | NULL       |
|          8 |      100 |         2 | 2013-06-15   | NULL       |
+------------+----------+-----------+--------------+------------+

table: livre
+----------+-------------------+-------------------------+
| id_livre | auteur            | titre                   |
+----------+-------------------+-------------------------+
|      100 | GUY DE MAUPASSANT | Une vie                 |
|      101 | GUY DE MAUPASSANT | Bel-Ami                 |
|      102 | HONORE DE BALZAC  | Le pere Goriot          |
|      103 | ALPHONSE DAUDET   | Le Petit chose          |
|      104 | ALEXANDRE DUMAS   | La Reine Margot         |
|      105 | ALEXANDRE DUMAS   | Les Trois Mousquetaires |
+----------+-------------------+-------------------------+






-- ****************
-- Exercices
-- ****************

-- 1. Quel est l'id_abonne de Laura ?

-- 2. L'abonné d'id_abonne 2 est venu emprunté un livre à quelles dates (date_sortie) ?

-- 3. Combien d'emprunts ont été effectués en tout ?

-- 4. Combien de livres sont sortis le 2011-12-19 ?

-- 5. Une Vie est de quel auteur ?

-- 6. De combien de livres d'Alexandre Dumas dispose-t-on ?

-- 7. Quel id_livre est le plus emprunté ?

-- REQUETE IMBRIQUEE

 SELECT id_livre FROM emprunt WHERE date_rendu IS NULL;

--  tout les livres qui n'ont pas été rendus
SELECT * FROM livre WHERE id_livre IN (SELECT id_livre FROM emprunt WHERE date_rendu IS NULL );

--   Afficher le prenom, et les infos des livres que guillaume a emprunté
SELECT a.prenom , l.*
FROM abonne a LEFT JOIN emprunt e
ON a.id_abonne=e.id_abonne
INNER JOIN livre l
ON e.id_livre=l.id_livre
WHERE a.prenom='guillaume';




--  tout les prenom et infos livre emprunté
SELECT l.titre, e.date_sortie, a.prenom
FROM abonne a
INNER JOIN emprunt e
ON a.id_abonne=e.id_abonne
INNER JOIN livre l
ON l.id_livre=e.id_livre;



-- tout les prenom et infos livre emprunté même les prenoms des abonnés qui n'ont jamais emprunté un livre
SELECT l.titre, e.date_sortie, a.prenom
FROM abonne a LEFT JOIN emprunt e
ON a.id_abonne=e.id_abonne
LEFT JOIN livre l
ON l.id_livre=e.id_livre;