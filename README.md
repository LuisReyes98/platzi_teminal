# Comandos

Fecha

```sh
date
```

Escribir algo

```sh
echo "Hello world!"
```

mostrar manual de un comando

```sh
man [comando]
```

Historial de comandos

```sh
history
```

## Combinaciones de teclas

TAB , muestra comandos que empiezan con lo que llevas escrito

ARROW UP , ARROW DOWN , navegar entre los comandos anteriores

CTRL + SHIFT + R: busqueda en el hisotrial de comandos

## Mas Comandos

Comandos para trabajar desde nuestra ubicación
Lista los archivos que se encuentran en el directorio sobre el que estamos trabajando:

```sh
 ls
```

Lista todos los archivos incluyendo aquellos que se han definido como ocultos:

```sh
 ls -a
```

Todos los directorios contienen los archivos . y .., estos son punteros a directorios.

.. --> directorio padre
. --> directorio actual
Otros parámetros que puedes usar con el comando ls:

Ordena los archivos por fecha de modificación:

```sh
ls -t
```

Ordena elementos primero por nombre y después por extensión:

```sh
 ls -x
```

Ordena los elementos primero por extensión y luego por nombre:

```sh
 ls -X
```

Muestra toda la información: usuario, grupo, permisos, tamaño, fecha y hora de creación.

```sh
 ls -l
```

Muestra la misma información que ls -l pero con las unidades de tamaño en KB, MB:

```sh
 ls -lh
```

Muestra el contenido de todos los subdirectorios de forma recursiva:

```sh
 ls -R
```

Ordena los resultados por tamaño de archivo:

```sh
 ls -S
```

Ejecutarlo en un directorio

```sh
ls $ruta
```

Comandos para cambiar de ubicación
Print Working Directory: se usa para mostrar el directorio actual en el que nos encontramos trabajando.

```sh
 pwd
```

cd: se utiliza para cambiar de directorio. Luego del comando se debe especificar la ruta del directorio al que nos queremos mover. Por ejemplo:

```sh
 cd /home/mi_usuario
```

Comandos para mover, copiar o borrar
cp: copiar un archivo hacia un directorio.

```sh
 cp [archivo que se va a copiar] [directorio hacia el que se va a mover]
```

rm: eliminar un archivo.

```sh
 rm archivo.txt
```

`mv``: mover un archivo, cambiar su ubicación. La sintaxis es así:

```sh
mv [ruta del archivo] [directorio hacia el que se va a mover]
```

rmdir: eliminar un directorio. En este caso es importante resaltar que, para que el directorio pueda ser eliminado, no puede contener archivos u otros directorios en su interior.

```sh
 rmdir [ruta / nombre del directorio a eliminar]
```

ver procesos ejecutandose

```sh
ps -aux
sudo ps -a
sudo ps -U vivek
ps -U tom
```

## Vim

`i` modo de insercion para editar el archivo

`ESC` salir del modo de insercion

`:` modo de ingreso de comandos

`:w` escribir

`:q` salir

`:x` salir y guardar de inmediato

## Nano

es mas explicito ya que inicias en modo de edicion y existe una leyenda de los comandos disponibles.

## Utilidades batch y batch avanzadas

para tratamiento de archivos de texto

**touch** crear un archivo

```sh
touch archivo.txt
```

**cat** mostrar todo el contenido del archivo

```sh
cat archivo.txt
```

**head** mostrar las primeras lineas del archivo

```sh
head test.txt
head -n 1 test.txt # numero de lineas
```

**tail** mostra las ultimas lineas del archivo

```sh
tail test.txt
tail -n 1 test.txt # numero de lineas
tail -f # realiza follow de las ultimas lineas conforme el arhivo crece
```

**wc** word count

numero de palabras en un archivo

```sh
wc
```

numero de lineas en un archivo

```sh
wc -l
```

**grep** buscar en un archivo usando palabras o expresiones regulares

```sh
grep hola test.txt
grep hola -i test.txt # no considere mayusculas
grep [cualquier exprecion regular] test.txt
```

```sh
grep "palabra-clave" archivo_gigante.txt
```

Si nos da igual si la palabra clave incluye mayúsculas o minúsculas podemos utilizar el flag -i:

```sh
grep -i "pAlaBra-cLAvE" archivo_gigante.txt
```

También podemos verificar si la línea incluye esta palabra clave al final:

```sh
grep "palabra-clave$" archivo_gigante.txt
```

O si la incluye al principio:

```sh
grep "^palabra-clave" archivo_gigante.txt
```

**sed** string editor

no modifica directamente el archivo

```sh
sed 's/Luis/Rogelio/g' test.txt   # cambia la palabra Luis por Rogelio
```

Por ejemplo, imagina que nuestro archivo contiene un poema, frase o saludo para responderle a los usuarios de nuestra aplicación. El problema es que cada usuario tiene un nombre diferente.

```txt
¡Hola, NOMBRE_USUARIO! Felicitaciones por completar tu desafío con PUNTOS_USUARIO puntos.
```

No queremos editar este archivo. Solo necesitamos cambiar los caracteres NOMBRE_USUARIO por el verdadero nombre del usuario.

Para esto podemos utilizar el comando `sed`. Solo debemos indicarle que queremos realizar una sustitución (`s/`), la palabra que vamos a cambiar (`NOMBRE_USUARIO`), la nueva palabra que vamos a incluir (`Ana`) y cerrar con el símbolo `/`.

```sh
 sed 's/NOMBRE_USUARIO/Ana' archivo-saludo.txt
