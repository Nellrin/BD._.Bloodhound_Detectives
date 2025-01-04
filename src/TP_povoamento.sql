-- Universidade do Minho
-- Engenharia Informática
-- Bases de Dados, 2023-2024
-- Linguagem SQL
-- Povoamento das tabelas

-- Implementação do Sistemas de Bases de Dados para o caso de estudo "Agência de Detetives"
-- MAY 2024
-- Grupo 27

USE agencia ;

-- Povoamento da Base de Dados ----------------------------------------------------------------------------------------------------------------

-- Inserçao de Detetives ----------------------------------------------------------------------------------------------------------------------

INSERT INTO Detetive (Nome, Telemovel_Profissional, Distrito, Localidade, Rua, CodPost) 
VALUES ('Seeley Booth', '964538291', 'Greater London', 'London', 'New Scotland Yard, Victoria Embankment', '3806173');
-- Seeley Booth - id == 1

INSERT INTO Detetive (Nome, Telemovel_Profissional, Distrito, Localidade, Rua, CodPost) 
VALUES ('Temperance Brennan', '963829184', 'Greater London', 'London', 'Imperial College London, South Kensington Campus', '43004953');
-- Temperance Brennan - id == 2



-- Caso 1 -------------------------------------------------------------------------------------------------------------------------------------

-- Cliente Caso 1
INSERT INTO Cliente (Nome, Distrito, Localidade, Rua, CodPost, EMAIL) 
VALUES ('Paul Williams', 'Greater London', 'London', 'Baker Street', '4471983', 'paul.williams@example.com');
SET @ID_ClienteCaso1 = LAST_INSERT_ID();

-- Caso 1
INSERT INTO Caso (Estado, DtTimeRegisto, DtTimeFecho, ID_Cliente) 
VALUES ('Concluido', '2007-11-14 09:20:00', '2007-11-20 16:40:00', @ID_ClienteCaso1);
SET @ID_Caso = LAST_INSERT_ID();

-- Vitima(s) Caso 1
INSERT INTO Vitima (Local_encontrada, Nome, Filiacao, Idade, Sexo, Etnia, Ocupacao, Peso, Altura, Caso_ID) 
VALUES ('London, UK, high school time capsule', 'Roger Dillon', NULL, 17, 'M', 'Caucasian', 'High School Student', 170, 178, @ID_Caso);
SET @ID_Vitima = LAST_INSERT_ID();

-- Suspeito(s) Caso 1
INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'High School Bully', 0, 'Gil Bates', NULL, 'Greater London', "London", 'Church Lane', '4784440', @ID_Caso);
SET @ID_Suspeito1Caso1 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'High School Outcast', 0, 'Andrew Riggs', NULL, 'Greater London', 'London', 'Kingsway', '3673639', @ID_Caso);
SET @ID_Suspeito2Caso1 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'High School Friend', 1, 'Willie Sanderson', NULL, 'Greater London', 'London', 'School Lane', '3713424', @ID_Caso);
SET @ID_Suspeito3Caso1 = LAST_INSERT_ID();

