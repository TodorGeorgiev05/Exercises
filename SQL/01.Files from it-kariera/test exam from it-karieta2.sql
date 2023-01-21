-- CREATE DATABASE IF NOT EXISTS colonial_journey_management_system_db;
-- USE colonial_journey_management_system_db;

-- CREATE TABLE planets(
-- id INT(11) PRIMARY KEY AUTO_INCREMENT,
-- name VARCHAR(30) NOT NULL
-- );

-- CREATE TABLE IF NOT EXISTS spaceports (
-- id INT(11) PRIMARY KEY AUTO_INCREMENT,
-- name VARCHAR(50) NOT NULL,
-- planet_id INT(11),
-- constraint FK_spaceports_planets
-- foreign key (planet_id)
-- references planets (id)
-- );

-- CREATE TABLE IF NOT EXISTS spaceships (
-- id INT(11) PRIMARY KEY AUTO_INCREMENT,
-- name VARCHAR(50) NOT NULL,
-- manufacturer VARCHAR(30) NOT NULL,
-- light_speed_rate INT(11) DEFAULT 0
-- );

-- CREATE TABLE IF NOT EXISTS colonists (
-- id INT(11) PRIMARY KEY AUTO_INCREMENT,
-- first_name VARCHAR(20) NOT NULL,
-- last_name VARCHAR(20) NOT NULL,
-- ucn CHAR(10) NOT NULL UNIQUE,
-- birth_date DATE NOT NULL
-- );

-- CREATE TABLE IF NOT EXISTS journeys (
-- id INT(11) PRIMARY KEY AUTO_INCREMENT,
-- journey_start DATETIME NOT NULL,
-- journey_end DATETIME NOT NULL,
-- purpose ENUM('Medical', 'Technical', 'Educational', 'Military'),
-- destination_spaceport_id INT(11),
-- spaceship_id INT(11),
-- constraint FK_journeys_spaceports
-- foreign key (destination_spaceport_id)
-- references spaceports (id),

-- constraint FK_journeys_spaceships
-- foreign key (spaceship_id)
-- references spaceships (id)
-- );

-- CREATE TABLE IF NOT EXISTS travel_cards (
-- id INT(11) PRIMARY KEY AUTO_INCREMENT,
-- card_number CHAR(10) NOT NULL UNIQUE,
-- job_during_journey ENUM('Pilot', 'Engineer', 'Trooper', 'Cleaner', 'Cook') ,
-- -- TODO
-- colonist_id INT(11),
-- journey_id INT(11),
-- constraint FK_travel_cards_colonists
-- foreign key (colonist_id)
-- references colonists (id),

-- constraint FK_travel_cards_journeys
-- foreign key (journey_id)
-- references journeys (id)
-- );

-- 2
-- manipulating
-- 3
-- insert 
-- 4
-- delete 
-- 5
-- select card_number, job_during_journey from travel_cards
-- order by card_number asc

-- 6
-- select id, concat(first_name, " ", last_name) as full_name, ucn from colonists
-- order by first_name, last_name, id

-- 7
-- select id, journey_start, journey_end from journeys 
-- where purpose = 'Military'
-- order by journey_start asc

-- 8 
-- select c.id, concat(c.first_name, " ", c.last_name) as full_name
-- from colonists as c
-- join travel_cards as tc
-- on tc.colonist_id = c.id
-- where job_during_journey = 'Pilot'
-- order by c.id asc

-- 9
-- select s.name as spaceship_name, sp.name as spaceport_name from spaceships as s
-- join journeys as j
-- on j.spaceship_id = s.id
-- join spaceports as sp 
-- on sp.id = j.destination_spaceport_id
-- order by s.light_speed_rate desc

-- 10
-- select p.name as planet_name, s.name as spaceport_name from 
-- planets as p
-- join spaceports as s
-- on s.planet_id = p.id
-- join journeys as j
-- on j.destination_spaceport_id = s.id
-- where purpose = 'Educational'
-- order by spaceport_name desc 

-- 11
-- select p.name, count(j.destination_spaceport_id) as journeys_count 
-- from planets as p
-- join spaceports as s
-- on s.planet_id = p.id
-- join journeys as j
-- on j.destination_spaceport_id = s.id
-- group by p.name
-- order by journeys_count desc, name asc;
	