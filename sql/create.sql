-- Drop database and app user
drop database if exists smb2014;
drop user if exists smb2014;

-- Create database and app role
create database smb2014;
create user smb2014 with password 'smb2014pass';

-- Grants
alter user smb2014 createdb;
grant postgres to smb2014;