-- Evidencia(s) Caso 1
INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('high school time capsule', 'Skeletal remains with blunt force trauma to the skull', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('high school time capsule', 'Belt buckle belonging to Roger Dillon', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('high school time capsule', 'Various items placed by high school students 20 years ago', 'acontecimento', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('high school time capsule', 'Yearbook photos and notes providing social dynamics', 'texto', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('crime scene', 'Physics award trophy used as the murder weapon', 'arma', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('high school time capsule', 'Love letters indicating a secret relationship', 'texto', @ID_Caso);

-- Detetive(s) Caso 1
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (1, @ID_Caso);
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (2, @ID_Caso);

-- Interrogaçao(oes) Caso 1
INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Gil Bates admitted to bullying Roger but denied involvement in his murder.', '2007-11-15 10:00:00', 1, @ID_Suspeito1Caso1);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Andrew Riggs expressed resentment towards Roger but had no alibi for the night of the murder.', '2007-11-16 14:00:00', 1, @ID_Suspeito2Caso1);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Willie Sanderson confessed to killing Roger in a fit of rage over a personal matter.', '2007-11-18 11:00:00', 1, @ID_Suspeito3Caso1);



-- Caso 2 ----------------------------------------------------------------------------------------------------------------------------------

-- Cliente Caso 2
INSERT INTO Cliente (Nome, Distrito, Localidade, Rua, CodPost, EMAIL) 
VALUES ('Emily Johnson', 'Greater London', 'London', 'Strand', '3400703', 'emily.johnson@example.com');
SET @ID_ClienteCaso2 = LAST_INSERT_ID();

-- Caso 2
INSERT INTO Caso (Estado, DtTimeRegisto, DtTimeFecho, ID_Cliente) 
VALUES ('Concluido', '2005-09-03 00:00:00', '2005-09-13 00:00:00', @ID_ClienteCaso2);
SET @ID_Caso = LAST_INSERT_ID();

-- Vitima(s) Caso 2
INSERT INTO Vitima (Local_encontrada, Nome, Idade, Sexo, Etnia, Peso, Altura, Caso_ID) 
VALUES ('Construction site at Arlington National Cemetery', 'Cleo Louise Eller', 25, 'F', 'Caucasian', 54, 170, @ID_Caso);

-- Suspeito(s) Caso 2
INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Senator', 0, 'Ken Thompson', NULL, 'Greater London', 'London', 'Kings Road', '3739653', @ID_Caso);
SET @ID_Suspeito1Caso2 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Stalker', 0, 'Oliver Laurier', NULL, 'Greater London', 'London', 'London Road', '3600327', @ID_Caso);
SET @ID_Suspeito2Caso2 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Boyfriend and Campaign Worker', 1, 'Carl Decker', NULL, 'Greater London', 'London', 'Queensway', '4068874', @ID_Caso);
SET @ID_Suspeito3Caso2 = LAST_INSERT_ID();

-- Evidencia(s) Caso 2
INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Skeletal remains with evidence of blunt force trauma', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Apartment', 'Personal diary of Cleo Louise Eller', 'texto', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Fingerprint on victim\'s belongings', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Senator\'s Office', 'Email correspondence between victim and Senator Thompson', 'texto', @ID_Caso);



-- Caso 3 -------------------------------------------------------------------------------------------------------------------------------------

-- Cliente Caso 3
INSERT INTO Cliente (Nome, Distrito, Localidade, Rua, CodPost, EMAIL) 
VALUES ('Sarah Thompson', 'Greater London', 'London', 'Exhibition Rd', '4264646', 'sarah.thompson@example.com');
SET @ID_ClienteCaso3 = LAST_INSERT_ID();

-- Caso 3
INSERT INTO Caso (Estado, DtTimeRegisto, DtTimeFecho, ID_Cliente) 
VALUES ('Concluido', '2005-09-27 09:20:00', '2005-10-04 16:40:00', @ID_ClienteCaso3);
SET @ID_Caso = LAST_INSERT_ID();

-- Vitima(s) Caso 3
INSERT INTO Vitima (Local_encontrada, Nome, Filiacao, Idade, Sexo, Etnia, Ocupacao, Peso, Altura, Caso_ID) 
VALUES ('Buried near a construction site, London', 'Cleo Louise Eller', NULL, 25, 'F', 'Caucasian', 'Political Intern', 54, 170, @ID_Caso);
SET @ID_Vitima = LAST_INSERT_ID();

-- Suspeito(s) Caso 3
INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Boyfriend', 0, 'Ken Thompson', NULL, 'Greater London', 'London', 'Baker Street', '3957247', @ID_Caso);
SET @ID_Suspeito1Caso3 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Political Figure', 0, 'Senator Bethlehem', NULL, 'Greater London', 'London', 'Parliament Square', '4316239', @ID_Caso);
SET @ID_Suspeito2Caso3 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Stalker', 1, 'Oliver Laurier', NULL, 'Greater London', 'London', 'Fleet Street', '4461559', @ID_Caso);
SET @ID_Suspeito3Caso3 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Colleague', 0, 'Hillary Gilmore', NULL, 'Greater London', 'London', 'Whitehall', '4537358', @ID_Caso);
SET @ID_Suspeito4Caso3 = LAST_INSERT_ID();

-- Evidencia(s) Caso 3
INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Skeletal remains found buried', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Home', 'Journal with personal notes and contacts', 'texto', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Soil samples matching construction site', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Office', 'Work emails indicating stress and threats', 'texto', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Car', 'Bloodstains matching Cleo\'s DNA', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Cleo\'s broken necklace', 'fisico', @ID_Caso);

-- Detetive(s) Caso 3
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (1, @ID_Caso);
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (2, @ID_Caso);

-- Interrogaçao(oes) Caso 3
INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Ken Thompson expressed deep sadness over Cleo\'s death but provided a solid alibi.', '2005-09-28 10:00:00', 1, @ID_Suspeito1Caso3);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Senator Bethlehem denied any romantic involvement and claimed political enemies set him up.', '2005-09-29 14:00:00', 1, @ID_Suspeito2Caso3);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Oliver Laurier confessed to stalking and acontecimentoually killing Cleo due to unrequited love.', '2005-10-02 11:00:00', 1, @ID_Suspeito3Caso3);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Hillary Gilmore provided crucial information about Cleo\'s work environment and potential threats.', '2005-09-30 11:00:00', 1, @ID_Suspeito4Caso3);



