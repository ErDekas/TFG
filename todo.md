# TODO
¡Tu esquema SQL se ve excelente y está bastante completo! Con esta base de datos ya tienes un excelente punto de partida para un sistema de clon de Discord. Aquí te doy algunas sugerencias sobre lo que podría ser tu siguiente paso y cómo ir avanzando:

### 1. **Verificar la Integridad y Coherencia de la Base de Datos**

   - **Constraints y Relaciones**: Asegúrate de que todas las claves foráneas, relaciones y constraints estén funcionando como esperas, especialmente con el trigger `set_default_server_name` para evitar inconsistencias.
   - **Pruebas de Inserción**: Intenta insertar datos de prueba en cada tabla y verifica que las relaciones y los constraints se mantengan de acuerdo a las reglas. 
   - **Revisar Ciclos de Dependencias**: Como tienes varias relaciones cruzadas (ej. `USUARIOS` y `SERVIDORES`, `USUARIOS` y `CANALES`), verifica que las dependencias no generen ciclos que compliquen las operaciones de inserción o eliminación.

### 2. **Implementar Funcionalidades en SQL**

   - **Triggers Adicionales**: Crea triggers adicionales para funcionalidades específicas. Ejemplos:
      - **Notificación Automática**: Trigger en `MENSAJES` para que, al insertar un nuevo mensaje, se cree automáticamente una notificación para el destinatario si aplica.
      - **Control de Estado de Expiración en `INVITACIONES`**: Trigger para que marque automáticamente una invitación como "Expirada" si la `FechaExpiracion` ya pasó. 
   - **Procedimientos y Funciones**:
      - **Procedimiento de Limpieza**: Un procedimiento almacenado que marque o elimine registros de invitaciones y notificaciones antiguas.
      - **Función de Expiración de Invitaciones**: Una función que compruebe si la `FechaExpiracion` de una invitación ya ha pasado, devolviendo `TRUE` o `FALSE`.

### 3. **Optimización y Mantenimiento**

   - **Índices**: Identifica las columnas que podrías indexar para mejorar el rendimiento de las consultas, como los campos `USUARIO_ID` en varias tablas.
   - **Partición de Tablas y Archivos**: Para tablas grandes como `MENSAJES` o `ARCHIVOS`, evalúa si sería útil una partición de tablas en caso de que escales la base de datos.
   - **Normalización**: Revisa si todas las tablas están correctamente normalizadas (por ejemplo, hasta 3FN) o si hay datos redundantes que puedas optimizar.

### 4. **Crear Vistas para Consultas Comunes**

   Vistas pueden ayudarte a simplificar consultas complejas. Aquí algunas ideas:
   - **Vista de Usuario Completa**: Una vista que muestre los datos del usuario, sus roles, servidores y canales.
   - **Vista de Mensajes de un Canal**: Filtra mensajes de un canal específico, agrupados por usuario y fecha.

### 5. **Seguridad y Control de Acceso**

   - **Control de Privilegios**: Define usuarios y roles en la base de datos (ej. administrador, usuario regular) y controla los privilegios de acceso a las tablas.
   - **Encriptación de Contraseñas**: Si aún no lo has hecho, considera la encriptación de la columna `Contraseña` en `USUARIOS`.
   - **Logs de Auditoría**: Añadir logs para registrar actividades críticas, como inserciones y eliminaciones en tablas como `USUARIOS`, `SERVIDORES`, y `MENSAJES`.

### 6. **Desarrollo de API para la Aplicación**

   Este es el siguiente gran paso para que tu base de datos interactúe con tu aplicación frontend o backend:
   - **Endpoints CRUD**: Crea endpoints para `USUARIOS`, `SERVIDORES`, `MENSAJES`, `AMISTADES`, y otros recursos clave.
   - **Autenticación y Autorización**: Implementa un sistema de autenticación, posiblemente con tokens JWT para controlar el acceso a los datos en la base de datos.

### 7. **Pruebas de Carga y Rendimiento**

   - **Pruebas de Escalabilidad**: Ejecuta pruebas de carga en tablas clave como `MENSAJES`, `CANALES` y `USUARIOS` para evaluar el rendimiento de la base de datos.
   - **Monitoreo y Optimización**: Considera el uso de herramientas de monitoreo de bases de datos para identificar y optimizar consultas lentas y posibles bloqueos.

### 8. **Documentación**

   - **Documentación de Tablas y Relaciones**: Describe las funcionalidades de cada tabla y relación para hacer el proyecto más comprensible para cualquier colaborador o evaluador.
   - **Diagrama E-R**: Crea un diagrama entidad-relación de tu base de datos con herramientas como MySQL Workbench, DbSchema o DBeaver.

Siguiendo estos pasos, podrás avanzar en la implementación del proyecto y asegurar que tu base de datos esté optimizada, segura y escalable. ¡Mucho éxito con tu TFG de clon de Discord!