CREATE TABLE IF NOT EXISTS PLAYERS_MEDALHA (
    id BIGINT PRIMARY KEY,
    idPlayer   BIGINT NOT NULL,
    idMedal    BIGINT NOT NULL,
    dtCreatedAt TIMESTAMP NOT NULL,
    dtExpiration TIMESTAMP NOT NULL,
    dtRemove TIMESTAMP NOT NULL,
    flActive BOOLEAN NOT NULL,

    CONSTRAINT pk_players_medals
        PRIMARY KEY (idPlayer, idMedal),

    CONSTRAINT fk_pm_player
        FOREIGN KEY (idPlayer)
        REFERENCES PLAYERS(id),

    CONSTRAINT fk_pm_medal
        FOREIGN KEY (idMedal)
        REFERENCES MEDALHA(idMedal)
);
