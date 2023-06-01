--Disparadores para la tabla 'habitacion'
--Disparador para inserción:

DELIMITER //
CREATE TRIGGER tr_insert_habitacion
AFTER INSERT ON habitacion
FOR EACH ROW
BEGIN
    INSERT INTO registro_habitaciones (id_habitacion, fecha_registro, tipo_registro)
    VALUES (NEW.idHabitacion, NOW(), 'Inserción');
END//
DELIMITER;

--Disparador para modificación:

DROP TRIGGER IF EXISTS tr_update_habitacion;
DELIMITER //
CREATE TRIGGER tr_update_habitacion
AFTER UPDATE ON habitacion
FOR EACH ROW
BEGIN
    INSERT INTO registro_habitaciones (id_habitacion, fecha_registro, tipo_registro)
    VALUES (OLD.idHabitacion, NOW(), 'Actualización');
END//

--Disparador para eliminación:

DELIMITER //
CREATE TRIGGER tr_delete_habitacion
AFTER DELETE ON habitacion
FOR EACH ROW
BEGIN
    INSERT INTO registro_habitaciones (id_habitacion, fecha_registro, tipo_registro)
    VALUES (OLD.idHabitacion, CURRENT_TIMESTAMP, 'Eliminación');
END //
DELIMITER ;

----------------------------------------------------------------------------------------------

--Disparadores para la tabla 'recepcionista':
--Disparador para inserción:

DELIMITER //
CREATE TRIGGER tr_insert_recepcionista
AFTER INSERT ON recepcionista
FOR EACH ROW
BEGIN
    INSERT INTO registro_recepcionista (id_recepcionista, fecha_registro, tipo_registro)
    VALUES (NEW.idRecepcionista, NOW(), 'Inserción');
END //
DELIMITER ;

--Disparador para modificación:

DROP TRIGGER IF EXISTS tr_update_recepcionista;
DELIMITER //
CREATE TRIGGER tr_update_recepcionista
AFTER UPDATE ON recepcionista
FOR EACH ROW
BEGIN
    INSERT INTO registro_recepcionista (id_recepcionista, fecha_registro, tipo_registro)
    VALUES (OLD.idRecepcionista, NOW(), 'Actualización');
END //
DELIMITER ;

--Disparador para eliminación:

DELIMITER //
CREATE TRIGGER tr_delete_recepcionista
AFTER DELETE ON recepcionista
FOR EACH ROW
BEGIN
    INSERT INTO registro_recepcionista (id_recepcionista, fecha_registro, tipo_registro)
    VALUES (OLD.idRecepcionista, CURRENT_TIMESTAMP, 'Eliminación');
END //
DELIMITER ;

---------------------------------------------------------------------------------------------

--Disparadores para la tabla 'huesped':
--Disparador para inserción:

DELIMITER //
CREATE TRIGGER tr_insert_huesped
AFTER INSERT ON huesped
FOR EACH ROW
BEGIN
    INSERT INTO registro_huesped (id_huesped, fecha_registro, tipo_registro)
    VALUES (NEW.idHuesped, NOW(), 'Inserción');
END //
DELIMITER ;

--Disparador para modificación:

ROP TRIGGER IF EXISTS tr_update_huesped;
DELIMITER //
CREATE TRIGGER tr_update_huesped
AFTER UPDATE ON huesped
FOR EACH ROW
BEGIN
    INSERT INTO registro_huesped (id_huesped, fecha_registro, tipo_registro)
    VALUES (OLD.idHuesped, NOW(), 'Actualización');
END //
DELIMITER;

--Disparador para eliminación:

DELIMITER //

CREATE TRIGGER tr_delete_huesped
AFTER DELETE ON huesped
FOR EACH ROW
BEGIN
    INSERT INTO registro_huesped (id_huesped, fecha_registro, tipo_registro)
    VALUES (OLD.idHuesped, CURRENT_TIMESTAMP, 'Eliminación');
END //
DELIMITER ;

------------------------------------------------------------------------------------ 

--Disparadores para la tabla 'servicio':
--Disparador para la inserción:

DELIMITER //
CREATE TRIGGER tr_insert_servicio
AFTER INSERT ON servicio
FOR EACH ROW
BEGIN
    INSERT INTO registro_servicio (id_servicio, fecha_registro, tipo_registro)
    VALUES (NEW.idServicio, NOW(), 'Inserción');
END //
DELIMITER ;

--Disparador para la modificación:

DROP TRIGGER IF EXISTS tr_update_huesped;
DELIMITER //
CREATE TRIGGER tr_update_servicio
AFTER UPDATE ON servicio
FOR EACH ROW
BEGIN
    INSERT INTO registro_servicio (id_servicio, fecha_registro, tipo_registro)
    VALUES (OLD.idServicio, NOW(), 'Actualización');
END //
DELIMITER;

--Disparador para la eliminación:

DELIMITER //
CREATE TRIGGER tr_delete_servicio
AFTER DELETE ON servicio
FOR EACH ROW
BEGIN
    INSERT INTO registro_servicio (id_servicio, fecha_registro, tipo_registro)
    VALUES (OLD.idServicio, CURRENT_TIMESTAMP, 'Eliminación');
