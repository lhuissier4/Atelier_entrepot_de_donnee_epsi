CREATE TABLE IF NOT EXISTS LOBBY_STATS_PLAYER (
    idLobbyGame      BIGINT ,

    idPlayer         BIGINT NOT NULL,
    idRoom           BIGINT NOT NULL,

    qtKill           INTEGER NOT NULL,
    qtAssist         INTEGER NOT NULL,
    qtDeath          INTEGER NOT NULL,
    qtHs             INTEGER NOT NULL,

    qtBombeDefuse    INTEGER NOT NULL,
    qtBombePlant     INTEGER NOT NULL,

    qtTk             INTEGER NOT NULL,
    qtTkAssist       INTEGER NOT NULL,

    qt1Kill          INTEGER NOT NULL,
    qt2Kill          INTEGER NOT NULL,
    qt3Kill          INTEGER NOT NULL,
    qt4Kill          INTEGER NOT NULL,
    qt5Kill          INTEGER NOT NULL,
    qtPlusKill       INTEGER NOT NULL,

    qtFirstKill      INTEGER NOT NULL,

    vlDamage         INTEGER NOT NULL,
    qtHits           INTEGER NOT NULL,
    qtShots          INTEGER NOT NULL,

    qtLastAlive      INTEGER NOT NULL,
    qtClutchWon      INTEGER NOT NULL,
    qtRoundsPlayed   INTEGER NOT NULL,
    idDescMapName    BIGINT NOT NULL,
    vlLevel          INTEGER NOT NULL,

    qtSurvived       INTEGER NOT NULL,
    qtTrade          INTEGER NOT NULL,
    qtFlashAssist    INTEGER NOT NULL,

    qtHitHeadshot    INTEGER NOT NULL,
    qtHitChest       INTEGER NOT NULL,
    qtHitStomach     INTEGER NOT NULL,
    qtHitLeftArm     INTEGER NOT NULL,

    qtHitRightArm    INTEGER NOT NULL,
    qtHitLeftLeg     INTEGER NOT NULL,
    qtHitRightLeg    INTEGER NOT NULL,

    flWinner         BOOLEAN NOT NULL,
    dtCreatedAt      TIMESTAMP NOT NULL,

    CONSTRAINT fk_lobby_player
        FOREIGN KEY (idPlayer)
        REFERENCES PLAYERS(id),

    CONSTRAINT uq_room_player
        PRIMARY KEY (idRoom, idPlayer)
);
