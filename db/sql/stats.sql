-- Stats
create table stats_players (
    player_id int references players,
    team_id int references team,
    type varchar(10) not null,
    sentiment double precision
);

create table stats_teams (
    team_id int references team,
    sentiment double precision
);
