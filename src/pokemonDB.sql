REM   Script: PokemonTrainerAPP_DB
REM   A database for trainers

CREATE SEQUENCE ID_trainer_seq START WITH 1;

CREATE TABLE Trainer( 
    ID INTEGER DEFAULT ID_trainer_seq.NEXTVAL NOT NULL, 
    name VARCHAR(15) NOT NULL, 
    PRIMARY KEY(ID) 
);

CREATE SEQUENCE ID_region_seq START WITH 1;

CREATE TABLE Region( 
    ID INTEGER DEFAULT ID_region_seq.NEXTVAL NOT NULL, 
    name VARCHAR(20) NOT NULL, 
    PRIMARY KEY(ID) 
);

CREATE SEQUENCE ID_type_seq START WITH 1;

CREATE TABLE Type( 
    ID INTEGER DEFAULT ID_type_seq.NEXTVAL NOT NULL, 
    name VARCHAR(15) NOT NULL, 
    PRIMARY KEY(ID) 
);

CREATE SEQUENCE ID_wekandstr_seq START WITH 1;

CREATE TABLE Weaknesses_and_strengths( 
  	ID INTEGER DEFAULT ID_wekandstr_seq.NEXTVAL NOT NULL, 
    type_main INTEGER NOT NULL, 
    type_related INTEGER NOT NULL, 
    damage_mult_to FLOAT(2) NOT NULL, 
    damage_mult_from FLOAT(2) NOT NULL, 
    PRIMARY KEY(ID), 
    FOREIGN KEY(type_main) REFERENCES Type(id), 
    FOREIGN KEY(type_related) REFERENCES Type(id) 
);

CREATE TABLE Pokedex( 
  	ID INTEGER NOT NULL, 
	name VARCHAR(15) NOT NULL, 
    region INTEGER NOT NULL, 
    PRIMARY KEY(ID), 
    FOREIGN KEY(region) REFERENCES Region(ID) 
);

CREATE SEQUENCE ID_pokemon_seq START WITH 1;

CREATE TABLE Pokemon( 
    ID INTEGER DEFAULT ID_pokemon_seq.NEXTVAL NOT NULL, 
    nickname VARCHAR(15) NOT NULL, 
    trainer INTEGER NOT NULL, 
    pokedex_entry INTEGER NOT NULL, 
    PRIMARY KEY(ID), 
    FOREIGN KEY(trainer) REFERENCES Trainer(ID), 
    FOREIGN KEY(pokedex_entry) REFERENCES Pokedex(ID) 
);

CREATE SEQUENCE ID_move_seq START WITH 1;

CREATE TABLE Move( 
    ID INTEGER DEFAULT ID_move_seq.NEXTVAL NOT NULL, 
    name VARCHAR(25) NOT NULL, 
    power INTEGER NOT NULL, 
    accuracy INTEGER, 
    type INTEGER NOT NULL, 
    PRIMARY KEY(ID), 
    FOREIGN KEY(type) REFERENCES Type(ID) 
);

CREATE TABLE Have_type( 
    pokemon_pokedex_no INTEGER NOT NULL, 
    type INTEGER NOT NULL, 
    FOREIGN KEY(pokemon_pokedex_no) REFERENCES Pokedex(ID), 
    FOREIGN KEY(type) REFERENCES Type(ID) 
);

CREATE TABLE Uses( 
    pokemon INTEGER NOT NULL, 
    move INTEGER NOT NULL, 
    FOREIGN KEY(pokemon) REFERENCES Pokemon(ID), 
    FOREIGN KEY(move) REFERENCES Move(ID) 
);

