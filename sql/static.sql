-- Static data

-- Team groups
drop table if exists team_group cascade;
create table team_group(
    id serial PRIMARY KEY,
    name char(1) NOT NULL
);
insert into team_group(name) values('A');
insert into team_group(name) values('B');
insert into team_group(name) values('C');
insert into team_group(name) values('D');
insert into team_group(name) values('E');
insert into team_group(name) values('F');
insert into team_group(name) values('G');
insert into team_group(name) values('H');

-- Teams
drop table if exists team cascade;
create table team(
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    code char(3) NOT NULL,
    team_group_id int references team_group
);
-- Group A
insert into team(name, code, team_group_id) values ('Brazil', 'BRA', 1);
insert into team(name, code, team_group_id) values ('Croatia', 'CRO', 1);
insert into team(name, code, team_group_id) values ('Mexico', 'MEX', 1);
insert into team(name, code, team_group_id) values ('Cameroon', 'CMR', 1);
-- Group B
insert into team(name, code, team_group_id) values ('Spain', 'ESP', 2);
insert into team(name, code, team_group_id) values ('Netherlands', 'NED', 2);
insert into team(name, code, team_group_id) values ('Chile', 'CHI', 2);
insert into team(name, code, team_group_id) values ('Australia', 'AUS', 2);
-- Group C
insert into team(name, code, team_group_id) values ('Colombia', 'COL', 3);
insert into team(name, code, team_group_id) values ('Greece', 'GRE', 3);
insert into team(name, code, team_group_id) values ('Côte d''Ivoire', 'CIV', 3);
insert into team(name, code, team_group_id) values ('Japan', 'JPN', 3);
-- Group D
insert into team(name, code, team_group_id) values ('Uruguay', 'URU', 4);
insert into team(name, code, team_group_id) values ('Costa Rica', 'CRC', 4);
insert into team(name, code, team_group_id) values ('England', 'ENG', 4);
insert into team(name, code, team_group_id) values ('Italy', 'ITA', 4);
-- Group E
insert into team(name, code, team_group_id) values ('Switzerland', 'SUI', 5);
insert into team(name, code, team_group_id) values ('Ecuador', 'ECU', 5);
insert into team(name, code, team_group_id) values ('France', 'FRA', 5);
insert into team(name, code, team_group_id) values ('Honduras', 'HON', 5);
-- Group F
insert into team(name, code, team_group_id) values ('Argentina', 'ARG', 6);
insert into team(name, code, team_group_id) values ('Bosnia-Herzegovina', 'BIH', 6);
insert into team(name, code, team_group_id) values ('Iran', 'IRN', 6);
insert into team(name, code, team_group_id) values ('Nigeria', 'NGA', 6);
-- Group G
insert into team(name, code, team_group_id) values ('Germany', 'GER', 7);
insert into team(name, code, team_group_id) values ('Portugal', 'POR', 7);
insert into team(name, code, team_group_id) values ('Ghana', 'GHA', 7);
insert into team(name, code, team_group_id) values ('USA', 'USA', 7);
-- Group H
insert into team(name, code, team_group_id) values ('Belgium', 'BEL', 8);
insert into team(name, code, team_group_id) values ('Algeria', 'ALG', 8);
insert into team(name, code, team_group_id) values ('Russia', 'RUS', 8);
insert into team(name, code, team_group_id) values ('Korea Republic', 'KOR', 8);

-- Cities
drop table if exists city cascade;
create table city(
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL
);
insert into city(name) values('Belo Horizonte');
insert into city(name) values('Brasilia');
insert into city(name) values('Cuiaba');
insert into city(name) values('Curitiba');
insert into city(name) values('Fortaleza');
insert into city(name) values('Manaus');
insert into city(name) values('Natal');
insert into city(name) values('Porto Alegre');
insert into city(name) values('Recife');
insert into city(name) values('Rio de Janeiro');
insert into city(name) values('Salvador');
insert into city(name) values('Sao Paulo');

