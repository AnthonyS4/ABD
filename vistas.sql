--Vista 1
CREATE VIEW usuario_notasexamen
AS SELECT u.id ID, u.nombre Nombre, u.apellidos Apellidos, c.nombre Curso, n.nota Nota
FROM Usuario u, Nota_Examen n, Curso c;

--Vista 2
CREATE VIEW usuario_parte
AS SELECT u.id ID, u.nombre Nombre, u.apellidos Apellidos, p.descripcion Descripcion, p.fecha Fecha
FROM Usuario u, Parte p;

--Vista 3
CREATE VIEW usuario_ausencia
AS SELECT u.id ID, u.nombre Nombre, u.apellidos Apellidos, a.fecha Fecha, a.justificada Justificada
FROM Usuario u, Ausencia a;
