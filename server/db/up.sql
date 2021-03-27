CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE Users(
    id UUID NOT NULL PRIMARY KEY UNIQUE DEFAULT uuid_generate_v4(),
    photoUrl TEXT,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    TYPE TEXT NOT NULL,
);

CREATE TABLE OFFER(
    id UUID NOT NULL PRIMARY KEY UNIQUE DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    photoUrl TEXT,
    usesLeft NUMBER DEFAULT 0,
    frontlineWorkers BOOLEAN DEFAULT TRUE,
    vacinnated BOOLEAN DEFAULT TRUE,
    volunteers BOOLEAN DEFAULT TRUE
);