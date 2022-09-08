# Crear Aplicacion
Para crear una aplicación de forma rapida y con su propia estructura base requerimos hacer uso de uno de las siguientes
dos lineas de comandos:

~~~bash
 mojo generate lite-app myapp.pl
 mojo generate app MyApp
~~~

## Aplicacion simple
La primera instruccion permite crear una aplicacion web con solo un script haciendo uso de Mojolicious::Lite:

  **mojo generate lite-app myapp.pl**
  [exist] /home/salomon/Documents/Cursos/Mojolicious/growing
  [write] /home/salomon/Documents/Cursos/Mojolicious/growing/myapp.pl
  [chmod] /home/salomon/Documents/Cursos/Mojolicious/growing/myapp.pl 744

## Aplicacion Estructurada
La segunda instruccion te grenerara la siguiente estructura:

  **mojo generate app MyApp**
  [mkdir] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/script
  [write] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/script/my_app
  [chmod] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/script/my_app 744
  [mkdir] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/lib
  [write] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/lib/MyApp.pm
  [exist] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app
  [write] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/my_app.yml
  [mkdir] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/lib/MyApp/Controller
  [write] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/lib/MyApp/Controller/Example.pm
  [mkdir] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/t
  [write] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/t/basic.t
  [mkdir] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/public
  [write] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/public/index.html
  [mkdir] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/templates/layouts
  [write] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/templates/layouts/default.html.ep
  [mkdir] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/templates/example
  [write] /home/salomon/Documents/Cursos/Mojolicious/growing/my_app/templates/example/welcome.html.ep