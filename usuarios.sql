CREATE USER 'principal'@'localhost' identified by 'principal';
CREATE USER 'colaborador'@'localhost' identified by 'colaborador';
CREATE USER 'eventual'@'localhost' identified by 'eventual';
CREATE USER 'junior'@'localhost' identified by 'junior';
CREATE USER 'externo'@'localhost' identified by 'externo';

GRANT ALL PRIVILEGES ON * to 'principal'@'localhost';
GRANT SELECT, UPDATE, INSERT ON * to 'colaborador'@'localhost';
GRANT SELECT ON * to 'eventual'@'localhost';
GRANT SELECT, UPDATE ON Ausencia to 'junior'@'localhost';
GRANT SELECT ON Usuario to 'externo'@'localhost';
GRANT SELECT ON Nota_Examen to 'externo'@'localhost';
GRANT SELECT ON Nota_Final to 'externo'@'localhost';
GRANT SELECT ON Ausencia to 'externo'@'localhost';
GRANT SELECT ON Parte to 'externo'@'localhost';
