-- Fact table for players
drop table if exists fact_player cascade;
create table fact_player (
    id serial PRIMARY KEY,
    source_id int references source,
    post_id int not null,
    link varchar(1000) null,
    user_id varchar(100) not null,
    content varchar(200) not null,
    player_id int references players not null,
    sentiment int not null
);

-- Fact table for teams

-- Fact table for trending topics

-- Stats table for players

-- Stats table for teams

-- Stats table for trending topics