-- Caso 4 -------------------------------------------------------------------------------------------------------------------------------------

-- Cliente Caso 4
INSERT INTO Cliente (Nome, Distrito, Localidade, Rua, CodPost, EMAIL) 
VALUES ('Michael Davies', 'Greater London', 'London', 'Houghton St', '4067755', 'michael.davies@example.com');
SET @ID_ClienteCaso4 = LAST_INSERT_ID();

-- Caso 4
INSERT INTO Caso (Estado, DtTimeRegisto, DtTimeFecho, ID_Cliente) 
VALUES ('Concluido', '2005-10-04 09:20:00', '2005-10-11 16:40:00', @ID_ClienteCaso4);
SET @ID_Caso = LAST_INSERT_ID();

-- Vitima(s) Caso 4
INSERT INTO Vitima (Local_encontrada, Nome, Filiacao, Idade, Sexo, Etnia, Ocupacao, Peso, Altura, Caso_ID) 
VALUES ('Thames River, London', 'Charlie Sanders', NULL, 38, 'M', 'Caucasian', 'Fisherman', 85, 182, @ID_Caso);
SET @ID_Vitima = LAST_INSERT_ID();

-- Suspeito(s) Caso 4
INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Business Rival', 0, 'Jack Turner', NULL, 'Greater London', 'London', 'Westminster Bridge Road', '4659287', @ID_Caso);
SET @ID_Suspeito1Caso4 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Friend', 0, 'Liam Murphy', NULL, 'Greater London', 'London', 'Tower Hill', '3156805', @ID_Caso);
SET @ID_Suspeito2Caso4 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Acquaintance', 1, 'Tommy Baker', NULL, 'Greater London', 'London', 'Southwark Street', '4443108', @ID_Caso);
SET @ID_Suspeito3Caso4 = LAST_INSERT_ID();

-- Evidencia(s) Caso 4
INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Skeletal remains found in the Thames River', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Boat', 'Fishing gear with bloodstains', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Wallet with ID belonging to Charlie Sanders', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Home', 'Threatening letters from a rival fisherman', 'texto', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Rope used to tie weights to the body', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Broken watch matching victim\'s description', 'fisico', @ID_Caso);

-- Detetive(s) Caso 4
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (1, @ID_Caso);
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (2, @ID_Caso);

-- Interrogaçao(oes) Caso 4
INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Jack Turner denied involvement and provided an alibi for the night of the murder.', '2005-10-05 10:00:00', 1, @ID_Suspeito1Caso4);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Liam Murphy shared information about Charlie\'s recent arguments with others.', '2005-10-06 14:00:00', 1, @ID_Suspeito2Caso4);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Tommy Baker acontecimentoually confessed to the murder due to a business dispute.', '2005-10-08 11:00:00', 1, @ID_Suspeito3Caso4);



-- Caso 5 -------------------------------------------------------------------------------------------------------------------------------------

-- Cliente Caso 5
INSERT INTO Cliente (Nome, Distrito, Localidade, Rua, CodPost, EMAIL) 
VALUES ('Sophie Evans', 'Greater London', 'London', 'Cromwell Rd', '3531756', 'sophie.evans@example.com');
SET @ID_ClienteCaso5 = LAST_INSERT_ID();

