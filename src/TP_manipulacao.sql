-- Universidade do Minho
-- Engenharia Informática
-- Bases de Dados, 2023-2024
-- Linguagem SQL
-- Manipulação de dados

-- Implementação do Sistemas de Bases de Dados para o caso de estudo "Agência de Detetives"
-- MAY 2024
-- Grupo 27

USE agencia;

-- Q1: Casos do mês de março de 2024
SELECT *
FROM Caso
		WHERE Caso.DtTimeRegisto BETWEEN '2024-03-01 00:00:00' AND '2024-03-31 23:59:59';
        
-- Q2: Casos com estado Ativo
CREATE VIEW q2 AS
	SELECT *
	FROM Caso
			WHERE Caso.Estado = 'Ativo';
            
SELECT * FROM q2;

-- Q3: IDs dos casos ativos
CREATE VIEW q3 AS
	SELECT ID
	FROM q2;

SELECT * FROM q3;
    
-- Q4: Nome das vítimas dos casos ativos
SELECT V.Nome
FROM q3 Q
	INNER JOIN Vitima V ON Q.ID = V.Caso_ID;
    
-- Q5: EMAIL de cada cliente dos casos marcados como concluídos, incluindo o seu nome e ID
SELECT Cl.ID, Cl.Nome, Cl.EMAIL
FROM Caso C
    INNER JOIN Cliente Cl ON C.ID_Cliente = Cl.ID
    WHERE C.Estado = 'Concluido';
    
-- FUNCTION: A qualquer momento deve ser possível saber o nº de casos em que um determinado suspeito está envolvido
DELIMITER $$
CREATE FUNCTION listaCasosSuspeito (Id INT)
	RETURNS INT
    DETERMINISTIC
BEGIN
	DECLARE Ncasos INT;
    SELECT count(C.ID) INTO Ncasos
    FROM Caso C
		INNER JOIN Suspeito S ON C.ID = S.Caso_ID
        WHERE S.ID = Id;
	RETURN Ncasos;
END
$$

DELIMITER ;

SELECT listaCasosSuspeito(2);		-- chamar a query para o suspeito de ID = 1;


-- PROCEDURE: A qualquer momento deve ser possível listar todas as evidências, de acordo com o tipo especificado
DELIMITER $$
CREATE PROCEDURE todasEvidencias(IN lookup ENUM('arma', 'acontecimento', 'fisico', 'texto'))
BEGIN
	SELECT *
    FROM Evidencia
		WHERE lookup = Evidencia.Tipo;
END
$$

DELIMITER ;

CALL todasEvidencias('arma');


-- TRIGGER
DELIMITER &&
CREATE TRIGGER update_DtTimeFecho
	BEFORE UPDATE ON Caso
	FOR EACH ROW
BEGIN
    IF NEW.Estado = 'Concluido' AND OLD.Estado <> 'Concluido' THEN
		SET NEW.DtTimeFecho = NOW();
    END IF;
END &&

DELIMITER ;


-- INDEXES
CREATE INDEX idc_evidencias_ ON Evidencia (Caso_ID);

CREATE INDEX idc_detetive_por_caso ON DetetiveEstudaCaso (Detetive_ID , Caso_ID);

CREATE INDEX idc_suspeito_por_caso ON Suspeito (Caso_ID);

-- ------------------------------------------------------------------------------

-- AUX VIEW
SELECT * FROM VitimasDeUmDetetive;

CREATE VIEW VitimasDeUmDetetive AS 
SELECT 
    v.ID, 
    v.Nome, 
    v.Idade, 
    v.Sexo, 
    v.Etnia, 
    v.Peso, 
    v.Altura
FROM 
    Vitima v
INNER JOIN 
    Caso c ON c.ID = v.Caso_ID
INNER JOIN 
    DetetiveEstudaCaso dc ON dc.Caso_ID = c.ID
INNER JOIN 
    Detetive d ON d.ID = dc.Detetive_ID;