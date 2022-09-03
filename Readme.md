# Tutorial de Mojolicious

# Notas
## Palabras clave
### TSL
El protocolo TLS (Transport Layer Security, seguridad de la capa de transporte) es solo una versión actualizada y más segura de SSL.
**Fuente:** https://www.websecurity.digicert.com/es/es/security-topics/what-is-ssl-tls-https

### Websocket
WebSocket es una tecnología que proporciona un canal de comunicación bidireccional y full-duplex sobre un único socket TCP. Está diseñada para ser implementada en navegadores y servidores web, pero puede utilizarse por cualquier aplicación cliente/servidor.
**Fuente**: https://es.wikipedia.org/wiki/WebSocket

### PSGI
PSGI - Perl Web Server Gateway Interface Specification
Es una especificación que separa los "ambientes del servidor web" del "codigo del framework para aplicaciones web". Tampoco es PSGI un API para aplicaciones web. Los **desrrolladores de aplicaciones web** (usuarios finales) **no correran** sus aplicaciones usando **directamente la interfaz PSGI**, pero en su lugar se recomienda usar **frameworks** que soporten PSGI.

### Routes
Son basicamente path "sofisticados" que contienen diferentes tipos de "placeholders" y usualmente dirigen a un accion, si ellos corresponden a parte del path de la solicitud URL (request URL). Su primer argumento pasado para todas las acciones es un objeto "**Mojolicious::Controller**" (**$c**), el cual contiene tanto el **Request** como el **Response** del HTTP.

### Placeholders
Los placeholders o "marcadores de posicion" son identificadores que nos ayudan a estrucuturar y simplificar el RUTEO dentro
de mojolicious, estos se identifican por agregar ":" despues del path del URL. Adelante de los ":" va el texto como se identificara el placeholder.

    Ejemplo:
    /usr/admin/:id -> $c->render(template => $user{$id})

Podemos formatear el path en varios PLACEHOLDERS y estos a su vez extraerlos en un HASH
    Ejemplo:
    /usr/admin/23 -> /usr/:role/:id -> { role => 'admin', id => 23 }

### Layout
Mientras un ***template*** define todos los modulos que son permitidos para una pagina, un ***layout*** es una selección explicita y un arreglo de modulos. Un **template** puede contener muchos **layouts**, podemos usar un **template** especifico para no estar recreando una esturctura similiar con los mismo **layouts**.

### Helper
Este es un ***core plugin*** (plugin del nucleo),esto significa que **siempre estara disponible**.
Son como funciones pequeñas de Perl,a las que podemos acceder desde toda la aplicacion.