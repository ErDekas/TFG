# Entidades
### 1. **Usuarios**
   - **ID**: Identificador único del usuario
   - **NombreUsuario**: Nombre de usuario
   - **Correo**: Correo electrónico
   - **Contraseña**: Contraseña cifrada
   - **FechaRegistro**: Fecha de registro
   - **Estado**: (activo, inactivo, baneado)
   - **Avatar**: URL del avatar

### 2. **Servidores**
   - **ID**: Identificador único del servidor
   - **Nombre**: Nombre del servidor
   - **CreadorID**: ID del usuario que creó el servidor
   - **FechaCreación**: Fecha de creación
   - **Descripción**: Descripción del servidor

### 3. **Roles**
   - **ID**: Identificador único del rol
   - **Nombre**: Nombre del rol
   - **ServidorID**: ID del servidor al que pertenece
   - **Permisos**: JSON con los permisos asociados al rol
   - **Color**: Color del rol

### 4. **Solicitudes**
   - **ID**: Identificador único de la solicitud
   - **RemitenteID**: ID del usuario que envía la solicitud
   - **DestinatarioID**: ID del usuario que recibe la solicitud
   - **Estado**: (pendiente, aceptada, rechazada)
   - **FechaEnvio**: Fecha de envío de la solicitud

### 5. **Mensajes**
   - **ID**: Identificador único del mensaje
   - **Contenido**: Texto del mensaje
   - **UsuarioID**: ID del usuario que envió el mensaje
   - **CanalID**: ID del canal donde se envió
   - **FechaEnvio**: Fecha y hora de envío
   - **Tipo**: (texto, imagen, video, enlace, etc.)
   - **RespuestaA**: ID del mensaje al que está respondiendo (puede ser nulo)

### 6. **Amistades**
   - **ID**: Identificador único de la amistad
   - **UsuarioID1**: ID del primer usuario
   - **UsuarioID2**: ID del segundo usuario
   - **FechaAmistad**: Fecha en que se estableció la amistad
   - **Estado**: (activo, bloqueado, etc.)

### 7. **Transmisión**
   - **ID**: Identificador único de la transmisión
   - **UsuarioID**: ID del usuario que transmite
   - **ServidorID**: ID del servidor en el que se transmite
   - **CanalID**: ID del canal en el que se realiza la transmisión
   - **FechaInicio**: Fecha y hora de inicio de la transmisión
   - **FechaFin**: Fecha y hora de fin de la transmisión
   - **Estado**: (en vivo, finalizada)

### 8. **Canales**
   - **ID**: Identificador único del canal
   - **Nombre**: Nombre del canal
   - **Tipo**: (texto, voz, video)
   - **ServidorID**: ID del servidor al que pertenece
   - **RolID**: ID del rol que tiene acceso (puede ser nulo para acceso público)
   - **FechaCreación**: Fecha de creación del canal

### 9. **Reacciones**
   - **ID**: Identificador único de la reacción
   - **MensajeID**: ID del mensaje al que se reacciona
   - **UsuarioID**: ID del usuario que reacciona
   - **Emoticono**: Emoticono o símbolo usado en la reacción
   - **FechaReacción**: Fecha y hora de la reacción

### 10. **Notificaciones**
   - **ID**: Identificador único de la notificación
   - **UsuarioID**: ID del usuario que recibe la notificación
   - **Tipo**: Tipo de notificación (mensaje, solicitud, etc.)
   - **Contenido**: Detalles de la notificación
   - **Leído**: Booleano para indicar si ha sido leído
   - **FechaCreación**: Fecha de creación de la notificación

### 11. **Configuraciones**
   - **ID**: Identificador único de la configuración
   - **UsuarioID**: ID del usuario a quien pertenece la configuración
   - **Preferencias**: JSON u otro formato para almacenar configuraciones específicas (notificaciones, privacidad, etc.)

### 12. **Archivos**
   - **ID**: Identificador único del archivo
   - **Nombre**: Nombre del archivo
   - **Ruta**: Ruta donde se almacena el archivo
   - **Tipo**: Tipo de archivo (documento, imagen, etc.)
   - **UsuarioID**: ID del usuario que subió el archivo
   - **FechaSubida**: Fecha y hora de subida

### 13. **Historial de Actividades**
   - **ID**: Identificador único de la actividad
   - **UsuarioID**: ID del usuario
   - **Acción**: Descripción de la acción realizada
   - **Fecha**: Fecha y hora de la actividad


