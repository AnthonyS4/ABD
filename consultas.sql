--#Cuando se realizan consultas de usuario a partir de su nombre y apellidos
--#Original
select id, nombre_usuario from Usuario where nombre = 'Anthony Smith' and apellidos = 'Quispe de la Cruz';
--#Optimizado
select id, nombre_usuario from Usuario where all(nombre = 'Anthony Smith', apellidos = 'Quispe de la Cruz');

--#Consulta : Todos los usuarios que hayan nacido entre de 1999 ~ 1996 y que tengan rol 1.
select id, nombre_usuario, nombre, apellidos from Usuario where 
    all(fecha_nacimiento <= '1999/12/31', fecha_nacimiento >= '1996/01/01', id_rol = 1);