```

Ahora imagina que, además del nombre, debemos cambiar también la puntuación que obtuvo el usuario:

```sh
 sed 's/NOMBRE_USUARIO/Ana/; s/PUNTOS_USUARIO/35/' archivo-saludo.txt
```

[link de usos de sed](https://likegeeks.com/es/sed-de-linux/)

**awk** tratamiento de texto delimitado

sirve para tratar con texto extructurado , por ejemplo .csv

primer argumento separador utilizado
imprime la primera columna solamente

```sh
awk -F ';' '{ print $1 }' notas.csv
```

NR numero de linea
si el numero de linea es mayor a 1 y la segunda columna mayor a cero, imprime la multiplecacion de la columna 2 por la 3

```sh
awk -F ';' 'NR > 1 && $2 > 0 { print $1, $2 * $3 }' notas.csv
```

## Procesamiento de datos

Flujos estandar

- Entrada
- Salida
- Error

**Redireccion de entrada**, cambiar la entrada de comandos del teclado por un archivo, con el comando `<`

```sh
mysql -h 127.0.0.1 -u root -p1234 < archivo_de_comandos.sql
```

mostrar cantidad de lineas en un archivo

```sh
wc -l < lista_de_archivos.txt
```

**Redireccion de salida**, cambiar la salida de un comando de la consola a un archivo, con el comando `>`

```sh
ls -l > lista_de_archivos.txt
```

agreagar el resultado al final del archivo exsistente con `>>`

```sh
ls -lac >> lista_de_archivos.txt
```

**Pipes** permiten que la salida de un comando se utilice como la entrada de otro. usando `|` para marcar el uso de un pipe

```sh
ls -l | more
```

imprimir solo el history de comandos sin el numero ordinal

```sh
history | awk -F '  ' '{ print $2 }'
```

## Administración de procesos en background y foreground

cada comando que se ejecuta es un proceso, y la mayoria de los comandos son procesos en primer plano, ya que no se devuelve el control de la consola al usuario hasta que el proceso ha concluido

**Ejecutar proceso en background**, con el uso de `&` al final de un comando se devuelve el control de la consola inmediatamente mientras aun se ejecuta el proceso

```sh
tail -f color-brightness.js &
```

**Combinacione de tecla** con `CTRL + Z` el proceso es mandado al background.
y con `fg` el proceso es traido del background al foreground

**Ver procesos ejecutandose** se puede apreciar los procesos con el comando `ps`

muestra los procesos que estoy ejecutando en esa instancia de bash

```sh
ps
```

muestra los procesos del sistema

```sh
ps ax
```

buscar un proceso por el nombre

```sh
ps ax | grep "nombre"
```

**top** mostrar los procesos y recursos de la computadora de forma interactiva con

```sh
top
```

**Matar un proceso**, cuando un proceso no termino adecuadamente o debe forzarse la terminacion existen formas diferentes

si esta en foreground, terminar el proceso con la combinacion de teclas `CTRL + C`

si esta en background, con comandos como `ps ax` se puede buscar el id del proceso y entonces. se puede usar `kill` o `killall`.

envia una señal al proceso para que este termine, de forma normal

```sh
kill $id_del_proceso
```

detine forzosamente el proceso

```sh
kill -9 $id_del_proceso
```

**killall** hace casi lo mismo la diferencia es que no recibe el id del proceso, sino el nombre del archivo que ejecutable que disparo ese proceso.

## Permisos sobre archivos: El sistema de permisos octal

todos los arhivos en unix poseen un usuarios, **dueño** , **grupo** , **otros**

las operaciones que se pueden hacer sobre un archivo son 3 **lectura**, **escritura**, **ejecucion**.

|   | Read  |  Write | Execute  |   |
|---|---|---|---|---|
|  Owner |   |   |   |   |
|  Group |   |   |   |   |
|  Others |   |   |   |   |

### Ver los permisos de un archivo , `ls -l`

muestra mutiples letras y estas significan

inicio con `-` es un archivo

inicia con `d` es un directorio

los permisos estan en 3 grupos de 3, rwx

`r` es permiso de leer
`w` es permiso de escribir
`x` es permiso de Ejecutar

los grupos son owner, group, others, en ese orden

la ausenscia de un permiso se marca con un `-`

ejemplo:

```sh
-rw-rw-r-- 1 luis luis    7 jun 21 00:56 comandos
-rw-r--r-- 1 luis luis  745 jun 21 01:01 lista_de_archivos.txt
-rw-rw-r-- 1 luis luis   79 jun 17 10:20 notas.csv
-rw-r--r-- 1 luis luis   49 jun 17 09:42 nuevo.txt
drwxrwxr-x 2 luis luis 4096 jun 21 17:00 practice
-rw-rw-r-- 1 luis luis 8470 jun 21 20:42 README.md
-rw-r--r-- 1 luis luis  139 jun 17 10:09 test.txt
```

### Comandos para cambiar los permisos `chmod`, `chown`, `chgrp`

`chmod`, cambia permisos en un archivo

`chown`, cambia el dueño de un arhivo

`chgrp` cambia el grupo de un arhivo

**Cambiar el modo del archivo**, permisos de rwx,

quitando el permiso de escritura a `others`

`o` primera letra grupo de usuario
`-` menos es quitar un permiso
`w` el permiso de escribir

```sh
chmod o-w nuevo.txt
```

darle a todos los usuarios permisos de ejecutar

```sh
chmod +x $nombre_archivo
```

esta forma de dar los permisos con una notacion textual
tambien existe la notacion binaria

#### Permisos con notacion binaria

los permisos son flags en un arhivo definidos por notacion binaria y al utlizarlos se pueden cambiar los 3 permisos en una unica operacion

|  Owner | Owner  | Owner  |  Group | Group  | Group  | Others  |   |  Others |  Others |
|---|---|---|---|---|---|---|---|---|---|
|  r |  w |  x |  r | w  |  x |  r | w  |  x |   |
| 1  |  1 |  0 |  1 | 0  | 0  |  0 | 0  | 0  | 640  |
|  1 |  0 | 0  |  0 |  0 | 0  |  0 |  0 | 0  | 400  |
|  1 | 1  | 1  |  1 |  1 |  1 |  1 |  1 |  1 | 777  |

### Superusuarios sudo

`chown` y `chgrp` son comandos de cambio de permisos de a los cuales solo el usuario root los puede ejecutar, por esta razon para ejecutar comandos como el usuario root, se usa la palabra clave `sudo`.

## Manejo de paquetes

los manejadores de paquetes dependen del sistema operativo y del software ya que exsiten manejadores de paquetes especificos para ciertos lenguages

manejadores de paquetes dependen de la distribucion

`apt` en distribuciones de debian
`zypper` en distribuciones de SUSE
`rpm` es universal pero mas rustico

### Apt

es el manejador de paquetes de bash en debian

instalar

```sh
apt install $nombre_paquete
```

## Comprimir archivos

comprimir un archivo

```sh
gzip $nombre_archivo
```

descomprimir un archivo

```sh
gzip -d $nombre_archivo
```

el archivo resultante sera un `.gz`

Agrupar **grupos** de arhivos con **Tar**

```sh
tar cf $detino.tar $arhivos_a_comprimir
```

ver contenido del .tar

```sh
tar tf $nombre_de_archivo_comprimido
```

descomprimir el tar

```sh
tar xf $nombre_del_tar
```

Agrupar y comprimir archivos en una sola instruccion

```sh
tar czf backup.tgz backup/*
```

descomprimir y desagrupar los archivos tgz

```sh
tar xzf backup.tgz
```

## Busqueda de archivos

### locate

```sh
locate $nombre_archivo
```

locate depende de una base de datos interna que debe ser actualizada periodicamente

para actulizarla manualmente usar

```sh
sudo updatedb
```

es muy buena y eficiente, pero para archivos nuevos debe ser actualizada primero

### whereis

muestra ubicacion de un comando

ejemplo

```sh
whereis echo
```

### find

permite buscar en directorios especificos con mas parametros.

**ejemplos:**
encuentra en el directorio actual los arhivos del usuario luis con los permisos 644

```sh
find . -user luis -perm 644
```

encuentra los archivos tipo file que fueron modificados hace mas de 7 dias

```sh
find . -type f -mtime +7
```

ejecutar mas comandos como copiar a los archivos encontrados, donde `{}` representa el nombr del archivo

```sh
find . -type f -mtime +7 -exec cp {} ./seven_days_backup/ \;
```

#### Find un comando con mucho poder 💪

find [ruta][expresión_de_búsqueda][acción]

#### Ruta

Si no se indica una ruta se toma en cuenta entonces el directorio donde se este actualmente, es decir el directorio de trabajo actual, que es lo mismo que indicar con un punto “.”.

Es posible asignar mas de una ruta de búsqueda también como por ejemplo

```sh
find /etc /usr /var -groupadmin
```

#### Búsquedas básicas 👍

Algunas banderas que podemos utilizar para buscar:

-name = Busca nombre de un archivo

iname = Igual que name pero este no toma en consideración si tiene alguna mayúscula

-user = El usuario propietario

-group = El grupo propietario

-type = tipo de archivo, f para directorios

#### Búsquedas a través del tiempo ⏰

-mmin = Tiempo en minutos

-mtime = Periodos de 24 horas

-exec; El poder aumenta 👊

-exec Permite ejecutar acciones sobre el resultado de cada línea o archivo devuelto por find, ejemplo:

find . type -f mtime +7 -exec cp {} ./backup/ \;

## Herramientas para interactuar a través de HTTP

### curl

se utiliza para hacer pedidos crudos a un servidor

```sh
curl $url
```

muestra el contenido y las interacciones http

```sh
curl -v $url
```

guardar salida en un arhivo

```sh
curl -v $url > $arhivo
```

Nota archivo agujero negro de linux
`/dev/null` todo lo que se escribe en el arhivo se borra de inmendiato

ver solo la salida http 

```sh
curl -v https://platzi.com > /dev/null
```

### wget

realiza descargas desde servidores http

descargar un archivo desde su url

```sh
wget $url_del_archivo
```

## Acceso a computadoras externas, conexion segura

### SSH

conectarse a un servidor remoto mediante un ssh

```sh
ssh $ssh_o_identificador_del_servidor_a_conectar
```

conectar mediante usuario
(este metodo pedira contraseña)

```sh
ssh 'id@server'
```

ver mis configuraciones ssh

```sh
cat ./ssh/config
```

**enviar correo** por la consola
para poder enviar un correo es necesario ciertas configuraciones especiales.

```sh
echo "probando" | mail -s "pruebas de curso platzi" luisrogelio98@gmail.com
```

## Variables de entorno

las variables de entorno se definen
con un $

```sh
echo $PATH
```

se pueden asignar para un comando o toda la sesion

para toda la sesion

```sh
export VAR=valor
```

donde **VAR** es el nombre de la variable

para un unico comando

```sh
VAR=valor $comando_a_ejecutar
```

## Automatizacion de tareas

scripting bash

bash no es solo un lenguaje de comandos, tambien es un lenguaje de programcion con el cual se pueden crear archivos `.sh` para ejecutar tareas especificas
