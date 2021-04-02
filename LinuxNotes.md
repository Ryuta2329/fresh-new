---
 title: "Computational Biology: Linux Notes."
 author: "Well, me! Duh!"
 date: 
---


Puedes saber que usuario estas usando desde la terminal corriendo el comando `whoami`.

En la terminal se escriben comandos como `date`. Los resultados de los comandos se pueden guardar con en un archivo usando `>` seguido de un nombre de archivo (el archivo es creado si no existe) o pueden anexarse a un documento existente usando `>>`. El archivo creado luego puee leerse usando `cat` seguido del nombre del archivo.

Para saber en que directorio te encuentras en la terminal puedes usar `pwd` el cual regresa el directorio actual (usualmente, al iniciar, este directorio es `/home/username/`). Luego, puedes usar el comando `ls` para saber que hay en el directorio (regresa una lista donde se muestran los nombres de directorios y archivos presentes el directorio actual). Para crear nuevos directorios se utiliza `mkdir`. Directories are named child and parent depending if one is a (sub)folder of the other folder (parent directoriy). Para crear un directorio escondido (*hidden*) se coloca un punto `.` antes del nombre del directorio (sin espacios). Los directorios escondidos no son enlistados usando el comando `ls` a menos que uses la opcion `-a` (por *all*). Tambien es posible usar la opcion `-l` con `ls` de forma que los directorios y archivos son enlistados con infomracion adicional (como el tamao del directorio en kB). Cada directorio es mostrado con sus atributos: tipo de archivo (directorio `d`, arcchivo `-`, u otro), permisos, nodos, usuario, grupo, tamao, ultimo cambio realizado al directorio o archivo y el nombre. Existen alguno directorios especiales: *i)* `.` el cual es el directorio de trabajo, y *ii)* `..` es el nombre de la ruta relativa al directorio padre (este es util al realizar cambios de directorio usando `cd`). Puedes eliminar un directorio con todo su contenido usando `rm -r <name_directory>`. 

## Asociaciones de archivo.

Puedes verificar la identidad tuya en la terminal usando `id`. Puedes cambiar los atributos de un archivo usando `chmod`. Para cambiar los permisos de un archivo para un usuario, grupo, otros usuarios, o para todos, se usan las categorias `u`, `g`, `o`, y `a`, respectivamente, seguido del permiso: si se desea quitar un permiso se usa `-` y se desea dar un permiso se usa `+` (p. ej. si quieres quitar permisos de escritura a otros usuarios se usa `chmod o-w <file_name>`). Si se van a realizar cambios a mas de un propietario, se usa una lista separada por coma (p. ej. `chmod g-w, o+w <file_name>`). Las entradas tambien se peuden combinar si los permisos que se cambiaran son compartidos por mas de una categoria (como en `ug+rw`). 

Tambien hay un codigo numerico para realizar el cambio de permisos, donde `r` es 4, `w` es 2 y `x` es 1. Y los permisos se calculan usando la suma de estos numeros (0 es que no se tiene permiso). Por ejemplo, un 764 significa que el usuario tiene permisos `rwx`, el grupo tiene permisos `rw` solamente, y los otros usuarios solo permiso `r`.

`man chattr` (busca sobre esto).

## Archivando archivos. Comprimiendo.

En Windows es sencillo hacerlo usando *WinZip*. En Linux, se dbe crear primero un archivo de archivos o directorios y luego comprimirlo. El comando para crear y extraer un archivo es `tar` (*tape archive*, porque se trata de crear un archivo y almacenarlo en una cinta). 

*Falta*

## Buscando archvios.

Se usa el comando `find` seguido del directorio y los atributos. Tambien se pueden especificar algunas opciones como `-type` (`f` para archivos y `d` para directorios) o `-name` (hay otras opciones disponibles. usa `man find` para saber mas). Por ejemplo, el comando `find find-test -type f -size -6 -name "[0-9]*" -name "*.txt" -exec cp {} find-found \;`, busca un archivo (`-type f`) llamado `find-test`, con un tamao de 6 veces 512 bytes (`-size -6`) y con un nombre que contiene algun(os) numero(s) (dado por el patron `[0-9]*`) y que termina en `.txt` (dado por la segunda aparicion de `-name`), y luego se apica el comando `cp` para copiar este  archivo en el directorio `find-found` (dado por la opcion `-exec cp {} find/found \`).

### Ejercicios

Using the cd and the ls commands, go through all directories on your
computer and draw a directory tree. Note: You may not have permission to
read all directories. Which are these?

4.5. What permissions do you have on the /etc directory and the /etc/passwd
file? List all the files and directories in your /home directory. Who has which
rights on these files, and what does that mean? Print the content of the file
/etc/passwd onto the screen.

Create a new directory and move into it with a one-liner.

Create the directory testpress in your home directory. Within testpress
create 3 filled files (redirect manpages into the files). From your home direc-
tory use the commands (un)compress, (un)zip, g(un)zip and b(un)zip2
to compress and uncompress the whole directory content (use the option -r
(recursively)), respectively. What does the compressed directory look like?

Play around with the find command. Create directories, subdirectories
and files and try out different attributes to find files.