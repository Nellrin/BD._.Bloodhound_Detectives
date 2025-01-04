
-- CLIENT

DELIMITER &&
CREATE PROCEDURE GetClienteCasoData()
BEGIN
    SELECT *
    FROM caso 
    WHERE id_cliente = @cliente_id;
END &&

DELIMITER ;

DELIMITER &&
CREATE PROCEDURE GetClienteData()
BEGIN
    SELECT *
    FROM cliente 
    WHERE id = @cliente_id;
END &&

DELIMITER ;

DELIMITER &&
CREATE PROCEDURE LoginCliente(IN p_email VARCHAR(255))
BEGIN
    DECLARE v_id INT;
    
    -- Verificar credenciais
    SELECT id INTO v_id 
    FROM cliente
    WHERE email = p_email;
    
    IF v_id IS NOT NULL THEN
        -- Armazenar o ID do cliente na variável de sessão
        SET @cliente_id = v_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não existe ninhum cliente com esse email';
    END IF;
END &&

DELIMITER ;


SELECT * FROM cliente;

CREATE USER 'cliente'@'localhost' IDENTIFIED BY 'cliente';

GRANT EXECUTE ON PROCEDURE Agencia.LoginCliente TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE Agencia.GetClienteData TO 'cliente'@'localhost';
GRANT EXECUTE ON PROCEDURE Agencia.GetClienteCasoData TO 'cliente'@'localhost';
GRANT SELECT ON Agencia.cliente TO 'cliente'@'localhost';
GRANT SELECT ON Agencia.caso TO 'cliente'@'localhost';


DROP PROCEDURE IF EXISTS LoginCliente;
DROP PROCEDURE IF EXISTS GetClientedata;
DROP PROCEDURE IF EXISTS GetClienteCasoData;

CALL Agencia.LoginCliente('cliente@example.com');
CALL Agencia.GetClienteData();
CALL Agencia.GetClienteCasoData();

-- ---------------------------------------------------------------------------------------------------

-- DETETIVE

CREATE USER 'detetive'@'localhost' IDENTIFIED BY 'detetive';

GRANT SELECT, INSERT, UPDATE, DELETE ON Agencia.caso TO 'detetive'@'localhost';
GRANT SELECT ON Agencia.cliente TO 'detetive'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Agencia.detetiveinterrogasuspeito TO 'detetive'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Agencia.suspeito TO 'detetive'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON Agencia.evidencia TO 'detetive'@'localhost';

-- ---------------------------------------------------------------------------------------------------

-- AUX

INSERT INTO Cliente (nome, distrito, localidade, rua, codpost, email) 
VALUES ('ClienteTEST', 'braga', 'sei la', 'rua yessir', 216904, 'cliente@example.com');

-- INSERT INTO Caso (Estado, DtTimeRegisto, DtTimeFecho, ID_Cliente) VALUES ("Ativo", "2024-05-30 15:30:00", "2024-06-30 15:30:00", 1);

UPDATE caso
	SET
		estado = "Concluido"
	WHERE
		ID = 1;

-- DELETE FROM caso WHERE id_cliente = 1;
SELECT * FROM caso;
SELECT * FROM cliente;
-- select * from vitima;