-- macrologistic.tb_usuarios definition

CREATE TABLE `tb_usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  `id_padre` int DEFAULT '0',
  `nombre_empresa` varchar(245) DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_idioma` int DEFAULT '1',
  `modo` varchar(45) DEFAULT 'sun',
  `id_bookind_driver` varchar(100) DEFAULT NULL,
  `id_booking_pais` int DEFAULT '789',
  `id_booking_zona` int DEFAULT NULL,
  `id_booking_ciudad` int DEFAULT NULL,
  `id_ubicacion` int DEFAULT NULL,
  `tipo_ubicacion` int DEFAULT NULL,
  `estado` int NOT NULL DEFAULT '2' COMMENT '1 Activo\\\\\\\\r\\\\\\\\n2 Inactivo\\\\\\\\r\\\\\\\\n0 Eliminado',
  `token` varchar(300) DEFAULT NULL,
  `cod_empresa` int DEFAULT NULL,
  `fecha_creado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_eliminado` timestamp NULL DEFAULT NULL,
  `fecha_editado` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `tb_usuarios_id_rol_IDX` (`id_rol`) USING BTREE,
  KEY `tb_usuarios_cod_empresa_IDX` (`cod_empresa`) USING BTREE,
  KEY `tb_usuarios_id_ubicacion_IDX` (`id_ubicacion`) USING BTREE,
  KEY `tb_usuarios_id_idioma_IDX` (`id_idioma`) USING BTREE,
  CONSTRAINT `tb_usuarios_tb_roles_FK` FOREIGN KEY (`id_rol`) REFERENCES `tb_roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;


CREATE TABLE `tb_chofer` (
  `id_chofer` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_transporte` int NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `fecha_creado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_creado` int DEFAULT NULL,
  `fecha_editado` timestamp NULL DEFAULT NULL,
  `usuario_editado` int DEFAULT NULL,
  `fecha_eliminado` timestamp NULL DEFAULT NULL,
  `usuario_elimando` int DEFAULT NULL,
  PRIMARY KEY (`id_chofer`),
  KEY `tb_chofer_id_usuario_IDX` (`id_usuario`) USING BTREE,
  KEY `tb_chofer_tb_transportes_FK` (`id_transporte`),
  CONSTRAINT `tb_chofer_tb_transportes_FK` FOREIGN KEY (`id_transporte`) REFERENCES `tb_transportes` (`id_transporte`),
  CONSTRAINT `tb_chofer_tb_usuarios_FK` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;


-- macrologistic.tb_reservas definition

