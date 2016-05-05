-- Database and able definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file;
-- also 'create view' statements if you choose to use it. (?)

--  create and connect database
CREATE DATABASE tournament;
\c tournament

--  command to drop database
-- DROP DATABASE tournament;

--  create players table:
CREATE TABLE players (id smallserial primary key, name text);

--  create matches table:
CREATE TABLE matches (winnerID smallint references players (id), loserID smallint references players (id));


--  example commands to populate tables
--  INSERT INTO players VALUES (DEFAULT, 'name');
--  INSERT INTO matches VALUES (winnerID, loserID)