-- Caso 5
INSERT INTO Caso (Estado, DtTimeRegisto, DtTimeFecho, ID_Cliente) 
VALUES ('Concluido', '2005-10-11 09:20:00', '2005-10-18 16:40:00', @ID_ClienteCaso5);
SET @ID_Caso = LAST_INSERT_ID();

-- Vitima(s) Caso 5
INSERT INTO Vitima (Local_encontrada, Nome, Filiacao, Idade, Sexo, Etnia, Ocupacao, Peso, Altura, Caso_ID) 
VALUES ('Wilderness area near London', 'Jason Harris', NULL, 45, 'M', 'Caucasian', 'Hiker', 80, 180, @ID_Caso);
SET @ID_Vitima = LAST_INSERT_ID();

-- Suspeito(s) Caso 5
INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Fellow Hiker', 0, 'Alex Parker', NULL, 'Greater London', 'London', 'Greenwich Park', '3898221', @ID_Caso);
SET @ID_Suspeito1Caso5 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Stranger', 0, 'Morgan Blake', NULL, 'Greater London', 'London', 'Hyde Park', '3703701', @ID_Caso);
SET @ID_Suspeito2Caso5 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Acquaintance', 1, 'Brian Turner', NULL, 'Greater London', 'London', 'Kensington Gardens', '3225773', @ID_Caso);
SET @ID_Suspeito3Caso5 = LAST_INSERT_ID();

-- Evidencia(s) Caso 5
INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Skeletal remains found in a shallow grave', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Tent', 'Hiking gear with bloodstains', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Backpack with ID belonging to Jason Harris', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Home', 'Threatening emails from a known associate', 'texto', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Knife with fingerprints', 'arma', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Broken compass matching victim\'s gear', 'fisico', @ID_Caso);

-- Detetive(s) Caso 5
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (1, @ID_Caso);
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (2, @ID_Caso);

-- Interrogaçao(oes) Caso 5
INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Alex Parker denied any involvement and mentioned seeing someone suspicious.', '2005-10-12 10:00:00', 1, @ID_Suspeito1Caso5);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Morgan Blake had no recollection of the acontecimento but was seen near the crime scene.', '2005-10-13 14:00:00', 1, @ID_Suspeito2Caso5);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Brian Turner confessed to killing Jason in a fit of rage over a personal dispute.', '2005-10-15 11:00:00', 1, @ID_Suspeito3Caso5);



-- Caso 6 -------------------------------------------------------------------------------------------------------------------------------------

-- Cliente Caso 6
INSERT INTO Cliente (Nome, Distrito, Localidade, Rua, CodPost, EMAIL) 
VALUES ('David Clark', 'Greater London', 'London', 'Great Russell St', '4994614', 'david.clark@example.com');
SET @ID_ClienteCaso6 = LAST_INSERT_ID();

-- Caso 6
INSERT INTO Caso (Estado, DtTimeRegisto, DtTimeFecho, ID_Cliente) 
VALUES ('Concluido', '2005-10-18 09:20:00', '2005-10-25 16:40:00', @ID_ClienteCaso6);
SET @ID_Caso = LAST_INSERT_ID();

-- Vitima(s) Caso 6
INSERT INTO Vitima (Local_encontrada, Nome, Filiacao, Idade, Sexo, Etnia, Ocupacao, Peso, Altura, Caso_ID) 
VALUES ('Construction site in London', 'John Doe', NULL, 50, 'M', 'Caucasian', 'Construction Worker', 90, 175, @ID_Caso);
SET @ID_Vitima = LAST_INSERT_ID();

-- Suspeito(s) Caso 6
INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Co-worker', 0, 'Mike Collins', NULL, 'Greater London', 'London', 'Old Kent Road', '3622804', @ID_Caso);
SET @ID_Suspeito1Caso6 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Supervisor', 0, 'Tom Adams', NULL, 'Greater London', 'London', 'Euston Road', '3473972', @ID_Caso);
SET @ID_Suspeito2Caso6 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Rival Worker', 1, 'Jack Hill', NULL, 'Greater London', 'London', 'Oxford Street', '4094637', @ID_Caso);
SET @ID_Suspeito3Caso6 = LAST_INSERT_ID();

