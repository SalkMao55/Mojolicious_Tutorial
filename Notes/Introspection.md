# Introspection
El comando **Mojolicious::Command::routes** puede ser usado desde la linea de comandos para ***listar*** todas la 
***routes*** DISPONIBLES junto con los nombres o **names** de cada una y sus ***expresiones regulares*** relacionadas.

Recordando que el **name** es una forma de **identificar** y llamar una **route** dentro de la aplicacion y obtener informacion de dicha **route**, como por ejemplo su **"path completo"**, host, etc.

~~~bash
$ ./myapp.pl routes -v     # linea de comando usada
/foo/:name  ....  POST  fooname  ^/foo/([^/.]+)/?(?:\.([^/]+))?$
/bar        ..U.  *     bar      ^/bar
  +/baz     ...W  GET   baz      ^/baz/?(?:\.([^/]+))?$
/yada       ....  *     yada     ^/yada/?(?:\.([^/]+))?$
~~~

## Formato
La información obtenida con la intruccion de arriba, posee el siguiente formato:

  | path | investigar | http_method | name | regular_expression |