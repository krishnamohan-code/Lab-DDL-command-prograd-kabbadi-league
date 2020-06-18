-- PROGRESSION - 1


-- 1. **Create table city**
CREATE TABLE city
(  id int ,
   name varchar(50) NOT NULL,
   primary key (id)
  );

-- 2. **Create table referee**
    CREATE TABLE referee
    (
       id int,
       name varchar(50) NOT NULL,
       primary key (id)
    );
-- 3. **Create table innings**
         CREATE TABLE innings
         (
             id int,
             innings_numner int not null
         );
       
-- 4. **Create table extra_type**
      CREATE TABLE extra_type
      (
        id int,
        name varchar(50) not null,
        primary key(id)
      );
-- 5. **Create table skill**
    CREATE TABLE skill
      (
        id int,
        name varchar(50) not null,
        primary key(id)
      );
-- 6. **Create table team**
       CREATE TABLE team
      (
        id int,
        name varchar(50) not null,
        coach varchar(50),
        home_city int,
        primary key(id)
      );
-- 7. **Create table player**
      CREATE TABLE player
      (
        id int,
        name varchar(50) not null,
        country varchar(50) not null,
        skill_id int not null,
        constraint forkey_skill foreign key (skill_id) references skill(id),
        team_id int not null,
        primary key(id)
      );
-- 8. **Create table venue**
      CREATE TABLE venue
      (
            id int ,
            stadium_name varchar(50) not null,
            city_id int not null,
            constraint forkey_venue foreign key (city_id) references city(id),
            primary key(id)
      );
-- 9. **Create table event**
    CREATE TABLE event
    (
       id int,
       innings_id int not null,
       constraint forkey_event foreign key (innings_id) references innings(id),
       event_no int not null,
       raider_id int not null,
       raid_points int not null ,
       defending_points int not null,
       clock_in_seconds int not null,
       team_one_score int not null,
       team_two_score int not null,
       primary key(id)
    );
-- 10. **Create table extra_event**
   CREATE TABLE extra_event
   (
     id int,
     event_id int not null,
     constraint forkey_event_id foreign key (event_id) references event(id),
     extra_type_id int not null,
     constraint forkey_event_type foreign key (extra_type_id) references extra_type(id),
     points int not null,
     scoring_team_id int not null,
     constraint forkey_event_score foreign key (scoring_team_id) references team(id),
     primary key(id)
   );
-- 11. **Create table outcome**
          CREATE TABLE outcome
          (
             id int,
             status varchar(100) not null,
             winner_team_id int,
             constraints forkey_winner foreign key (winner_team_id) references team(id),
             score int,
             player_of_match int,
             constraints forkey_match foreign key (player_of_match) references player(id),
             primary key(id)
          );
-- 12. **Create table game**
CREATE TABLE game
(
   id int,
   game_data DATE not null,
   team_id_1 int not null,
   constraint forkey_team1 foreign key (team_id_1) references team(id),
   team_id_2 int not null,
   constraint forkey_team2 foreign key (team_id_2) references team(id),
   venue_id int not null,
   constraint forkey_venu foreign key (venu_id) references venue(id),
   outcome_id int not null;
   constraint forkey_outcome foreign key (outcome_id) references outcome(id),
   referee_id_1 int not null,
   constraint forkey_id1 foreign key (referee_id_1) references referee(id),
   referee_id_2 int not null,
   constraint forkey_id2 foreign key (referee_id_2) references referee(id),
   first_innings_id int not null,
   constraint forkey_inn1 foreign key (first_innings_id) references innings(id),
   second_innings_id int not null,
   constraint forkey_inn2 foreign key (Second_innings_id) references innings(id)
);
-- 13. **Drop table city**
       DROP TABLE city;
-- 14. **Drop table innings**
       DROP TABLE innings;
-- 15. **Drop table skill**
   DROP TABLE skill;
-- 16. **Drop table extra_type**
     DROP TABLE extra_type;