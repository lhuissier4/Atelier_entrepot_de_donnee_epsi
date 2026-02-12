- Dimension Joueur
CREATE TABLE IF NOT EXISTS Dim_Player (
idPlayer SERIAL PRIMARY KEY,
descCountry VARCHAR(100),
dtBirth DATE,
dtRegistration DATE
);



- - Dimension Médaille
CREATE TABLE IF NOT EXISTS Dim_Medal (
idMedal SERIAL PRIMARY KEY,
descMedal VARCHAR(100),
descTypeMedal VARCHAR(50)
);



- - Dimension Map
CREATE TABLE IF NOT EXISTS Dim_Map (
idMap SERIAL PRIMARY KEY,
descMapName VARCHAR(100) UNIQUE
);



- - Dimension Temps
CREATE TABLE IF NOT EXISTS Dim_Time (
idTime SERIAL PRIMARY KEY,
fullDate DATE UNIQUE,
year INT,
month INT,
day INT,
isWeekend BOOLEAN
);




INSERT INTO Dim_Time (fullDate, year, month, day, isWeekend)
SELECT
date_series AS fullDate,
EXTRACT(YEAR FROM date_series) AS year,
EXTRACT(MONTH FROM date_series) AS month,
EXTRACT(DAY FROM date_series) AS day,
CASE
WHEN EXTRACT(DOW FROM date_series) IN (0,6) THEN TRUE
ELSE FALSE
END AS isWeekend
FROM generate_series('2023-01-01'::DATE, '2026-12-31'::DATE, '1 day') AS date_series
ON CONFLICT (fullDate) DO NOTHING;


- - Fait des stats des matchs
CREATE TABLE IF NOT EXISTS Fact_Lobby_Stats (
id SERIAL PRIMARY KEY,
idPlayer INT NOT NULL,
idMap INT NOT NULL,
idTime INT NOT NULL,
qtKill INT,
qtAssist INT,
qtDeath INT,
vlDamage FLOAT,
flWinner BOOLEAN,
qtRoundsPlayed INT,
FOREIGN KEY (idPlayer) REFERENCES Dim_Player(idPlayer),
FOREIGN KEY (idMap) REFERENCES Dim_Map(idMap),
FOREIGN KEY (idTime) REFERENCES Dim_Time(idTime)
);


- - Fait des médailles
CREATE TABLE IF NOT EXISTS Fact_Player_Medals (
id SERIAL PRIMARY KEY,
idPlayer INT NOT NULL,
idMedal INT NOT NULL,
idTime INT NOT NULL,
flActive BOOLEAN,
FOREIGN KEY (idPlayer) REFERENCES Dim_Player(idPlayer),
FOREIGN KEY (idMedal) REFERENCES Dim_Medal(idMedal),
FOREIGN KEY (idTime) REFERENCES Dim_Time(idTime)
);