-- Stadium
drop table if exists stadium cascade;
create table stadium(
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    city_id INT references city
);
insert into stadium(name, city_id) values ('Estadio Mineirao', 1);
insert into stadium(name, city_id) values ('Estadio Nacional', 2);
insert into stadium(name, city_id) values ('Arena Pantanal', 3);
insert into stadium(name, city_id) values ('Arena da Baixada', 4);
insert into stadium(name, city_id) values ('Estadio Castelao', 5);
insert into stadium(name, city_id) values ('Arena Amazonia', 6);
insert into stadium(name, city_id) values ('Estadio das Dunas', 7);
insert into stadium(name, city_id) values ('Estadio Beira-Rio', 8);
insert into stadium(name, city_id) values ('Arena Pernambuco', 9);
insert into stadium(name, city_id) values ('Estadio do Maracana', 10);
insert into stadium(name, city_id) values ('Arena Fonte Nova', 11);
insert into stadium(name, city_id) values ('Arena de Sao Paulo', 12);

-- Matches
drop table if exists match cascade;
create table match(
    id serial PRIMARY KEY,
    code char(7) NOT NULL,
    date timestamptz NOT NULL,
    team_id1 int references team,
    team_id2 int references team,
    stadium_id int references stadium
);
-- Match 1
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'BRA-CRO', 
    '2014-06-12 17:00:00 -3:00', 
    (select id from team where code='BRA'), 
    (select id from team where code='CRO'), 
    (select id from stadium where name='Arena de Sao Paulo')
);
-- Match 2
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'MEX-CMR',
    '2014-06-13 13:00:00 -3:00', 
    (select id from team where code='MEX'), 
    (select id from team where code='CMR'), 
    (select id from stadium where name='Estadio das Dunas')
);
-- Match 3
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'ESP-NED',
    '2014-06-13 16:00:00 -3:00', 
    (select id from team where code='ESP'), 
    (select id from team where code='NED'), 
    (select id from stadium where name='Arena Fonte Nova')
);
-- Match 4
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'CHI-AUS',
    '2014-06-13 18:00:00 -4:00', 
    (select id from team where code='CHI'), 
    (select id from team where code='AUS'), 
    (select id from stadium where name='Arena Pantanal')
);
-- Match 5
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'COL-GRE',
    '2014-06-14 13:00:00 -3:00', 
    (select id from team where code='COL'),
    (select id from team where code='GRE'),
    (select id from stadium where name='Estadio Mineirao')
);
-- Match 6
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'CIV-JPN',
    '2014-06-14 22:00:00 -3:00', 
    (select id from team where code='CIV'),
    (select id from team where code='JPN'),
    (select id from stadium where name='Arena Pernambuco')
);
-- Match 7
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'URU-CRC',
    '2014-06-14 16:00:00 -3:00', 
    (select id from team where code='URU'),
    (select id from team where code='CRC'),
    (select id from stadium where name='Estadio Castelao')
);
-- Match 8 
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'ENG-ITA',
    '2014-06-14 18:00:00 -4:00', 
    (select id from team where code='ENG'),
    (select id from team where code='ITA'),
    (select id from stadium where name='Arena Amazonia')
);
-- Match 9 
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'SUI-ECU',
    '2014-06-15 13:00:00 -3:00', 
    (select id from team where code='SUI'),
    (select id from team where code='ECU'),
    (select id from stadium where name='Estadio Nacional')
);
-- Match 10 
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'FRA-HON',
    '2014-06-15 16:00:00 -3:00', 
    (select id from team where code='FRA'),
    (select id from team where code='HON'),
    (select id from stadium where name='Estadio Beira-Rio')
);
-- Match 11 
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'ARG-BIH',
    '2014-06-15 19:00:00 -3:00',
    (select id from team where code='ARG'),
    (select id from team where code='BIH'),
    (select id from stadium where name='Estadio do Maracana')
);
-- Match 12 
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'IRN-NGA',
    '2014-06-16 16:00:00 -3:00',
    (select id from team where code='IRN'),
    (select id from team where code='NGA'),
    (select id from stadium where name='Arena da Baixada')
);
-- Match 13 
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'GER-POR',
    '2014-06-16 13:00:00 -3:00',
    (select id from team where code='GER'),
    (select id from team where code='POR'),
    (select id from stadium where name='Arena Fonte Nova')
);
-- Match 14 
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'GHA-USA',
    '2014-06-16 19:00:00 -3:00',
    (select id from team where code='GHA'),
    (select id from team where code='USA'),
    (select id from stadium where name='Estadio das Dunas')
);
-- Match 15 
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'BEL-ALG',
    '2014-06-17 13:00:00 -3:00',
    (select id from team where code='BEL'),
    (select id from team where code='ALG'),
    (select id from stadium where name='Estadio Mineirao')
);
-- Match 16 
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'RUS-KOR',
    '2014-06-17 13:00:00 -4:00',
    (select id from team where code='RUS'),
    (select id from team where code='KOR'),
    (select id from stadium where name='Arena Pantanal')
);
-- Match 17 
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'BRA-MEX',
    '2014-06-17 16:00:00 -3:00',
    (select id from team where code='BRA'),
    (select id from team where code='MEX'),
    (select id from stadium where name='Estadio Castelao')
);
-- Match 18 
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'CMR-CRO',
    '2014-06-18 18:00:00 -4:00',
    (select id from team where code='CMR'),
    (select id from team where code='CRO'),
    (select id from stadium where name='Arena Amazonia')
);
-- Match 19 
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'ESP-CHI',
    '2014-06-18 16:00:00 -3:00',
    (select id from team where code='ESP'),
    (select id from team where code='CHI'),
    (select id from stadium where name='Estadio do Maracana')
);
-- Match 20 
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'AUS-NED',
    '2014-06-18 13:00:00 -3:00',
    (select id from team where code='AUS'),
    (select id from team where code='NED'),
    (select id from stadium where name='Estadio Beira-Rio')
);
-- Match 21
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'COL-CIV',
    '2014-06-19 13:00:00 -3:00',
    (select id from team where code='COL'),
    (select id from team where code='CIV'),
    (select id from stadium where name='Estadio Nacional')
);
-- Match 22
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'JPN-GRE',
    '2014-06-19 19:00:00 -3:00',
    (select id from team where code='JPN'),
    (select id from team where code='GRE'),
    (select id from stadium where name='Estadio das Dunas')
);
-- Match 23
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'URU-ENG',
    '2014-06-19 16:00:00 -3:00',
    (select id from team where code='URU'),
    (select id from team where code='ENG'),
    (select id from stadium where name='Arena de Sao Paulo')
);
-- Match 24
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'ITA-CRC',
    '2014-06-20 13:00:00 -3:00',
    (select id from team where code='ITA'),
    (select id from team where code='CRC'),
    (select id from stadium where name='Arena Pernambuco')
);
-- Match 25
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'SUI-FRA',
    '2014-06-20 16:00:00 -3:00',
    (select id from team where code='SUI'),
    (select id from team where code='FRA'),
    (select id from stadium where name='Arena Fonte Nova')
);
-- Match 26
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'HON-ECU',
    '2014-06-20 19:00:00 -3:00',
    (select id from team where code='HON'),
    (select id from team where code='ECU'),
    (select id from stadium where name='Arena da Baixada')
);
-- Match 27
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'ARG-IRN',
    '2014-06-21 13:00:00 -3:00',
    (select id from team where code='ARG'),
    (select id from team where code='IRN'),
    (select id from stadium where name='Estadio Mineirao')
);
-- Match 28
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'NGA-BIH',
    '2014-06-21 18:00:00 -4:00',
    (select id from team where code='NGA'),
    (select id from team where code='BIH'),
    (select id from stadium where name='Arena Pantanal')
);
-- Match 29
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'GER-GHA',
    '2014-06-21 16:00:00 -3:00',
    (select id from team where code='GER'),
    (select id from team where code='GHA'),
    (select id from stadium where name='Estadio Castelao')
);
-- Match 30
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'USA-POR',
    '2014-06-22 18:00:00 -4:00',
    (select id from team where code='USA'),
    (select id from team where code='POR'),
    (select id from stadium where name='Arena Amazonia')
);
-- Match 31
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'BEL-RUS',
    '2014-06-22 13:00:00 -3:00',
    (select id from team where code='BEL'),
    (select id from team where code='RUS'),
    (select id from stadium where name='Estadio do Maracana')
);
-- Match 32
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'KOR-ALG',
    '2014-06-22 16:00:00 -3:00',
    (select id from team where code='KOR'),
    (select id from team where code='ALG'),
    (select id from stadium where name='Estadio Beira-Rio')
);
-- Match 33
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'CMR-BRA',
    '2014-06-23 17:00:00 -3:00',
    (select id from team where code='CMR'),
    (select id from team where code='BRA'),
    (select id from stadium where name='Estadio Nacional')
);
-- Match 34
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'CRO-MEX',
    '2014-06-23 17:00:00 -3:00',
    (select id from team where code='CRO'),
    (select id from team where code='MEX'),
    (select id from stadium where name='Arena Pernambuco')
);
-- Match 35
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'AUS-ESP',
    '2014-06-23 13:00:00 -3:00',
    (select id from team where code='AUS'),
    (select id from team where code='ESP'),
    (select id from stadium where name='Arena da Baixada')
);
-- Match 36
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'NED-CHI',
    '2014-06-23 13:00:00 -3:00',
    (select id from team where code='NED'),
    (select id from team where code='CHI'),
    (select id from stadium where name='Arena de Sao Paulo')
);
-- Match 37
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'JPN-COL',
    '2014-06-24 16:00:00 -4:00',
    (select id from team where code='JPN'),
    (select id from team where code='COL'),
    (select id from stadium where name='Arena Pantanal')
);
-- Match 38
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'GRE-CIV',
    '2014-06-24 17:00:00 -3:00',
    (select id from team where code='GRE'),
    (select id from team where code='CIV'),
    (select id from stadium where name='Estadio Castelao')
);
-- Match 39
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'ITA-URU',
    '2014-06-24 13:00:00 -3:00',
    (select id from team where code='ITA'),
    (select id from team where code='URU'),
    (select id from stadium where name='Estadio das Dunas')
);
-- Match 40
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'CRC-ENG',
    '2014-06-24 13:00:00 -3:00',
    (select id from team where code='CRC'),
    (select id from team where code='ENG'),
    (select id from stadium where name='Estadio Mineirao')
);
-- Match 41
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'HON-SUI',
    '2014-06-25 16:00:00 -4:00',
    (select id from team where code='HON'),
    (select id from team where code='SUI'),
    (select id from stadium where name='Arena Amazonia')
);
-- Match 42
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'ECU-FRA',
    '2014-06-25 17:00:00 -3:00',
    (select id from team where code='ECU'),
    (select id from team where code='FRA'),
    (select id from stadium where name='Estadio do Maracana')
);
-- Match 43
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'NGA-ARG',
    '2014-06-25 13:00:00 -3:00',
    (select id from team where code='NGA'),
    (select id from team where code='ARG'),
    (select id from stadium where name='Estadio Beira-Rio')
);
-- Match 44
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'BIH-IRN',
    '2014-06-25 13:00:00 -3:00',
    (select id from team where code='BIH'),
    (select id from team where code='IRN'),
    (select id from stadium where name='Arena Fonte Nova')
);
-- Match 45
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'USA-GER',
    '2014-06-26 13:00:00 -3:00',
    (select id from team where code='USA'),
    (select id from team where code='GER'),
    (select id from stadium where name='Arena Pernambuco')
);
-- Match 46
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'POR-GHA',
    '2014-06-26 13:00:00 -3:00',
    (select id from team where code='POR'),
    (select id from team where code='GHA'),
    (select id from stadium where name='Estadio Nacional')
);
-- Match 47
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'KOR-BEL',
    '2014-06-26 17:00:00 -3:00',
    (select id from team where code='KOR'),
    (select id from team where code='BEL'),
    (select id from stadium where name='Arena de Sao Paulo')
);
-- Match 48
insert into match(code, date, team_id1, team_id2, stadium_id) values (
    'ALG-RUS',
    '2014-06-26 17:00:00 -3:00',
    (select id from team where code='ALG'),
    (select id from team where code='RUS'),
    (select id from stadium where name='Arena da Baixada')
);

-- Field position
drop table if exists field_position cascade;
create table field_position (
    id serial PRIMARY KEY,
    name varchar(50)
);
insert into field_position(name) values('Goalkeeper');
insert into field_position(name) values('Defender');
insert into field_position(name) values('Midfielder');
insert into field_position(name) values('Forward');
insert into field_position(name) values('Coach');

-- Source
drop table if exists source cascade;
create table source (
    id serial PRIMARY KEY,
    name varchar(20)
);
insert into source(name) values('twitter');
insert into source(name) values('facebook');

