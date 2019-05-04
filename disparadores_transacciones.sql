--Disparadores
--Este disparados restringe los valores de rol que adquiere un usuario
delimiter //
create trigger rol_range before insert on Usuario for each row
begin
if NEW.id_rol < 0 or NEW.id_rol > 5 then set NEW.id_rol = 1;
end if;
end //


--Este disparador obliga a meter un dni con 9 caracteres.
--Para ello comprobaremos el tamaño, en caso de que sea distinto a 9
-- asingamos a dni el valor null para que la restriccion de NOT NULL de dni
-- en la tabla Usuario detenga el insert.
delimiter //
create trigger dni_length before insert on Usuario for each row
begin 
if length(NEW.dni) <> 9 then set NEW.dni = NULL;
end if;
end //


--#Transaccion 1
start transaction;
--#Obtener el id del ultimo usuario.
select 
    @last_id = max(id)
from Usuario;
--#Guardar nuevo usuario
insert into Usuario values 
(@last_id + 1, 'u49168192', 'c712942', 'Adrian', 'Castillo Pineda', '48658192H', '1997/12/12', 1);
commit;

--#Transaccion 2
start transaction;
--#Obtener el id de un nombre de usuario dado
set @identificador = (select id from Usuario where nombre_usuario = 'u49168192');
--#Borrar su usuario
delete from Usuario where id = @identificador;
commit;

--#Transaccion 3 : Poner 4 en todas las notas del alumno 2
start transaction;
--#Obtener id del usuario dado
set @identificador = (select id from Usuario where nombre = 'Isabel del Pilar' and apellidos = 'Duran Chumillas');
--#Modificar usuario
update nota_examen set nota = 4 where id_usuario = 2;
commit;

