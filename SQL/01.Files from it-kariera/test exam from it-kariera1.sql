-- 0

-- CREATE DATABASE IF NOT EXISTS bsc_db;
-- USE bsc_db;
-- CREATE TABLE IF NOT EXISTS users (
-- id INT PRIMARY KEY AUTO_INCREMENT,
-- username VARCHAR(30) NOT NULL UNIQUE,
-- password VARCHAR(30) NOT NULL, 
-- email VARCHAR(50) NOT NULL
-- );

-- CREATE TABLE IF NOT EXISTS repositories(
-- id INT PRIMARY KEY AUTO_INCREMENT, 
-- name VARCHAR(50) NOT NULL
-- );

-- CREATE TABLE IF NOT EXISTS repositories_contributors(
-- repository_id INT,
-- contributor_id INT,
-- constraint FK_repositories_contributors_Repositories
-- foreign key (repository_id)
-- references repositories (id),

-- constraint FK_repositories_contributors_Useres
-- foreign key (contributor_id)
-- references users (id)
-- );

-- CREATE TABLE IF NOT EXISTS issues (
-- id INT PRIMARY KEY AUTO_INCREMENT,
-- title VARCHAR(255) NOT NULL,
-- issue_status VARCHAR(6) NOT NULL,
-- repository_id INT NOT NULL,
-- assignee_id INT NOT NULL,

-- constraint FK_issues_repositories
-- foreign key (repository_id)
-- references repositories (id),

-- constraint FK_issues_users
-- foreign key (assignee_id)
-- references users (id)
-- );

-- CREATE TABLE IF NOT EXISTS commits (
-- id INT PRIMARY KEY AUTO_INCREMENT,
-- message VARCHAR(255) NOT NULL,
-- issue_id INT,
-- repository_id INT NOT NULL,
-- contributor_id INT NOT NULL,
-- constraint FK_commits_issues
-- foreign key (issue_id)
-- references issues (id),

-- constraint FK_commits_repositories
-- foreign key (repository_id)
-- references repositories (id),

-- constraint FK_commits_users
-- foreign key (contributor_id)
-- references users (id)
-- );

-- CREATE TABLE IF NOT EXISTS files (
-- id INT PRIMARY KEY AUTO_INCREMENT key,
-- name VARCHAR(100) NOT NULL,
-- size DECIMAL(10,2) NOT NULL,
-- parent_id INT,
-- commit_id INT NOT NULL,
-- CONSTRAINT fk_files_files 
-- foreign key(parent_id)
-- references files(id),

-- CONSTRAINT fk_files_commits 
-- foreign key(commit_id)
-- references commits(id)
-- );

-- 1
-- select id, username from users

-- 2
-- select repository_id, contributor_id from repositories_contributors
-- where repository_id = contributor_id
-- order by repository_id asc, contributor_id asc

-- 3
-- select i.id, concat(u.username, " : ", i.title) from issues as i
-- join users as u
-- on u.id = i.assignee_id
-- order by i.id desc

-- 4
-- select f.id, f.name as Name, concat(f.size, "KB") as size
-- from files as f
-- left join files as ff
-- on f.id = ff.parent_id
-- where ff.parent_id is null

-- 5
-- select r.id, r.name, count(i.repository_id) as issues 
-- from repositories as r
-- join issues as i
-- on i.repository_id = r.id
-- group by repository_id
-- order by issues desc,id asc, name desc
-- limit 5

-- 6
-- select r.id, r.name, count(c.repository_id) as commits ,count(rc.contributor_id)as contributors from repositories as r
-- join repositories_contributors as rc
-- on rc.repository_id = r.id
-- join commits as c
-- on c.repository_id = r.id
-- where c.repository_id = 22
-- group by  c.repository_id 
-- order by contributors desc, id asc;
-- limit 1

-- 7
select r.id, r.name,
count(c.contributor_id)as users
from repositories as r
left outer join commits as c
on c.repository_id = r.id
group by r.name
order by users desc, r.id asc, name asc

-- JUDJE se kara zashtoto nqma repositoritata koito sa s count 0 -solved
-- bukvalno judje im e greshen zashtoto ima dve catalina a v tqhniqt otg e 1
