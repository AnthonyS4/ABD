

create table Rol(
    id int auto_increment,
    nombre varchar(16) not null,
    primary key(id)
);

create table Permiso(
    id int auto_increment,
    nombre varchar(32) not null unique,
    primary key(id)
);

create table Curso(
    id int auto_increment,
    codigo varchar(10) not null,
    nombre varchar(64) not null,
    año varchar(4) not null,
    primary key(id)
);

create table Usuario(
    id int auto_increment,
    nombre_usuario varchar(16) not null unique,
    contraseña varchar(32) not null,
    nombre varchar(32) not null,
    apellidos varchar(32) not null,
    dni varchar(10) not null unique,
    fecha_nacimiento date not null,
    id_rol int not null,
    primary key(id)
);

create table Nota_Final(
    id int auto_increment,
    id_usuario int not null,
    id_curso int not null,
    puntuacion int not null,
    definitiva boolean default false,
    primary key(id)
);

create table Nota_Examen(
    id int auto_increment,
    id_usuario int not null,
    id_curso int not null,
    nota int not null,
    fecha date not null,
    primary key(id)
);

create table Usuario_Curso(
    id_usuario int not null,
    id_curso int not null,
    primary key(id_usuario, id_curso)
);

create table Parte(
    id int auto_increment,
    id_usuario int not null,
    descripcion text character set ujis,
    fecha date not null,
    primary key(id)
);

create table Ausencia(
    id int auto_increment,
    id_usuario int not null,
    id_curso int not null,
    fecha date not null,
    justificada boolean default false,
    primary key(id)
);

create table Usuario_Permiso(
    id_usuario int not null,
    id_rol int not null,
    primary key(id_usuario, id_rol) 
);

--#Crear claves foraneas para Usuario
alter table Usuario add foreign key (id_rol) references Rol(id);

--#Crear claves foraneas para Nota_Final
alter table Nota_Final add foreign key (id_usuario) references Usuario(id);
alter table Nota_Final add foreign key (id_curso) references Curso(id);

--#Crear claves foraneas para Nota_Examen
alter table Nota_Examen add foreign key (id_usuario) references Usuario(id);
alter table Nota_Examen add foreign key (id_curso) references Curso(id);

--#Crear claves foraneas para Usuario_Curso
alter table Usuario_Curso add foreign key (id_usuario) references Usuario(id);
alter table Usuario_Curso add foreign key (id_curso) references Curso(id);

--#Crear claves foraneas para Parte
alter table Parte add foreign key (id_usuario) references Usuario(id);

--#Crear claves foraneas para Ausencia
alter table Ausencia add foreign key (id_usuario) references Usuario(id);
alter table Ausencia add foreign key (id_curso) references Curso(id);

--#Crear claves foraneas para Usuario_Curso
alter table Usuario_Curso add foreign key (id_usuario) references Usuario(id);
alter table Usuario_Curso add foreign key (id_curso) references Curso(id);

--#Crear claves foraneas para Usuario_Permiso
alter table Usuario_Permiso add foreign key (id_usuario) references Permiso(id);
alter table Usuario_Permiso add foreign key (id_rol) references Rol(id);
