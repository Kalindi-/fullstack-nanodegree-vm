-- Database, table and view definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file;
-- also 'create view' statements if you choose to use it.

--  command to drop database
-- DROP DATABASE tournament;

--  create and connect database
CREATE DATABASE tournament;
\c tournament

--  create players table:
CREATE TABLE players (
						id smallserial primary key,
						name text
					);

--  create matches table:
CREATE TABLE matches (
						winnerID smallint references players (id),
						loserID smallint references players (id)
					);

--  create views
 -- view for win count
CREATE VIEW win_view AS
    SELECT players.id, players.name, COUNT(matches.winnerID) AS wins
    FROM players LEFT JOIN matches
    ON players.id = matches.winnerID
    GROUP BY players.id;

 -- view for losses count
CREATE VIEW loss_view AS
	SELECT players.id, count(matches.loserID) AS losses
	FROM players LEFT JOIN matches
	ON players.id = matches.loserID
	GROUP BY players.id;

 -- view for win and playes per player
CREATE VIEW player_matches AS
	SELECT win_view.id,
		   win_view.name,
		   win_view.wins,
		   SUM(win_view.wins + loss_view.losses) AS plays
	FROM win_view LEFT JOIN loss_view
	ON win_view.id = loss_view.id
	GROUP BY win_view.id, win_view.name, win_view.wins;


--  example commands to populate tables
--  INSERT INTO players VALUES (DEFAULT, 'name');
--  INSERT INTO matches VALUES (winnerID, loserID);