# Claves de los atributos
### 1. **Usuarios**
   - **ID**: **PK** (Clave primaria)
   - **NombreUsuario**: Atributo normal
   - **Correo**: Atributo normal
   - **Contraseña**: Atributo normal
   - **FechaRegistro**: Atributo normal
   - **Estado**: Atributo normal
   - **Avatar**: Atributo normal

### 2. **Servidores**
   - **ID**: **PK** (Clave primaria)
   - **Nombre**: Atributo normal
   - **CreadorID**: **FK** (Clave foránea, referencia a **Usuarios.ID**)
   - **FechaCreación**: Atributo normal
   - **Descripción**: Atributo normal

### 3. **Roles**
   - **ID**: **PK** (Clave primaria)
   - **Nombre**: Atributo normal
   - **ServidorID**: **FK** (Clave foránea, referencia a **Servidores.ID**)
   - **Permisos**: Atributo normal
   - **Color**: Atributo normal

### 4. **Solicitudes**
   - **ID**: **PK** (Clave primaria)
   - **RemitenteID**: **FK** (Clave foránea, referencia a **Usuarios.ID**)
   - **DestinatarioID**: **FK** (Clave foránea, referencia a **Usuarios.ID**)
   - **Estado**: Atributo normal
   - **FechaEnvio**: Atributo normal

### 5. **Mensajes**
   - **ID**: **PK** (Clave primaria)
   - **Contenido**: Atributo normal
   - **UsuarioID**: **FK** (Clave foránea, referencia a **Usuarios.ID**)
   - **CanalID**: **FK** (Clave foránea, referencia a **Canales.ID**)
   - **FechaEnvio**: Atributo normal
   - **Tipo**: Atributo normal
   - **RespuestaA**: **FK** (Clave foránea, referencia a **Mensajes.ID**, puede ser nulo)

### 6. **Amistades**
   - **ID**: **PK** (Clave primaria)
   - **UsuarioID1**: **FK** (Clave foránea, referencia a **Usuarios.ID**)
   - **UsuarioID2**: **FK** (Clave foránea, referencia a **Usuarios.ID**)
   - **FechaAmistad**: Atributo normal
   - **Estado**: Atributo normal

### 7. **Transmisión**
   - **ID**: **PK** (Clave primaria)
   - **UsuarioID**: **FK** (Clave foránea, referencia a **Usuarios.ID**)
   - **ServidorID**: **FK** (Clave foránea, referencia a **Servidores.ID**)
   - **CanalID**: **FK** (Clave foránea, referencia a **Canales.ID**)
   - **FechaInicio**: Atributo normal
   - **FechaFin**: Atributo normal
   - **Estado**: Atributo normal

### 8. **Canales**
   - **ID**: **PK** (Clave primaria)
   - **Nombre**: Atributo normal
   - **Tipo**: Atributo normal
   - **ServidorID**: **FK** (Clave foránea, referencia a **Servidores.ID**)
   - **RolID**: **FK** (Clave foránea, referencia a **Roles.ID**, puede ser nulo)
   - **FechaCreación**: Atributo normal

### 9. **Reacciones**
   - **ID**: **PK** (Clave primaria)
   - **MensajeID**: **FK** (Clave foránea, referencia a **Mensajes.ID**)
   - **UsuarioID**: **FK** (Clave foránea, referencia a **Usuarios.ID**)
   - **Emoticono**: Atributo normal
   - **FechaReacción**: Atributo normal

### 10. **Notificaciones**
   - **ID**: **PK** (Clave primaria)
   - **UsuarioID**: **FK** (Clave foránea, referencia a **Usuarios.ID**)
   - **Tipo**: Atributo normal
   - **Contenido**: Atributo normal
   - **Leído**: Atributo normal
   - **FechaCreación**: Atributo normal

### 11. **Configuraciones**
   - **ID**: **PK** (Clave primaria)
   - **UsuarioID**: **FK** (Clave foránea, referencia a **Usuarios.ID**)
   - **Preferencias**: Atributo normal

### 12. **Archivos**
   - **ID**: **PK** (Clave primaria)
   - **Nombre**: Atributo normal
   - **Ruta**: Atributo normal
   - **Tipo**: Atributo normal
   - **UsuarioID**: **FK** (Clave foránea, referencia a **Usuarios.ID**)
   - **FechaSubida**: Atributo normal

### 13. **Historial de Actividades**
   - **ID**: **PK** (Clave primaria)
   - **UsuarioID**: **FK** (Clave foránea, referencia a **Usuarios.ID**)
   - **Acción**: Atributo normal
   - **Fecha**: Atributo normal