END //
DELIMITER;

----------------------------------------------------------------------------------------

--Disparadores para la tabla 'metodopago':
--Disparador para inserción:

DELIMITER;
CREATE TRIGGER tr_insert_metodopago
AFTER INSERT ON metodopago
FOR EACH ROW
BEGIN
    INSERT INTO registro_metodopago (id_metodopago, fecha_registro, tipo_registro)
    VALUES (NEW.id_MetodoPago, NOW(), 'Inserción');
END //
DELIMITER ;

--Disparador para modificación:

DROP TRIGGER IF EXISTS tr_update_metodopago;
DELIMITER //
CREATE TRIGGER tr_update_metodopago
AFTER UPDATE ON metodopago
FOR EACH ROW
BEGIN
    INSERT INTO registro_metodopago (id_metodopago, fecha_registro, tipo_registro)
    VALUES (OLD.id_MetodoPago, NOW(), 'Actualización');
END //
DELIMITER ;

--Disparador para eliminación:

DELIMITER //
CREATE TRIGGER tr_delete_metodopago
AFTER DELETE ON metodopago
FOR EACH ROW
BEGIN
    INSERT INTO registro_metodopago (id_metodopago, fecha_registro, tipo_registro)
    VALUES (OLD.id_MetodoPago, CURRENT_TIMESTAMP, 'Eliminación');
END //
DELIMITER ;
------------------------------------------------------------------------------------------

--Disparadores para la tabla 'reserva':
--Disparador para inserción:

DELIMITER //
CREATE TRIGGER tr_insert_reserva
AFTER INSERT ON reserva
FOR EACH ROW
BEGIN
    INSERT INTO registro_reserva (id_reserva, fecha_registro, tipo_registro)
    VALUES (NEW.idReserva, NOW(), 'Inserción');
END //
DELIMITER ;

--Disparador para modificación:

DROP TRIGGER IF EXISTS tr_update_reserva;
DELIMITER //
CREATE TRIGGER tr_update_reserva
AFTER UPDATE ON reserva
FOR EACH ROW
BEGIN
    INSERT INTO registro_reserva (id_reserva, fecha_registro, tipo_registro)
    VALUES (OLD.idReserva, NOW(), 'Actualización');
END //
DELIMITER ;

--Disparador para eliminación:

DELIMITER //
CREATE TRIGGER tr_delete_reserva
AFTER DELETE ON reserva
FOR EACH ROW
BEGIN
    INSERT INTO registro_reserva (id_reserva, fecha_registro, tipo_registro)
    VALUES (OLD.idReserva, CURRENT_TIMESTAMP, 'Eliminación');
END //
DELIMITER ;

-----------------------------------------------------------------------------------

--Disparadores para la tabla 'reserva_servicio':
--Disparador para inserción:

DELIMITER //
CREATE TRIGGER tr_insert_reserva_servicio
AFTER INSERT ON reserva_servicio
FOR EACH ROW
BEGIN
    INSERT INTO registro_reserva_servicio (id_reserva_servicio, fecha_registro, tipo_registro)
    VALUES (NEW.idReserva_servicio, NOW(), 'Inserción');
END //
DELIMITER ;

--Disparador para modificación:


CREATE TRIGGER tr_update_reserva_servicio
AFTER UPDATE ON reserva_servicio
FOR EACH ROW
BEGIN
    INSERT INTO registro_reserva_servicio (id_reserva_servicio, fecha_registro, tipo_registro)
    VALUES (OLD.id_reserva_servicio, NOW(), 'Actualización');
END;

--Disparador para eliminación:
CREATE TRIGGER tr_delete_reserva_servicio
AFTER DELETE ON reserva_servicio
FOR EACH ROW
BEGIN
    INSERT INTO registro_reserva_servicio (id_reserva_servicio, fecha_registro, tipo_registro)
    VALUES (OLD.id_reserva_servicio, CURRENT_TIMESTAMP, 'Eliminación');
END;

--------------------------------------------------------------------------------------------------

--Disparadores para la tabla 'transaccion':
--Disparador para inserción:

CREATE TRIGGER tr_insert_transaccion
AFTER INSERT ON transaccion
FOR EACH ROW
BEGIN
    INSERT INTO registro_transaccion (id_transaccion, fecha_registro, tipo_registro)
    VALUES (NEW.id_transaccion, NOW(), 'Inserción');
END;

--Disparador para modificación:

CREATE TRIGGER tr_update_transaccion
AFTER UPDATE ON transaccion
FOR EACH ROW
BEGIN
    INSERT INTO registro_transaccion (id_transaccion, fecha_registro, tipo_registro)
    VALUES (OLD.id_transaccion, NOW(), 'Actualización');
END;

--Disparador para eliminación:

CREATE TRIGGER tr_delete_transaccion
AFTER DELETE ON transaccion
FOR EACH ROW
BEGIN
    INSERT INTO registro_transaccion (id_transaccion, fecha_registro, tipo_registro)
    VALUES (OLD.id_transaccion, NOW(), 'Eliminación');
END;
