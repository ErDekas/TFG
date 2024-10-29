USE DCCLON;

INSERT INTO USUARIOS (NombreUsuario, Correo, Contraseña, Estado, Avatar)
VALUES 
    ('usuario1', 'usuario1@ejemplo.com', 'contraseña_encriptada1', 'activo', 'avatar1.jpg'),
    ('usuario2', 'usuario2@ejemplo.com', 'contraseña_encriptada2', 'inactivo', 'avatar2.jpg'),
    ('usuario3', 'usuario3@ejemplo.com', 'contraseña_encriptada3', 'baneado', 'avatar3.jpg');

INSERT INTO SERVIDORES (Nombre, CREADOR_ID, Descripcion)
VALUES 
    ('Servidor de usuario1', 1, 'Servidor principal de usuario1'),
    ('Servidor de usuario2', 2, 'Servidor secundario de usuario2');

INSERT INTO ROLES (Nombre, SERVIDOR_ID, Permisos, Color, USUARIO_ID)
VALUES 
    ('Admin', 1, '{"manage_channels": true, "manage_roles": true}', '#FF0000', 1),
    ('Miembro', 1, '{"send_messages": true, "view_channels": true}', '#00FF00', 2),
    ('Moderador', 2, '{"mute_members": true, "kick_members": true}', '#0000FF', 2);
INSERT INTO SOLICITUDES (REMITENTE_ID, DESTINATARIO_ID, Estado)
VALUES 
    (1, 2, 'pendiente'),
    (2, 3, 'aceptado'),
    (3, 1, 'rechazada');
INSERT INTO CANALES (Nombre, Tipo, SERVIDOR_ID, ROL_ID)
VALUES 
    ('General', 'texto', 1, 1),
    ('Voz Principal', 'voz', 1, 1),
    ('Video Chat', 'video', 2, 3);
INSERT INTO MENSAJES (Contenido, USUARIO_ID, CANAL_ID, SERVIDOR_ID, Tipo)
VALUES 
    ('¡Hola a todos!', 1, 1, 1, 'texto'),
    ('¿Alguien está disponible para una llamada?', 2, 2, 1, 'texto'),
    ('Aquí hay un enlace interesante', 3, 3, 2, 'enlace');
INSERT INTO AMISTADES (USUARIO_ID1, USUARIO_ID2, Estado)
VALUES 
    (1, 2, 'activo'),
    (1, 3, 'bloqueado'),
    (2, 3, 'silenciado');
INSERT INTO TRANSMISION (USUARIO_ID, CANAL_ID, SERVIDOR_ID, FechaInicio, Estado)
VALUES 
    (1, 1, 1, CURRENT_TIMESTAMP, 'en vivo'),
    (2, 2, 1, CURRENT_TIMESTAMP, 'finalizado');
INSERT INTO REACCIONES (MENSAJE_ID, USUARIO_ID, Reaccion)
VALUES 
    (1, 2, 'emoji'),
    (2, 3, 'texto'),
    (3, 1, 'simbolo');
INSERT INTO NOTIFICACIONES (USUARIO_ID, Tipo, Contenido, Leido)
VALUES 
    (1, 'mensaje', 'Nuevo mensaje recibido', 0),
    (2, 'solicitud', 'Solicitud de amistad aceptada', 1),
    (3, 'reaccion', 'Tu mensaje recibió una reacción', 0);
INSERT INTO CONFIGURACIONES (USUARIO_ID, Preferencias)
VALUES 
    (1, '{"notificaciones": true, "idioma": "es"}'),
    (2, '{"notificaciones": false, "idioma": "en"}'),
    (3, '{"privacidad": "alta", "sonido": false}');
INSERT INTO ARCHIVOS (Nombre, Ruta, Tipo, USUARIO_ID)
VALUES 
    ('documento1.pdf', '/ruta/documentos/documento1.pdf', 'documento', 1),
    ('video1.mp4', '/ruta/videos/video1.mp4', 'video', 2),
    ('musica1.mp3', '/ruta/musica/musica1.mp3', 'musica', 3);
INSERT INTO LLAMADA (USUARIO_ID, Tipo)
VALUES 
    (1, 'individual'),
    (2, 'grupal');
INSERT INTO INVITACIONES (USUARIO_ID, SERVIDOR_ID, CANAL_ID, Estado, FechaExpiracion)
VALUES 
    (1, 1, 1, 'Unirse', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 7 DAY)),
    (2, 2, 2, 'Te has unido', DATE_ADD(CURRENT_TIMESTAMP, INTERVAL 7 DAY)),
    (3, 1, 3, 'Expirado', DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 1 DAY));

SELECT s.ID, s.Nombre, u.NombreUsuario AS Creador
FROM SERVIDORES s
JOIN USUARIOS u ON s.CREADOR_ID = u.ID;