-- Evidencia(s) Caso 6
INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Construction Site', 'Skeletal remains found in the foundation of a building', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Locker', 'Personal belongings of the victim', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Construction Site', 'Hard hat with bloodstains', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Home', 'Threatening letters from a rival worker', 'texto', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Construction Site', 'Wrench with fingerprints', 'arma', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Construction Site', 'Boot prints matching victim\'s shoes', 'fisico', @ID_Caso);

-- Detetive(s) Caso 6
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (1, @ID_Caso);
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (2, @ID_Caso);

-- Interrogaçao(oes) Caso 6
INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Mike Collins denied any involvement and mentioned working late that night.', '2005-10-19 10:00:00', 1, @ID_Suspeito1Caso6);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Tom Adams shared information about recent disputes at the construction site.', '2005-10-20 14:00:00', 1, @ID_Suspeito2Caso6);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Jack Hill confessed to killing John Doe over a job promotion dispute.', '2005-10-22 11:00:00', 1, @ID_Suspeito3Caso6);



-- Caso 7 -------------------------------------------------------------------------------------------------------------------------------------

-- Cliente Caso 7
INSERT INTO Cliente (Nome, Distrito, Localidade, Rua, CodPost, EMAIL) 
VALUES ('Emma Walker', 'Greater London', 'London', 'Bow St', '4663918', 'emma.walker@example.com');
SET @ID_ClienteCaso7 = LAST_INSERT_ID();

-- Caso 7
INSERT INTO Caso (Estado, DtTimeRegisto, DtTimeFecho, ID_Cliente) 
VALUES ('Concluido', '2005-10-25 09:20:00', '2005-11-01 16:40:00', @ID_ClienteCaso7);
SET @ID_Caso = LAST_INSERT_ID();

-- Vitima(s) Caso 7
INSERT INTO Vitima (Local_encontrada, Nome, Filiacao, Idade, Sexo, Etnia, Ocupacao, Peso, Altura, Caso_ID) 
VALUES ('Thames River near London Bridge', 'Sara Johnson', NULL, 32, 'F', 'Caucasian', 'Banker', 60, 165, @ID_Caso);
SET @ID_Vitima = LAST_INSERT_ID();

-- Suspeito(s) Caso 7
INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Ex-Boyfriend', 0, 'Tom Whitman', NULL, 'Greater London', 'London', 'Regent Street', '4526522', @ID_Caso);
SET @ID_Suspeito1Caso7 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Co-Worker', 0, 'Lisa Adams', NULL, 'Greater London', 'London', 'Bishopsgate', '4443333', @ID_Caso);
SET @ID_Suspeito2Caso7 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Stalker', 1, 'David Barnes', NULL, 'Greater London', 'London', 'Covent Garden', '4101005', @ID_Caso);
SET @ID_Suspeito3Caso7 = LAST_INSERT_ID();

-- Evidencia(s) Caso 7
INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Thames River', 'Skeletal remains with signs of blunt force trauma', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Apartment', 'Diary detailing encounters with a stalker', 'texto', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Office', 'Emails with threats from an unknown person', 'texto', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Hammer with fingerprints', 'arma', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Thames River', 'Personal belongings of the victim', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Apartment', 'Footprints matching suspect\'s shoes', 'fisico', @ID_Caso);

-- Detetive(s) Caso 7
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (1, @ID_Caso);
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (2, @ID_Caso);

-- Interrogaçao(oes) Caso 7
INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Tom Whitman denied any involvement and provided an alibi.', '2005-10-26 10:00:00', 1, @ID_Suspeito1Caso7);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Lisa Adams mentioned recent conflicts at work but had no direct involvement.', '2005-10-27 14:00:00', 1, @ID_Suspeito2Caso7);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('David Barnes confessed to stalking and murdering Sara Johnson.', '2005-10-29 11:00:00', 1, @ID_Suspeito3Caso7);



-- Caso 8 -------------------------------------------------------------------------------------------------------------------------------------

-- Cliente Caso 8
INSERT INTO Cliente (Nome, Distrito, Localidade, Rua, CodPost, EMAIL) 
VALUES ('Alexandra Harris', 'Greater London', 'London', 'Sussex Pl', '4989823', 'alexandra.harris@example.com');
SET @ID_ClienteCaso8 = LAST_INSERT_ID();

-- Caso 8
INSERT INTO Caso (Estado, DtTimeRegisto, DtTimeFecho, ID_Cliente) 
VALUES ('Concluido', '2005-11-01 09:20:00', '2005-11-08 16:40:00', @ID_ClienteCaso8);
SET @ID_Caso = LAST_INSERT_ID();

