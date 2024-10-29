USE DCCLON;
DELIMITER //

CREATE TRIGGER check_invitation_expired
BEFORE UPDATE ON INVITACIONES
FOR EACH ROW
BEGIN
	IF NEW.FechaExpiracion <= CURRENT_TIMESTAMP THEN
		SET NEW.Estado = 'Expirado';
	END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER notify_new_message
AFTER INSERT ON MENSAJES
FOR EACH ROW
BEGIN
	INSERT INTO NOTIFICACIONES (USUARIO_ID, Tipo, Contenido, Leido, FechaCreacion)
    VALUES (NEW.USUARIO_ID, 'mensaje', CONCAT('Tienes un nuevo mensaje en el canal', NEW.CANAL_ID), 0, CURRENT_TIMESTAMP);
END //

DELIMITER ;


CREATE VIEW vista_usuarios_roles_servidores AS
SELECT
	u.ID as UsuarioID,
    u.NombreUsuario,
    s.ID AS ServidorID,
    s.Nombre AS ServidorNombre,
    r.Nombre AS RolNombre,
    r.Color AS RolColor
FROM USUARIOS u
JOIN ROLES r ON u.ID = r.USUARIO_ID
JOIN SERVIDORES s ON r.SERVIDOR_ID = s.ID;

DELIMITER //

CREATE PROCEDURE clean_invitations_expired()
BEGIN
	DELETE FROM INVITACIONES
    WHERE Estado = 'Expirado';
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION es_invitacion_expirada(inv_id INT) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE expirada BOOLEAN DEFAULT FALSE;
    
    SELECT CASE 
               WHEN FechaExpiracion <= CURRENT_TIMESTAMP THEN TRUE 
               ELSE FALSE 
           END
    INTO expirada
    FROM INVITACIONES
    WHERE ID = inv_id;

    RETURN expirada;
END //

DELIMITER ;