CREATE TABLE `tb_reservas` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `cod_empresa` int DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `id_cliente` int DEFAULT '0',
  `tipo_tarea` int DEFAULT NULL,
  `tipo_reserva` int DEFAULT NULL,
  `id_tipo_transporte` int DEFAULT NULL,
  `id_transporte` int DEFAULT '0',
  `id_chofer` int DEFAULT '0',
  `punto_inicio` varchar(255) DEFAULT NULL,
  `descripcion_inicio` varchar(250) DEFAULT NULL,
  `punto_fin` varchar(255) DEFAULT NULL,
  `descripcion_fin` varchar(250) DEFAULT NULL,
  `cantidad_escalas` varchar(45) DEFAULT NULL,
  `observacion` varchar(900) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `estado` enum('ELIMINADO','POR_ASIGNAR','ASIGNADO','NOTIFICADO','ACEPTADO','RECHAZADO','ANULADO','EN_PROCESO','FINALIZADO') DEFAULT 'POR_ASIGNAR' COMMENT '1 Activo\\\\n2 Inactivo\\\\n0 Eliminado',
  `proceso` enum('PENDIENTE','COMENZADO','PUNTO_INICIO_FINALIZADO','PUNTO_ESCALA','PUNTO_FIN_FINALIZADO','ANULADO','FINALIZADO') DEFAULT 'PENDIENTE',
  `proceso_producto` varchar(245) DEFAULT NULL,
  `hora_iniciada` timestamp NULL DEFAULT NULL,
  `hora_finalizada` timestamp NULL DEFAULT NULL,
  `id_unidad_medida` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `id_tipo_carga` int DEFAULT NULL,
  `id_sub_carga` int DEFAULT NULL,
  `id_iva` int DEFAULT NULL,
  `sub_total` double DEFAULT '0',
  `iva` double DEFAULT '0',
  `total` double DEFAULT '0',
  `id_tipo_pago` int DEFAULT NULL,
  `km` varchar(45) DEFAULT NULL,
  `tiempo` varchar(45) DEFAULT NULL,
  `fecha_creado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_creado` int DEFAULT '0',
  `fecha_editado` timestamp NULL DEFAULT NULL,
  `usuario_editado` int DEFAULT NULL,
  `fecha_notificado` timestamp NULL DEFAULT NULL,
  `usuario_notificado` int DEFAULT NULL,
  `fecha_anulada` timestamp NULL DEFAULT NULL,
  `usuario_anulada` int DEFAULT NULL,
  `observacion_anulada` varchar(900) DEFAULT NULL,
  `notificar_anulada` int DEFAULT '0',
  `fecha_notificar_anulada` timestamp NULL DEFAULT NULL,
  `fecha_reasignado` timestamp NULL DEFAULT NULL,
  `usuario_reasignado` int DEFAULT NULL,
  `notificar_reasignado` int DEFAULT '0',
  `fecha_notificar_reasignado` timestamp NULL DEFAULT NULL,
  `fecha_eliminado` timestamp NULL DEFAULT NULL,
  `usuario_eliminado` int DEFAULT NULL,
  PRIMARY KEY (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb3;

-- macrologistic.tb_bodegas definition


CREATE TABLE `tb_detalle_reservas` (
  `id_detalle_reserva` int NOT NULL AUTO_INCREMENT,
  `id_reserva` int NOT NULL,
  `id_transporte` int DEFAULT NULL,
  `latitud_origen` varchar(45) DEFAULT NULL,
  `longitd_origen` varchar(45) DEFAULT NULL,
  `latitud_intermedio` varchar(45) DEFAULT NULL,
  `longitud_intermedio` varchar(45) DEFAULT NULL,
  `latitud_destino` varchar(45) DEFAULT NULL,
  `longitud_destino` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_reserva`),
  KEY `tb_detalle_reservas_id_reserva_IDX` (`id_reserva`) USING BTREE,
  CONSTRAINT `tb_detalle_reservas_tb_reservas_FK` FOREIGN KEY (`id_reserva`) REFERENCES `tb_reservas` (`id_reserva`)
)  ENGINE=InnoDB AUTO_INCREMENT=475 DEFAULT CHARSET=utf8mb3;

-- macrologistic.tb_clase_transporte definition

CREATE TABLE `tb_clase_transporte` (
  `id_clase_transporte` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_transporte` int DEFAULT NULL,
  `estado` int DEFAULT '1' COMMENT '1 Activo\n2 Inactivo\n0 Eliminado',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_editado` timestamp NULL DEFAULT NULL,
  `fecha_eliminado` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_clase_transporte`),
  KEY `id_tipo_transporte_idx` (`id_tipo_transporte`),
  CONSTRAINT `id_tipo_transporte` FOREIGN KEY (`id_tipo_transporte`) REFERENCES `tb_tipo_transportes` (`id_tipo_transporte`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Documentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE `bookings` (

)



CREATE TABLE `tb_eventos_conductor` (
  `id_evento_conductor` int NOT NULL AUTO_INCREMENT,
  `id_reserva` int NOT NULL,
  `id_conductor` int NOT NULL,
  `tipo_evento` varchar(255) NOT NULL,
  `fecha_hora_evento` datetime NOT NULL,
  PRIMARY KEY (`id_evento_conductor`),
  KEY `tb_eventos_conductor_id_reserva_IDX` (`id_reserva`) USING BTREE,
  KEY `tb_eventos_conductor_id_conductor_IDX` (`id_conductor`) USING BTREE,
  CONSTRAINT `tb_eventos_conductor_tb_reservas_FK` FOREIGN KEY (`id_reserva`) REFERENCES `tb_reservas` (`id_reserva`),
  CONSTRAINT `tb_eventos_conductor_tb_conductores_FK` FOREIGN KEY (`id_conductor`) REFERENCES `tb_conductores` (`id_conductor`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;


CREATE TABLE bookings_aceptados (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_reference VARCHAR(50),
  bookingReference VARCHAR(50),
  legId VARCHAR(50),
  state_hash VARCHAR(255),
  booked_date DATETIME,
  pickup_date_time DATETIME,
  price_amount DECIMAL(10, 2),
  price_currency VARCHAR(10),
  passenger_title VARCHAR(255),
  passenger_name VARCHAR(255),
  passenger_telephone_number VARCHAR(255),
  dropoff_latitude DECIMAL(9, 6),
  dropoff_longitude DECIMAL(9, 6),
  dropoff_address VARCHAR(255),
  pickup_latitude DECIMAL(9, 6),
  pickup_longitude DECIMAL(9, 6),
  pickup_address VARCHAR(255),
  booking_driver_id INT DEFAULT NULL,
  local_driver_id INT DEFAULT NULL,
  driver_id VARCHAR(255),
  driver_local_id INT DEFAULT NULL, 
  aceptado_por INT DEFAULT NULL,
  fecha_aceptacion DATETIME,
  cod_empresa INT DEFAULT NULL,
  id_user INT DEFAULT NULL
);


CREATE TABLE driver_asignado 
CREATE TABLE pickup_location (
  pickup_id INT AUTO_INCREMENT PRIMARY KEY,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(100),
  state VARCHAR(100),
  country VARCHAR(100),
  postal_code VARCHAR(20),
  latitude DECIMAL(9, 6),
  longitude DECIMAL(9, 6),
);

CREATE TABLE dropoff_location (
  dropoff_id INT AUTO_INCREMENT PRIMARY KEY,
  references INT,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(100),
  state VARCHAR(100),
  country VARCHAR(100),
  postal_code VARCHAR(20),
  latitude DECIMAL(9, 6),
  longitude DECIMAL(9, 6),
  reserva_booking_id INT

);


CREATE TABLE tb_driver_events(
  id_estado INT AUTO_INCREMENT PRIMARY KEY,
  nombre_estado_es VARCHAR(255) NOT NULL,
  nombre_estado_en VARCHAR(255) NOT NULL,
  
);

CREATE TABLE bookings_detalles (
  id_aceptacion INT AUTO_INCREMENT PRIMARY KEY,
  booking_id BIGINT,
  estado_id INT,
  fecha_aceptacion DATETIME,
  FOREIGN KEY (booking_id) REFERENCES bookings_aceptados(booking_id),
  FOREIGN KEY (estado_id) REFERENCES estados_booking(id_estado)
);

INSERT INTO estados_booking (nombre_estado_es, nombre_estado_en) VALUES
('CONDUCTOR_PARTIO_HACIA_RECOGIDA', 'DRIVER_DEPARTED_TO_PICKUP'),
('CONDUCTOR_LLEGO_A_RECOGIDA', 'DRIVER_ARRIVED_AT_PICKUP'),
('CONDUCTOR_REPORTA_NO_PRESENTACION', 'DRIVER_SUBMITTED_CUSTOMER_NO_SHOW'),
('CONDUCTOR_PARTIO_HACIA_DESTINO', 'DRIVER_DEPARTED_TO_DROPOFF'),
('CONDUCTOR_LLEGO_A_DESTINO', 'DRIVER_ARRIVED_AT_DROPOFF'),
('UBICACION_EN_VIVO_DEL_CONDUCTOR', 'DRIVER_LIVE_LOCATION');

CREATE TABLE tb_booking_driver_events (
  id INT AUTO_INCREMENT PRIMARY KEY,
  booking_id BIGINT NOT NULL,
  driver_event_id INT NOT NULL,
  id_driverbooking INT DEFAULT NULL,
  FOREIGN KEY (booking_id) REFERENCES bookings_aceptados(booking_id),
  FOREIGN KEY (driver_event_id) REFERENCES tb_driver_events(id_estado)
);

CREATE TABLE `tb_bookings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `cod_empresa` int NOT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `customer_reference` varchar(50) DEFAULT NULL,
  `leg_id` varchar(50) DEFAULT NULL,
  `booking_reference` varchar(50) DEFAULT NULL,
  `state_hash` varchar(100) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `price_amount` decimal(10,2) DEFAULT NULL,
  `price_currency` varchar(10) DEFAULT NULL,
  `customer_price` decimal(10,2) DEFAULT NULL,
  `customer_original_price` decimal(10,2) DEFAULT NULL,
  `customer_currency` varchar(10) DEFAULT NULL,
  `booked_date` datetime DEFAULT NULL,
  `pickup_date_time` datetime DEFAULT NULL,
  `pickup_date_time_zone` varchar(50) DEFAULT NULL,
  `vehicle_type_id` int DEFAULT NULL,
  `passenger_title` varchar(10) DEFAULT NULL,
  `passenger_name` varchar(100) DEFAULT NULL,
  `passenger_telephone_number` varchar(20) DEFAULT NULL,
  `pickup_latitude` decimal(9,6) DEFAULT NULL,
  `pickup_longitude` decimal(9,6) DEFAULT NULL,
  `pickup_address` text,
  `pickup_postcode` varchar(20) DEFAULT NULL,
  `pickup_country` varchar(10) DEFAULT NULL,
  `pickup_type` varchar(50) DEFAULT NULL,
  `dropoff_latitude` decimal(9,6) DEFAULT NULL,
  `dropoff_longitude` decimal(9,6) DEFAULT NULL,
  `dropoff_address` text,
  `dropoff_country` varchar(10) DEFAULT NULL,
  `dropoff_type` varchar(50) DEFAULT NULL,
  `user_create` INT DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cod_empresa` (`cod_empresa`),
  KEY `status_id` (`status_id`),
  KEY `vehicle_type_id` (`vehicle_type_id`),
  CONSTRAINT `tbbookings_ibfk_1` FOREIGN KEY (`cod_empresa`) REFERENCES `tb_usuarios` (`cod_empresa`),
  CONSTRAINT `tbbookings_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `tb_estado_booking` (`id_estado_booking`),
  CONSTRAINT `tbbookings_ibfk_3` FOREIGN KEY (`vehicle_type_id`) REFERENCES `tb_tipo_coche_booking` (`id_tipo_coche_booking`)
) ENGINE=InnoDB;