-- Vitima(s) Caso 8
INSERT INTO Vitima (Local_encontrada, Nome, Filiacao, Idade, Sexo, Etnia, Ocupacao, Peso, Altura, Caso_ID) 
VALUES ('Hyde Park, London', 'Timothy Murphy', NULL, 45, 'M', 'Caucasian', 'Journalist', 80, 180, @ID_Caso);
SET @ID_Vitima = LAST_INSERT_ID();

-- Suspeito(s) Caso 8
INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Business Partner', 0, 'James Black', NULL, 'Greater London', 'London', 'King\'s Cross', '4074813', @ID_Caso);
SET @ID_Suspeito1Caso8 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Rival Journalist', 0, 'Emma White', NULL, 'Greater London', 'London', 'Fleet Street', '4832638', @ID_Caso);
SET @ID_Suspeito2Caso8 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Source', 1, 'Derek Green', NULL, 'Greater London', 'London', 'Camden Town', '3255096', @ID_Caso);
SET @ID_Suspeito3Caso8 = LAST_INSERT_ID();

-- Evidencia(s) Caso 8
INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Hyde Park', 'Skeletal remains found near a tree', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Office', 'Notes on an investigative story about corruption', 'texto', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'A broken laptop with sensitive information', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Apartment', 'Threatening letters from an unknown sender', 'texto', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Knife with blood traces', 'arma', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Hyde Park', 'Footprints leading to the body', 'fisico', @ID_Caso);

-- Detetive(s) Caso 8
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (1, @ID_Caso);
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (2, @ID_Caso);

-- Interrogaçao(oes) Caso 8
INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('James Black denied any involvement and mentioned their recent business conflicts.', '2005-11-02 10:00:00', 1, @ID_Suspeito1Caso8);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Emma White provided an alibi and shared their professional rivalry.', '2005-11-03 14:00:00', 1, @ID_Suspeito2Caso8);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Derek Green confessed to killing Timothy Murphy to pracontecimento the story from being published.', '2005-11-05 11:00:00', 1, @ID_Suspeito3Caso8);



-- Caso 9 -------------------------------------------------------------------------------------------------------------------------------------

-- Cliente Caso 9
INSERT INTO Cliente (Nome, Distrito, Localidade, Rua, CodPost, EMAIL) 
VALUES ('Matthew Wilson', 'Greater London', 'London', 'Mile End Rd', '4689082', 'matthew.wilson@example.com');
SET @ID_ClienteCaso9 = LAST_INSERT_ID();

-- Caso 9
INSERT INTO Caso (Estado, DtTimeRegisto, DtTimeFecho, ID_Cliente) 
VALUES ('Concluido', '2005-11-08 09:20:00', '2005-11-15 16:40:00', @ID_ClienteCaso9);
SET @ID_Caso = LAST_INSERT_ID();

-- Vitima(s) Caso 9
INSERT INTO Vitima (Local_encontrada, Nome, Filiacao, Idade, Sexo, Etnia, Ocupacao, Peso, Altura, Caso_ID) 
VALUES ('Greenwich Park, London', 'Jessica Keller', NULL, 28, 'F', 'Caucasian', 'Artist', 55, 162, @ID_Caso);
SET @ID_Vitima = LAST_INSERT_ID();

-- Suspeito(s) Caso 9
INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Boyfriend', 0, 'Mark Hudson', NULL, 'Greater London', 'London', 'Piccadilly Circus', '4478922', @ID_Caso);
SET @ID_Suspeito1Caso9 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Art Dealer', 0, 'Samantha Green', NULL, 'Greater London', 'London', 'Bond Street', '3108906', @ID_Caso);
SET @ID_Suspeito2Caso9 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Stalker', 1, 'Nathan Cole', NULL, 'Greater London', 'London', 'Hackney', '4749885', @ID_Caso);
SET @ID_Suspeito3Caso9 = LAST_INSERT_ID();

-- Evidencia(s) Caso 9
INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Greenwich Park', 'Skeletal remains with signs of strangulation', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Studio', 'Painting with a hidden message indicating a stalker', 'texto', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Fiber evidence matching suspect\'s clothing', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Apartment', 'Letters from Nathan Cole expressing obsession', 'texto', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Rope with DNA evidence', 'arma', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Greenwich Park', 'Footprints leading away from the body', 'fisico', @ID_Caso);

