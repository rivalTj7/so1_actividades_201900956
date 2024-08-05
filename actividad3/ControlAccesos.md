# CONTROL DE ACCESOS

## Parte 1: Gestión de Usuarios

#### 1. Creación de Usuarios: Crea tres usuarios llamados `usuario1`, `usuario2` y `usuario3`.
```shell
    sudo useradd -m usuario1
    sudo useradd -m usuario2
    sudo useradd -m usuario3
```

#### 2. Asignación de Contraseñas: Establece una nueva contraseñas para cada usuario creado.
```shell
    sudo passwd usuario1
    sudo passwd usuario2
    sudo passwd usuario3
```

#### 3. Información de Usuarios: Muestra la información de `usuario1` usando el comando `id`.
```shell
    id usuario1
    id usuario2
    id usuario3
```

#### 4. Eliminación de Usuarios: Elimina `usuario3`, pero conserva su directorio principal.

```shell
    userdel usuario3
```
## Parte 2: Gestión de Grupos

#### 1. Creación de Grupos: Crea dos grupos llamados `grupo1` y `grupo2`.
```shell
    groupadd grupo1
    groupadd grupo2
```


#### 2. Agregar Usuarios a Grupos: Agrega `usuario1` a `grupo1` y `usuario2` a `grupo2`.
```shell
    usermod -aG grupo1 usuario1
    usermod -aG grupo2 usuario2
```

#### 3. Verificar Membresía: Verifica que los usuarios han sido agregados a los grupos utilizando el comando `groups`.
```shell
    groups usuario1
    groups usuario2
```


#### 4. Eliminar Grupo: Elimina `grupo2`.
```shell
    groupdel grupo2
```

## Parte 3: Gestión de Permisos


#### 1. Creación de Archivos y Directorios: Como `usuario1`, crea un archivo llamado `archivo1.txt` en su directorio principal y escribe algo en él. Crea un directorio llamado `directorio1` y dentro de ese directorio, un archivo llamado `archivo2.txt`.
```shell
    sudo su - usuario1
    nano archivo1.txt
    ---- Este es un ejemplo de archivo del usuario 1
    mkdir directorio1
    cd directorio1
    nano archivo2.txt
    ---- Este es el segundo archivo que se encutra dentro de directorio1 del usuario1
```


#### 2. Verificar Permisos: Verifica los permisos del archivo y directorio usando el comando `ls -l` y `ls -ld` respectivamente.

```shell
    ls -l archivo1.txt
    ls -ld directorio1
    ls -l directorio1/archivo2.txt
```

#### 3. Modificar Permisos usando `chmod` con Modo Numérico: Cambia los permisos del `archivo1.txt` para que sólo `usuario1` pueda leer y escribir (permisos `rw-`), el grupo pueda leer (permisos `r--`) y nadie más pueda hacer nada.
```shell
    chmod 640 archivo1.txt
```


#### 4. Modificar Permisos usando `chmod` con Modo Simbólico: Agrega permiso de ejecución al propietario del `archivo2.txt`.
```shell
    chmod u+x directorio1/archivo2.txt
```

#### 5. Cambiar el Grupo Propietario: Cambia el grupo propietario de `archivo2.txt` a `grupo1`.
```shell
    chgrp grupo1 directorio1/archivo2.txt
```

#### 6. Configurar Permisos de Directorio: Cambia los permisos del `directorio1` para que sólo el propietario pueda entrar (permisos `rwx`), el grupo pueda listar contenidos pero no entrar (permisos `r--`), y otros no puedan hacer nada.
```shell
    chmod 744 directorio1
```

#### 7. Comprobación de Acceso: Intenta acceder al `archivo1.txt` y `directorio1/archivo2.txt` como `usuario2`. Nota cómo el permiso de directorio afecta el acceso a los archivos dentro de él.
```shell
    sudo su - usuario2
    cat /home/usuario1/archivo1.txt
    cat /home/usuario1/directorio1/archivo2.txt
```
#### 8. Verificación Final: Verifica los permisos y propietario de los archivos y directorio nuevamente con `ls -l` y `ls -ld`.
```shell
    sudo su - usuario1
    ls -l ~/archivo1.txt
    ls -ld ~/directorio1
    ls -l ~/directorio1/archivo2.txt
```
