-- Fact table for players
drop table if exists fact_player cascade;
create table fact_player (
    id serial PRIMARY KEY,
    source_id int references source,
    post_id varchar(32) not null,
    link varchar(150) null,
    user_id varchar(100) not null,
    content varchar(1000) not null,
    player_id int references players not null,
    sentiment int not null
);

-- Fact table for teams
drop table if exists fact_team cascade;
create table fact_team (
    id serial PRIMARY KEY,
    source_id int references source,
    post_id varchar(32) not null,
    link varchar(150) null,
    user_id varchar(100) not null,
    content varchar(1000) not null,
    team_id int references team not null,
    sentiment int not null
);

-- Fact table for trending topics