-- Detetive(s) Caso 9
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (1, @ID_Caso);
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (2, @ID_Caso);

-- Interrogaçao(oes) Caso 9
INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Mark Hudson stated they had an argument the night before but denied any involvement.', '2005-11-09 10:00:00', 1, @ID_Suspeito1Caso9);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Samantha Green provided information about Jessica\'s stalker but denied involvement.', '2005-11-10 14:00:00', 1, @ID_Suspeito2Caso9);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Nathan Cole confessed to killing Jessica Keller due to his obsession.', '2005-11-12 11:00:00', 1, @ID_Suspeito3Caso9);



-- Caso 10 -------------------------------------------------------------------------------------------------------------------------------------

-- Cliente Caso 10
INSERT INTO Cliente (Nome, Distrito, Localidade, Rua, CodPost, EMAIL) 
VALUES ('Olivia Brown', 'Greater London', 'London', 'Gower St', '3190911', 'olivia.brown@example.com');
SET @ID_ClienteCaso10 = LAST_INSERT_ID();

-- Caso 10
INSERT INTO Caso (Estado, DtTimeRegisto, DtTimeFecho, ID_Cliente) 
VALUES ('Concluido', '2005-11-15 09:20:00', '2005-11-22 16:40:00', @ID_ClienteCaso10);
SET @ID_Caso = LAST_INSERT_ID();

-- Vitima(s) Caso 10
INSERT INTO Vitima (Local_encontrada, Nome, Filiacao, Idade, Sexo, Etnia, Ocupacao, Peso, Altura, Caso_ID) 
VALUES ('Thames River, London', 'Karen Anderson', NULL, 30, 'F', 'Caucasian', 'Banker', 65, 170, @ID_Caso);
SET @ID_Vitima = LAST_INSERT_ID();

-- Suspeito(s) Caso 10
INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Ex-Husband', 0, 'John Anderson', NULL, 'Greater London', 'London', 'Baker Street', '4321518', @ID_Caso);
SET @ID_Suspeito1Caso10 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Co-worker', 0, 'Lucy Smith', NULL, 'Greater London', 'London', 'Canary Wharf', '4951019', @ID_Caso);
SET @ID_Suspeito2Caso10 = LAST_INSERT_ID();

INSERT INTO Suspeito (ID, Relacionamento_com_vítima, Culpado, Nome, Cadastro, Distrito, Localidade, Rua, CodPost, Caso_ID) 
VALUES (default, 'Client', 1, 'Michael Brown', NULL, 'Greater London', 'London', 'Mayfair', '4935529', @ID_Caso);
SET @ID_Suspeito3Caso10 = LAST_INSERT_ID();

-- Evidencia(s) Caso 10
INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Thames River', 'Skeletal remains found in the river', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Office', 'Financial records indicating potential fraud', 'texto', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Watch belonging to Karen Anderson', 'fisico', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Victim\'s Home', 'Emails threatening Karen about revealing information', 'texto', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Crime Scene', 'Rope used to bind the victim', 'arma', @ID_Caso);

INSERT INTO Evidencia (Locale, Descrição, Tipo, Caso_ID) 
VALUES ('Thames River', 'Boat rental records', 'texto', @ID_Caso);

-- Detetive(s) Caso 10
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (1, @ID_Caso);
INSERT INTO DetetiveEstudaCaso (Detetive_ID, Caso_ID) VALUES (2, @ID_Caso);

-- Interrogaçao(oes) Caso 10
INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('John Anderson mentioned their contentious divorce but denied any involvement.', '2005-11-16 10:00:00', 1, @ID_Suspeito1Caso10);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Lucy Smith provided an alibi and mentioned Karen\'s recent stress at work.', '2005-11-17 14:00:00', 1, @ID_Suspeito2Caso10);

INSERT INTO DetetiveInterrogaSuspeito (Depoimento, DtTime_inicio, Detetive_ID, Suspeito_ID) 
VALUES ('Michael Brown confessed to killing Karen Anderson to cover up financial fraud.', '2005-11-19 11:00:00', 1, @ID_Suspeito3Caso10);
