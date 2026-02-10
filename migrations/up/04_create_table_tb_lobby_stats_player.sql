CREATE TABLE IF NOT EXISTS LOBBY_STATS_PLAYER (
    idLobbyGame      BIGINT PRIMARY KEY,

    idPlayer         BIGINT NOT NULL,
    idRoom           BIGINT NOT NULL,

    qtKill           INTEGER,
    qtAssist         INTEGER,
    qtDeath          INTEGER,
    qtHs             INTEGER,

    qtBombeDefuse    INTEGER,
    qtBombePlant     INTEGER,

    qtTk             INTEGER,
    qtTkAssist       INTEGER,

    qt1Kill          INTEGER,
    qt2Kill          INTEGER,
    qt3Kill          INTEGER,
    qt4Kill          INTEGER,
    qt5Kill          INTEGER,
    qtPlusKill       INTEGER,

    qtFirstKill      INTEGER,

    vlDamage         INTEGER,
    qtHits           INTEGER,
    qtShots          INTEGER,

    qtLastAlive      INTEGER,
    qtClutchWon      INTEGER,
    qtRoundsPlayed   INTEGER,
    descMapName      VARCHAR(30),
    vlLevel          INTEGER,

    qtSurvived       INTEGER,
    qtTrade          INTEGER,
    qtFlashAssist    INTEGER,

    qtHitHeadshot    INTEGER,
    qtHitChest       INTEGER,
    qtHitStomach     INTEGER,
    qtHitLeftArm     INTEGER,

    qtHitRightArm    INTEGER,
    qtHitLeftLeg     INTEGER,
    qtHitRightLeg    INTEGER,

    flWinner         BOOLEAN,
    dtCreatedAt      TIMESTAMP,

    CONSTRAINT fk_lobby_player
        FOREIGN KEY (idPlayer)
        REFERENCES PLAYERS(idPlayer),

    CONSTRAINT uq_room_player
        UNIQUE (idRoom, idPlayer)
);
