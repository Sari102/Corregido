----------------------------------------------------------------------------------------------------------------------
--1. se Obtiene el nombre completo en una sola columna  de un huésped en base  a las columnas nombre y apellido 
SELECT nombre, apellido, CONCAT(nombre, ' ' ,apellido) AS 'Nombre completo' FROM huesped;
---------------------------------------------------------------------------------------------------------------------
-- 2 se obtine  el nombre completo de un recepcionista dado su ID

DELIMITER //
CREATE FUNCTION obtenerNombreCompletoRecepcionista(recepcionista_id INT) 
RETURNS VARCHAR(100)
BEGIN
    DECLARE nombreCompleto VARCHAR(100);
    SELECT CONCAT(nombre, ' ', apellido) INTO nombreCompleto
    FROM recepcionista
    WHERE idRecepcionista = recepcionista_id;
    RETURN nombreCompleto;
END //

SELECT obtenerNombreCompletoRecepcionista(2) 



-------------------------------------------------------------------------------------------------------------------------

--3 se obtiene  la fecha de las  reservas más reciente:
DELIMITER //
CREATE FUNCTION obtenerFechaReservaMasReciente() 
RETURNS DATE
BEGIN
    DECLARE fechaReserva DATE;
    SELECT MAX(fechaReserva) INTO fechaReserva
    FROM reserva;
    RETURN fechaReserva;
END; //

--llamo la funcion que CRee 

SELECT obtenerFechaReservaMasReciente() 
---------------------------------------------------------------------------------------------------------------------------------
-- 4 se obtine  el precio de un servicio dado su ID:
DELIMITER //
CREATE FUNCTION obtenerPrecioServicio(servicio_id INT)
RETURNS INT
BEGIN
    DECLARE precio INT;
    SELECT precio INTO precio
    FROM servicio
    WHERE idServicio = servicio_id;
    RETURN precio;
END//
------ consulta
SELECT obtenerPrecioServicio(1)
-----------------------------------------------------------------------------------------------------------------------------------

--5  Verificar si una reserva tiene servicios asociados, si tiene servicion  aparese un valor boolean =1 si no tien aparese 0:
DELIMITER //
CREATE FUNCTION verificarReservaConServicios(reserva_id INT) RETURNS BOOLEAN
BEGIN
    DECLARE tieneServicios BOOLEAN;
    SELECT EXISTS(
        SELECT 1
        FROM reserva_servicio
        WHERE idReserva = reserva_id
    ) INTO tieneServicios;
    RETURN tieneServicios;
END //


SELECT verificarReservaConServicios (1)
------------------------------------------------------------------------------------------------------------------------------

-- 6.se obtiene una subcadena desde una cierta posición se extrae los siguientes caracteres que definimos en el ultimo parametro.
SUBSTRING: 
SELECT descripcion AS 'servicio', SUBSTRING(descripcion, 1, 22) AS 'Subcadena servicio 'FROM servicio ;

-----------------------------------------------------------------------------------------------------------------------------

--7 se obtiene el total de transacciones realizadas:
DELIMITER //
CREATE FUNCTION obtenerTotalTransacciones()
RETURNS INT
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM transaccion;
    RETURN total;
END //

SELECT obtenerTotalTransacciones()
------------------------------------------------------------------------------------------------------------------------------

--8 se obtiene el precio total de una reserva:

DELIMITER //
CREATE FUNCTION obtenerPrecioTotalReserva(reserva_id INT) RETURNS INT
BEGIN
    DECLARE total INT;
    SELECT SUM(precio_total) INTO total
    FROM reserva_servicio
    WHERE idReserva = reserva_id;
    RETURN total;
END//

SELECT obtenerPrecioTotalReserva(reserva_id INT)

---------------------------------------------------------------------------------------------------------------------------------
--9 se obtien  la lista de servicios asociados a una reserva:

DELIMITER $$
CREATE PROCEDURE obtenerServiciosPorReserva(reserva_id INT)
BEGIN
    SELECT s.nombre, rs.cantidad, rs.precio_total
    FROM reserva_servicio rs
    INNER JOIN servicio s ON rs.idServicio = s.idServicio
    WHERE rs.idReserva = reserva_id;
END $$

SELECT obtenerServiciosPorReserva(1)
------------------------------------------------------------------------------------------------------------------------------------
--10  Procedimiento para actualizar la disponibilidad de una habitación

DELIMITER //
CREATE PROCEDURE actualizarDisponibilidad(IN idHabitacion INT, IN disponibilidad BOOLEAN)
BEGIN
    UPDATE habitacion SET disponibilidad = disponibilidad 
    WHERE idHabitacion = idHabitacion;
END //
DELIMITER ;

CALL actualizarDisponibilidad(IN idHabitacion INT, IN disponibilidad BOOLEAN)
----------------------------------------------------------------------------------------------------



---------------------------------------------------------------------------------------------------------

---------- vistas ....................................
CREATE VIEW vista_reservas AS 
SELECT idReserva, fechaReserva, fechaLlegada, fechaSalida, idHabitacion, idHuesped, idRecepcionista 
FROM reserva;

CREATE VIEW vista_metodos_pago AS 
SELECT id_MetodoPago, identificado, idTransaccion 
WHERE metodopago < 20.000; 
FROM metodopago;

CREATE VIEW vista_hospedaje AS 
SELECT idHospeda, idReserva, idHuesped, idHabitacion, fechaLlegada, fechaSalida 
FROM hospeda;

CREATE VIEW vista_transacciones AS 
SELECT idTransaccion, fechaTransac, total, idMetodoPago, idReserva 
FROM transaccion;

CREATE VIEW vista_metodos_pago AS 
SELECT id_MetodoPago, nombre 
FROM metodopago;

CREATE VIEW vista_servicios AS 
SELECT idServicio, nombre, descripcion, precio 
FROM servicio;

CREATE VIEW vista_reservas_servicios AS 
SELECT idReserva, idServicio, cantidad, precio_total 
FROM reserva_servicio;

CREATE VIEW vista_habitaciones AS 
SELECT idHabitacion, tipoHabitacion, disponibilidad, precioNoche, numero 
FROM habitación;

CREATE VIEW vista_recepcionistas AS 
SELECT idRecepcionista, nombre, apellido, correo 
FROM recepcionista;

CREATE VIEW vista_huespedes AS 
SELECT idHuesped, nombre, apellido, correo 
FROM huesped;

CREATE VIEW vista_reservas_completas AS 
SELECT r.idReserva, r.fechaReserva, r.fechaLlegada, r.fechaSalida, h.tipoHabitacion, h.precioNoche, h.numero, hs.idHuesped, hs.nombre, hs.apellido, hs.correo, rc.idRecepcionista, rc.nombre, rc.apellido, rc.correo, t.idTransaccion, t.fechaTransac, t.total, mp.id_MetodoPago, mp.nombre 
FROM reserva r 
INNER JOIN hospeda hs ON r.idReserva = hs.idReserva 
INNER JOIN habitación h ON hs.idHabitacion = h.idHabitacion 
INNER JOIN recepcionista rc ON r.idRecepcionista = rc.idRecepcionista 
INNER JOIN transaccion t ON r.idReserva = t.idReserva 
INNER JOIN metodopago mp ON t.idMetodoPago = mp.id_MetodoPago;


------------------------------------------------------------------------------------------------------------------------------

