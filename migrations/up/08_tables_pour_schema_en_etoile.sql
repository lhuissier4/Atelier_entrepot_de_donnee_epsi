-- =========================
-- DIMENSIONS
-- =========================

CREATE TABLE IF NOT EXISTS Dim_Player (
    idPlayer BIGINT PRIMARY KEY,
    descCountry VARCHAR(100),
    dtBirth DATE,
    dtRegistration TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Dim_Medal (
    idMedal BIGINT PRIMARY KEY,
    descMedal VARCHAR(100),
    descTypeMedal VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Dim_Map (
    idMap BIGINT PRIMARY KEY,
    descMapName VARCHAR(100) UNIQUE
);

CREATE TABLE IF NOT EXISTS Dim_Time (
    idTime BIGINT PRIMARY KEY,
    fullDate DATE UNIQUE,
    year INTEGER,
    month INTEGER,
    day INTEGER,
    isWeekend BOOLEAN
);

-- =========================
-- POPULATION DIM_TIME
-- =========================

INSERT INTO Dim_Time
SELECT
    ROW_NUMBER() OVER () AS idTime,
    date_series AS fullDate,
    EXTRACT(YEAR FROM date_series) AS year,
    EXTRACT(MONTH FROM date_series) AS month,
    EXTRACT(DAY FROM date_series) AS day,
    CASE
        WHEN EXTRACT(DOW FROM date_series) IN (0,6) THEN TRUE
        ELSE FALSE
    END AS isWeekend
FROM generate_series(
        DATE '2023-01-01',
        DATE '2026-12-31',
        INTERVAL 1 DAY
     ) AS t(date_series);

CREATE TABLE IF NOT EXISTS Fact_Lobby_Stats (
    idPlayer BIGINT NOT NULL,
    idMap BIGINT NOT NULL,
    idTime BIGINT NOT NULL,
    qtKill INTEGER,
    qtAssist INTEGER,
    qtDeath INTEGER,
    vlDamage DOUBLE,
    flWinner BOOLEAN,
    qtRoundsPlayed INTEGER,
    PRIMARY KEY (idPlayer, idMap, idTime),
    FOREIGN KEY (idPlayer) REFERENCES Dim_Player(idPlayer),
    FOREIGN KEY (idMap) REFERENCES Dim_Map(idMap),
    FOREIGN KEY (idTime) REFERENCES Dim_Time(idTime)
);

CREATE TABLE IF NOT EXISTS Fact_Player_Medals (
    idPlayer BIGINT NOT NULL,
    idMedal BIGINT NOT NULL,
    idTime BIGINT NOT NULL,
    flActive BOOLEAN,
    PRIMARY KEY (idPlayer, idMedal, idTime),
    FOREIGN KEY (idPlayer) REFERENCES Dim_Player(idPlayer),
    FOREIGN KEY (idMedal) REFERENCES Dim_Medal(idMedal),
    FOREIGN KEY (idTime) REFERENCES Dim_Time(idTime)
);

