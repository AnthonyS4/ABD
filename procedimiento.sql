delimiter //
CREATE PROCEDURE showAllUserCourses(IN idUsuario INT)
BEGIN
SELECT * FROM Curso WHERE id IN (SELECT id_curso FROM Usuario_Curso WHERE id_usuario IN (SELECT id FROM Usuario WHERE id = idUsuario));
END
//
