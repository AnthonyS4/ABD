--#Valores para Rol
insert into Rol(nombre) values ('Colaborador');
insert into Rol(nombre) values ('Eventual');
insert into Rol(nombre) values ('Junior');
insert into Rol(nombre) values ('Externo');
insert into Rol(nombre) values ('Principal');

--#Valores para Curso
insert into Curso(codigo, nombre, año) values (1496, 'Administración de bases de datos', '2018');
insert into Curso(codigo, nombre, año) values (1497, 'Diseño de Algoritmos', '2018');
insert into Curso(codigo, nombre, año) values (1498, 'Proyectos Informáticos', '2018');
insert into Curso(codigo, nombre, año) values (1499, 'Seguridad en Sistemas Informáticos', '2018');
insert into Curso(codigo, nombre, año) values (1500, 'Procesadores de Lenguajes', '2018');

--#Valores para usuario
insert into Usuario(nombre_usuario, contraseña, nombre, apellidos, dni, fecha_nacimiento, id_rol)
 values ('u49569979', 'c107524', 'Anthony Smith', 'Quispe de la Cruz' ,'49569979B', '1997-03-12', 1);

insert into Usuario(nombre_usuario, contraseña, nombre, apellidos, dni, fecha_nacimiento, id_rol)
 values ('u49569982', 'c071629', 'Isabel del Pilar', 'Duran Chumillas', '49569982', '1997-04-30', 1);

--#Valores para Nota_Final
insert into Nota_Final(id_usuario, id_curso, puntuacion) values (3, 1, 7);
insert into Nota_Final(id_usuario, id_curso, puntuacion) values (4, 1, 8);
insert into Nota_Final(id_usuario, id_curso, puntuacion) values (3, 2, 5);
insert into Nota_Final(id_usuario, id_curso, puntuacion) values (4, 2, 6);
insert into Nota_Final(id_usuario, id_curso, puntuacion) values (3, 3, 7);
insert into Nota_Final(id_usuario, id_curso, puntuacion) values (4, 3, 8);

--#Valores para Permisos
insert into Permiso(nombre) values ('rw');
insert into Permiso(nombre) values ('r');
insert into Permiso(nombre) values ('w');

--#Valores para Usuario_Permiso, ¿Pero esto no deberia ser que un usuario tenga X permisos sobre un curso dado o sobre X tabla?
--insert into Usuario_Permiso(id_usuario, id_rol) values ();

--#Valores para Nota_Examen
insert into Nota_Examen(id_usuario, id_curso, nota, fecha) values (1, 1, 5,'2019-06-14');
insert into Nota_Examen(id_usuario, id_curso, nota, fecha) values (2, 2, 5, '2019-06-13');
insert into Nota_Examen(id_usuario, id_curso, nota, fecha) values (1, 2, 8, '2019-06-19');
insert into Nota_Examen(id_usuario, id_curso, nota, fecha) values (2, 1, 8, '2019-06-19');

--#Valores para Usuario_Curso
insert into Usuario_Curso(id_usuario, id_curso) values (1, 1);
insert into Usuario_Curso(id_usuario, id_curso) values (2, 1);
insert into Usuario_Curso(id_usuario, id_curso) values (1, 2);
insert into Usuario_Curso(id_usuario, id_curso) values (2, 2);
 
--#Valores para Parte
insert into Parte(id_usuario, descripcion, fecha) values (1, '彼は非常にひどく振る舞いました', '2010-05-04');
insert into Parte(id_usuario, descripcion, fecha) values (2, '彼は非常にひどく振る舞いました', '2010-05-04');
insert into Parte(id_usuario, descripcion, fecha) values (2, '彼は非常にひどく振る舞いました', '2010-05-05');

--#Valores para Ausencia
insert into Ausencia(id_usuario, id_curso, fecha) values (1, 1, '2019-01-12');
insert into Ausencia(id_usuario, id_curso, fecha) values (2, 2, '2019-01-12');


--#Valores para Usuario_Permiso
insert into Usuario_Permiso(id_usuario, id_rol) values (1, 1);
insert into Usuario_Permiso(id_usuario, id_rol) values (2, 1);

