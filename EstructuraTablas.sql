-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: geo
-- ------------------------------------------------------
-- Server version	5.7.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del cliente',
  `RazonSocial` varchar(80) COLLATE utf8_bin NOT NULL COMMENT 'Razón social o nombre completo del cliente',
  `Alias` varchar(20) COLLATE utf8_bin NOT NULL COMMENT 'Alias o nombre corto del cliente para una rápida ubicación',
  `Activo` bit(1) NOT NULL DEFAULT b'1' COMMENT 'Estado del cliente. 1 = Inactivo o suspendido, 0 = Activo',
  `LimiteEncuestas` int(11) NOT NULL DEFAULT '0' COMMENT 'Indica el número máximo de encuestas que el cliente puede registrar. Si el dato es 0 (cero) entonces este dato se toma de la tabla de configuración general',
  `Vigencia` datetime DEFAULT NULL COMMENT 'Contiene la fecha de vigencia del cliente',
  `FechaRegistro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Indica la fecha en que se registró el cliente, por defecto es la fecha del sistema',
  `FechaModificacion` datetime DEFAULT NULL COMMENT 'Indica la última fecha en que se modificó el registro del cliente',
  `UsuarioRegistro` int(11) NOT NULL DEFAULT '1' COMMENT 'Indica el ID del usuario que registró por primera vez el cliente',
  `UsuarioModifico` int(11) DEFAULT NULL COMMENT 'Indica el ID del último usuario que modificó el registro del cliente',
  PRIMARY KEY (`idCliente`),
  KEY `IndexAlias` (`Alias`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contiene el catálogo de clientes como hospitales, laboratorios, etc	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clienteslogo`
--

DROP TABLE IF EXISTS `clienteslogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienteslogo` (
  `idCliente` int(11) NOT NULL,
  `Logo` longblob COMMENT 'Contiene la imagen del logo del cliente',
  `FechaRegistro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Indica la fecha en que se registró el logo, por defecto es la fecha del sistema',
  `FechaModificacion` datetime DEFAULT NULL COMMENT 'Indica la última fecha en que se modificó el logo',
  `UsuarioRegistro` int(11) NOT NULL DEFAULT '1' COMMENT 'Indica el ID del usuario que registró por primera vez el logo',
  `UsuarioModifico` int(11) DEFAULT NULL COMMENT 'Indica el ID del último usuario que modificó el logo',
  `ExtensionLogo` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'Contiene la extensión del documento de la imagen del logo',
  PRIMARY KEY (`idCliente`),
  KEY `fk_ClientesLogo_Clientes_idx` (`idCliente`),
  CONSTRAINT `fk_ClientesLogo_Clientes` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contiene las imágenes de los logotipos de los clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `encuestarespuestas`
--

DROP TABLE IF EXISTS `encuestarespuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encuestarespuestas` (
  `idEncuestaRespondida` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la contestación de la encuesta',
  `idEncuesta` int(11) NOT NULL,
  `CorreoRespuestaEncuesta` varchar(80) COLLATE utf8_bin NOT NULL COMMENT 'Dirección de correo electrónico de quien contesta la respuesta',
  `FechaRegistro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Indica la fecha inicial en que se respondió la encuesta, por defecto es la fecha del sistema',
  `FechaRegistroFinal` datetime DEFAULT NULL COMMENT 'Indica la fecha final en que se respondió la encuesta, por defecto es la fecha del sistema',
  PRIMARY KEY (`idEncuestaRespondida`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contiene el encabezado de las respuestas asociadas a una encuesta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `encuestas`
--

DROP TABLE IF EXISTS `encuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encuestas` (
  `idEncuesta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la encuesta',
  `NombreEncuesta` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'Nombre o breve descripción de la encuesta',
  `FechaRegistro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Indica la fecha en que se registró la encuesta, por defecto es la fecha del sistema',
  `FechaModificacion` datetime DEFAULT NULL COMMENT 'Indica la última fecha en que se modificó la encuesta',
  `UsuarioRegistro` int(11) NOT NULL DEFAULT '1' COMMENT 'Indica el ID del usuario que registró por primera vez la encuesta',
  `UsuarioModifico` int(11) DEFAULT NULL COMMENT 'Indica el ID del último usuario que modificó la encuesta',
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idEncuesta`),
  KEY `fk_Encuestas_Clientes1_idx` (`idCliente`),
  CONSTRAINT `fk_Encuestas_Clientes1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contiene los datos generales de todas las encuestas del sistema	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logtable`
--

DROP TABLE IF EXISTS `logtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logtable` (
  `idLogTable` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LogLine` mediumtext COLLATE utf8_spanish_ci,
  `LogSubject` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idLogTable`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parametrossistema`
--

DROP TABLE IF EXISTS `parametrossistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametrossistema` (
  `idParametrosSistema` int(11) NOT NULL AUTO_INCREMENT,
  `LimiteGeneralEncuestas` int(11) NOT NULL DEFAULT '15' COMMENT 'Límite máximo general de encuestas por cliente',
  `MesesDepuracion` int(11) NOT NULL DEFAULT '6' COMMENT 'Establece el limite máximo a conservar las respuestas, las respuestas que superen este límite se eliminarán en el proceso de depuración',
  PRIMARY KEY (`idParametrosSistema`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contiene los parametros de configuración general del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas` (
  `idPregunta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la pregunta',
  `Pregunta` varchar(160) COLLATE utf8_bin NOT NULL COMMENT 'Descripción de pregunta',
  `TipoPregunta` int(11) NOT NULL DEFAULT '0' COMMENT 'Indica el tipo de pregunta:\n\n0 - Sin tipo\n1 - Valoración\n2 - Valor numérico\n3 - Texto corto\n4 - Texto largo\n5 - Opción múltiple\n6 - Selección múltiple\n7 - Lista desplegable\n8 - Fecha\n9 - Hora\n',
  `Consecutivo` int(11) NOT NULL DEFAULT '1' COMMENT 'Indica el número consecutivo de la pregunta',
  `Precedencia` int(11) NOT NULL COMMENT 'Indica el orden de precedencia, es decir, el orden de la pregunta',
  `Obligatoria` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Indica si la pregunat es obligatoria: 0 = No obligatorio 1 = Obligatorio',
  `IdPreguntaPadre` int(11) NOT NULL DEFAULT '0' COMMENT 'ID de la pregunta padre, es decir, la pregunta con la cual tiene una dependencia',
  `ValorCondicion` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Contiene el valor que la pregunta padre debe tener para que se cumpla la condición y se presente la pregunta',
  `idSeccion` int(11) NOT NULL,
  PRIMARY KEY (`idPregunta`),
  KEY `fk_Preguntas_Secciones1_idx` (`idSeccion`),
  CONSTRAINT `fk_Preguntas_Secciones1` FOREIGN KEY (`idSeccion`) REFERENCES `secciones` (`idSeccion`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contiene todas las preguntas de todas las encuestas del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preguntasvalores`
--

DROP TABLE IF EXISTS `preguntasvalores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntasvalores` (
  `idPregunta` int(11) NOT NULL,
  `NumeroMinimo` int(11) NOT NULL DEFAULT '0' COMMENT 'Contine el límite inferior del valor numérico',
  `NumeroMaximo` int(11) NOT NULL DEFAULT '0' COMMENT 'Contine el límite superior del valor numérico',
  `ListaValores` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'Contiene la lista de opciones para los tipos de pregunta: Opción múltiple, Selección múltiple, Lista desplegable',
  `FechaHoraDesde` datetime DEFAULT NULL COMMENT 'Contiene la fecha o la hora incial cuando hay un rango',
  `FechaHoraHasta` datetime DEFAULT NULL COMMENT 'Contiene la fecha o la hora final cuando hay un rango',
  `SolicitarRango` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Especifica si se solicita rango para valores numéricos, valores de fecha y valores de hora',
  PRIMARY KEY (`idPregunta`),
  CONSTRAINT `fk_PreguntasValores_Preguntas1` FOREIGN KEY (`idPregunta`) REFERENCES `preguntas` (`idPregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contiene los posibles valores de respuestas para las preguntas de las encuestas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestas` (
  `idRespuesta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificaor único de la respuesta',
  `ValorNumerico` double DEFAULT NULL COMMENT 'Corresponde al valor numérico de la respuesta:\n\nValoración: Indica de 1 a 5 según las estrellas seleccionadas\nValor numérico: El valor numérico capturado\nOpción múltiple, Lista desplegable: El valor de la opción seleccionada',
  `ValorTexto` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'Contiene el texto registrado por el encuestado',
  `ValorMultiple` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Contiene una cadena de 0 y 1, donde la posición coincide con la opción de la lista, y 0 = Valor no seleccionado, 1 = Valor seleccionado',
  `ValorFechaHora` datetime DEFAULT NULL COMMENT 'Contiene la fecha o la hora para los tipos de pregunta fecha y hora respectivamente',
  `FechaRegistro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Indica la fecha en que se registró la respuesta, por defecto es la fecha del sistema',
  `idPregunta` int(11) NOT NULL,
  `idEncuestaRespondida` int(11) NOT NULL,
  PRIMARY KEY (`idRespuesta`),
  KEY `fk_Respuestas_Preguntas1_idx` (`idPregunta`),
  KEY `fk_Respuestas_EncuestaRespuestas1_idx` (`idEncuestaRespondida`),
  CONSTRAINT `fk_Respuestas_EncuestaRespuestas1` FOREIGN KEY (`idEncuestaRespondida`) REFERENCES `encuestarespuestas` (`idEncuestaRespondida`),
  CONSTRAINT `fk_Respuestas_Preguntas1` FOREIGN KEY (`idPregunta`) REFERENCES `preguntas` (`idPregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=1211 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contiene todas las respuestas a las preguntas de las encuestas del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `secciones`
--

DROP TABLE IF EXISTS `secciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secciones` (
  `idSeccion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la sección',
  `NombreSeccion` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'Nombre o descripción de la sección',
  `NumeroSeccion` int(11) NOT NULL DEFAULT '1' COMMENT 'Indica el número de la sección dentro de la encuesta, también indica el número de orden de presentación',
  `FechaRegistro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Indica la fecha en que se registró la sección, por defecto es la fecha del sistema',
  `FechaModificacion` datetime DEFAULT NULL COMMENT 'Indica la última fecha en que se modificó la sección',
  `UsuarioRegistro` int(11) NOT NULL DEFAULT '1' COMMENT 'Indica el ID del usuario que registró por primera vez la sección',
  `UsuarioModifico` int(11) DEFAULT NULL COMMENT 'Indica el ID del último usuario que modificó la sección',
  `idEncuesta` int(11) NOT NULL,
  PRIMARY KEY (`idSeccion`),
  KEY `fk_Secciones_Encuestas1_idx` (`idEncuesta`),
  CONSTRAINT `fk_Secciones_Encuestas1` FOREIGN KEY (`idEncuesta`) REFERENCES `encuestas` (`idEncuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contiene todas las secciones de las encuestas del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sysmodulos`
--

DROP TABLE IF EXISTS `sysmodulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysmodulos` (
  `idModulo` int(11) NOT NULL COMMENT 'Identificador único del módulo dentro del sistema',
  `Modulo` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'Nombre corto del módulo',
  `PageName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'Nombre de la página o clase del módulo, sin espacios',
  `PageRelativeURL` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'URL relativa más el nombre de la página con todo y su extensión',
  `ModuloPadre` int(11) NOT NULL DEFAULT '0' COMMENT 'ID del módulo padre',
  PRIMARY KEY (`idModulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contiene los módulos funcionales del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sysmodulosroles`
--

DROP TABLE IF EXISTS `sysmodulosroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysmodulosroles` (
  `SysModulos_idModulo` int(11) NOT NULL,
  `SysRoles_idRol` int(11) NOT NULL,
  PRIMARY KEY (`SysModulos_idModulo`,`SysRoles_idRol`),
  KEY `fk_SysModulosRoles_SysRoles1_idx` (`SysRoles_idRol`),
  CONSTRAINT `fk_SysModulosRoles_SysModulos1` FOREIGN KEY (`SysModulos_idModulo`) REFERENCES `sysmodulos` (`idModulo`),
  CONSTRAINT `fk_SysModulosRoles_SysRoles1` FOREIGN KEY (`SysRoles_idRol`) REFERENCES `sysroles` (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contiene los módulos de acuerdo a los roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sysroles`
--

DROP TABLE IF EXISTS `sysroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysroles` (
  `idRol` int(11) NOT NULL COMMENT 'Identificador único del rol dentro del sistema',
  `NombreRol` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Nombre del rol',
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Roles del sistema. Catálogo fijo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del usuario',
  `Usuario` varchar(80) COLLATE utf8_bin NOT NULL COMMENT 'Identificador de usuario, corresponde al correo electrónico del usuario, es un dato único.',
  `NombreUsuario` varchar(80) COLLATE utf8_bin NOT NULL COMMENT 'Nombre completo del usuario',
  `Password` blob COMMENT 'Contiene la contraseña del usuario',
  `Rol` int(11) NOT NULL DEFAULT '1' COMMENT 'Rol del usuario: 1 = Cliente, 2 = Administrador',
  `Activo` bit(1) NOT NULL DEFAULT b'1' COMMENT 'Estado del usuario. 0 = Inactivo o suspendido, 1 = Activo',
  `FechaRegistro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Indica la fecha en que se registró el usuario, por defecto es la fecha del sistema',
  `FechaModificacion` datetime DEFAULT NULL COMMENT 'Indica la última fecha en que se modificó el usuario',
  `UsuarioRegistro` int(11) NOT NULL DEFAULT '1' COMMENT 'Indica el ID del usuario que registró por primera vez al usuario',
  `UsuarioModifico` int(11) DEFAULT NULL COMMENT 'Indica el ID del último usuario que modificó el usuario',
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `Usuario_UNIQUE` (`Usuario`),
  KEY `fk_Usuarios_Clientes1_idx` (`idCliente`),
  CONSTRAINT `fk_Usuarios_Clientes1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Contiene el catálogo de usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vwlistaclientes`
--

DROP TABLE IF EXISTS `vwlistaclientes`;
/*!50001 DROP VIEW IF EXISTS `vwlistaclientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwlistaclientes` AS SELECT 
 1 AS `idCliente`,
 1 AS `RazonSocial`,
 1 AS `Alias`,
 1 AS `Activo`,
 1 AS `LimiteEncuestas`,
 1 AS `Vigencia`,
 1 AS `FechaRegistro`,
 1 AS `NombreParte1`,
 1 AS `NombreParte2`,
 1 AS `Estado`,
 1 AS `TotalEncuestas`,
 1 AS `CreadaPor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwlistaencuestas`
--

DROP TABLE IF EXISTS `vwlistaencuestas`;
/*!50001 DROP VIEW IF EXISTS `vwlistaencuestas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwlistaencuestas` AS SELECT 
 1 AS `idEncuesta`,
 1 AS `NombreEncuesta`,
 1 AS `FechaRegistro`,
 1 AS `FechaModificacion`,
 1 AS `UsuarioRegistro`,
 1 AS `UsuarioModifico`,
 1 AS `idCliente`,
 1 AS `NombreParte1`,
 1 AS `NombreParte2`,
 1 AS `RazonSocial`,
 1 AS `Alias`,
 1 AS `TotPreguntas`,
 1 AS `EncuestasContestadas`,
 1 AS `CreadaPor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwlistapreguntas`
--

DROP TABLE IF EXISTS `vwlistapreguntas`;
/*!50001 DROP VIEW IF EXISTS `vwlistapreguntas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwlistapreguntas` AS SELECT 
 1 AS `idSeccion`,
 1 AS `NombreSeccion`,
 1 AS `NumeroSeccion`,
 1 AS `idEncuesta`,
 1 AS `idPregunta`,
 1 AS `Pregunta`,
 1 AS `TipoPregunta`,
 1 AS `Consecutivo`,
 1 AS `Precedencia`,
 1 AS `Obligatoria`,
 1 AS `idPreguntaPadre`,
 1 AS `ValorCondicion`,
 1 AS `NumeroMinimo`,
 1 AS `NumeroMaximo`,
 1 AS `ListaValores`,
 1 AS `FechaHoraDesde`,
 1 AS `FechaHoraHasta`,
 1 AS `SolicitarRango`,
 1 AS `idCliente`,
 1 AS `DescTipoPregunta`,
 1 AS `ConsecutivoPadre`,
 1 AS `PadreCodeName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwlistarespuestas`
--

DROP TABLE IF EXISTS `vwlistarespuestas`;
/*!50001 DROP VIEW IF EXISTS `vwlistarespuestas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwlistarespuestas` AS SELECT 
 1 AS `idPregunta`,
 1 AS `Precedencia`,
 1 AS `Pregunta`,
 1 AS `TipoPregunta`,
 1 AS `idSeccion`,
 1 AS `ValorRespuesta`,
 1 AS `FechaRespuesta`,
 1 AS `idRespuesta`,
 1 AS `NombreSeccion`,
 1 AS `idEncuesta`,
 1 AS `CorreoRespuestaEncuesta`,
 1 AS `idEncuestaRespondida`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwlistausuarios`
--

DROP TABLE IF EXISTS `vwlistausuarios`;
/*!50001 DROP VIEW IF EXISTS `vwlistausuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwlistausuarios` AS SELECT 
 1 AS `idUsuario`,
 1 AS `Usuario`,
 1 AS `NombreUsuario`,
 1 AS `Rol`,
 1 AS `Activo`,
 1 AS `idCliente`,
 1 AS `Estado`,
 1 AS `NombreRol`,
 1 AS `AliasCliente`,
 1 AS `RazonSocial`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwlstnumerosecciones`
--

DROP TABLE IF EXISTS `vwlstnumerosecciones`;
/*!50001 DROP VIEW IF EXISTS `vwlstnumerosecciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwlstnumerosecciones` AS SELECT 
 1 AS `DescNumeroSeccion`,
 1 AS `NumeroSeccion`,
 1 AS `idEncuesta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwmodulosroles`
--

DROP TABLE IF EXISTS `vwmodulosroles`;
/*!50001 DROP VIEW IF EXISTS `vwmodulosroles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwmodulosroles` AS SELECT 
 1 AS `idModulo`,
 1 AS `Modulo`,
 1 AS `PageName`,
 1 AS `PageRelativeURL`,
 1 AS `ModuloPadre`,
 1 AS `idRol`,
 1 AS `NombreRol`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwrespuestasencuesta`
--

DROP TABLE IF EXISTS `vwrespuestasencuesta`;
/*!50001 DROP VIEW IF EXISTS `vwrespuestasencuesta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwrespuestasencuesta` AS SELECT 
 1 AS `idPregunta`,
 1 AS `Precedencia`,
 1 AS `Pregunta`,
 1 AS `TipoPregunta`,
 1 AS `idSeccion`,
 1 AS `ValorRespuesta`,
 1 AS `FechaRegistro`,
 1 AS `idRespuesta`,
 1 AS `NombreSeccion`,
 1 AS `idEncuesta`,
 1 AS `CorreoRespuestaEncuesta`,
 1 AS `idEncuestaRespondida`,
 1 AS `FechaInicialRespuesta`,
 1 AS `FechaFinalRespuesta`,
 1 AS `ElapTime`,
 1 AS `NombreEncuesta`,
 1 AS `RazonSocial`,
 1 AS `Alias`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwresumenencuesta`
--

DROP TABLE IF EXISTS `vwresumenencuesta`;
/*!50001 DROP VIEW IF EXISTS `vwresumenencuesta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwresumenencuesta` AS SELECT 
 1 AS `idPregunta`,
 1 AS `Precedencia`,
 1 AS `Pregunta`,
 1 AS `TipoPregunta`,
 1 AS `idSeccion`,
 1 AS `ValorRespuesta`,
 1 AS `idEncuesta`,
 1 AS `FechaRespuesta`,
 1 AS `NombreSeccion`,
 1 AS `TotalPregunta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwtipospreguntas`
--

DROP TABLE IF EXISTS `vwtipospreguntas`;
/*!50001 DROP VIEW IF EXISTS `vwtipospreguntas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwtipospreguntas` AS SELECT 
 1 AS `TipoPregunta`,
 1 AS `DescTipoPregunta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwuserssecuritydata`
--

DROP TABLE IF EXISTS `vwuserssecuritydata`;
/*!50001 DROP VIEW IF EXISTS `vwuserssecuritydata`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwuserssecuritydata` AS SELECT 
 1 AS `idUsuario`,
 1 AS `Activo`,
 1 AS `Rol`,
 1 AS `IdCliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'geo'
--

--
-- Dumping routines for database 'geo'
--
/*!50003 DROP FUNCTION IF EXISTS `GetLastPrecedencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetLastPrecedencia`(pridSeccion Int) RETURNS int(11)
BEGIN

	declare liResult integer;

	-- Select
	select Max(Precedencia)+1
      into liResult
	  from preguntas
	 where idSeccion = pridSeccion;
     
	--
    if IsNull(liResult) then
		set liResult = 1;
    end if;

	RETURN liResult;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetValorRespuesta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetValorRespuesta`(pridRespuesta Int, prOnlyValues int) RETURNS varchar(1024) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN

	--
    declare liOnlyValues int;
	declare lsResult varchar(1024);
    declare liValorNumerico bigint;
    declare lsValorTexto varchar(1024);
    declare lsValorMultiple varchar(1024);
    declare ldValorFechaHora datetime;
	declare lsListaValores varchar(1024);
    declare liIdPregunta bigint;
    declare liTipoPregunta bigint;

	-- ----
    declare exit handler for sqlexception
    begin
		Return '';
    end;

	--
    set liOnlyValues = ifnull(prOnlyValues,0);

	-- Selects
    select R.ValorNumerico, R.ValorTexto, R.ValorMultiple, R.ValorFechaHora, R.idPRegunta
      into liValorNumerico, lsValorTexto, lsValorMultiple, ldValorFechaHora, liIdPregunta
      from respuestas R
           inner join preguntas P on P.idPregunta = R.idPregunta
	 where R.idRespuesta = pridRespuesta;
     
     select ListaValores into lsListaValores
       from preguntasValores
	  where idPregunta = liIdPregunta;
     
     select TipoPregunta into liTipoPregunta
       from preguntas
	  where idPregunta = liIdPregunta;

	--
	set lsResult = '';
    if liTipoPregunta = 1 then                -- valoracion
		set lsResult = concat(cast(liValorNumerico as char), if(liOnlyValues = 0,' estrellas', ''));
    elseif liTipoPregunta = 2 then            -- numerico
		set lsResult = cast(liValorNumerico as char);
    elseif liTipoPregunta = 3 then            -- texto corto
		set lsResult = lsValorTexto;
    elseif liTipoPregunta = 4 then            -- texto largo
		set lsResult = lsValorTexto;
    elseif liTipoPregunta = 5 then            -- opcion multiple
		set lsResult = SUBSTRING_INDEX(SUBSTRING_INDEX(lsListaValores, '\n', liValorNumerico), '\n', -1);
    elseif liTipoPregunta = 6 then            -- seleccion multiple
		set lsResult = geo.GetValuesFromList(lsListaValores, lsValorMultiple, null);
    elseif liTipoPregunta = 7 then            -- lista desplegable
		set lsResult = SUBSTRING_INDEX(SUBSTRING_INDEX(lsListaValores, '\n', liValorNumerico), '\n', -1);
    elseif liTipoPregunta = 8 then            -- fecha
		set lsResult = DATE_FORMAT(ldValorFechaHora, '%d/%m/%Y');
    elseif liTipoPregunta = 9 then            -- hora
		set lsResult = DATE_FORMAT(ldValorFechaHora, '%H:%i'); -- "%H:%i:%s"
    end if;

	--
	RETURN lsResult;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetValuesFromList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetValuesFromList`(prListOptions varchar(1024), psValuesOptions varchar(50), psSeparator varchar(10)) RETURNS varchar(1024) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN

	declare liI int;
    declare lsReturn varchar(1024);
    declare liVal int;
    
    --
    if psSeparator is null then
		set psSeparator = "\n";
    end if;
    
    --
    set lsReturn = '';
    set liI = 1;
    FOR_I: loop
    
		--
		set liVal = Cast(Mid(psValuesOptions, liI, 1) as SIGNED);
		
        --
        if liVal = 1 then
			set lsReturn = concat(lsReturn, SUBSTRING_INDEX(SUBSTRING_INDEX(prListOptions, psSeparator, liI), psSeparator, -1), ', ');
        end if;
        
        --
        set liI = liI + 1;
        if liI <= Length(psValuesOptions) then
			Iterate FOR_I;
        end if;
    
		--
        Leave FOR_I;
    
    end loop;
    
    --
    set lsReturn = Trim(lsReturn);
    set lsReturn = Mid(lsReturn, 1, (Length(lsReturn)-1));
    Return  lsReturn;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ValidaUserPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ValidaUserPassword`(fiIdUsuario integer, fsPassword varchar(60), fsKey varchar(32)) RETURNS bit(1)
BEGIN

DECLARE retValue bit DEFAULT 0;

select (Password = AES_ENCRYPT(fsPassword, fsKey)) into retValue
  from usuarios
where idUsuario = fiIdUsuario;

RETURN retValue;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spclientesDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spclientesDelete`(pridCliente Int)
BEGIN

	-- Delete
	delete from clientes where idCliente = pridCliente;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spclientesGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spclientesGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idCliente, RazonSocial, Alias, Activo, LimiteEncuestas, Vigencia, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico
	  from clientes
	  order by RazonSocial;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spclientesGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spclientesGetById`(prUserSigned bigint, pridCliente bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;

	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idCliente, RazonSocial, Alias, Activo, LimiteEncuestas, Vigencia, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico
	  from clientes
	 where idCliente = pridCliente;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spclientesInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spclientesInsert`(prRazonSocial NVarchar(80), prAlias NVarchar(20), prActivo Bit, prLimiteEncuestas Int, prVigencia Datetime, 
                                    prFechaRegistro Datetime, prFechaModificacion Datetime, prUsuarioRegistro Int, prUsuarioModifico Int)
BEGIN

	-- Insert
	insert into clientes(RazonSocial, Alias, Activo, LimiteEncuestas, Vigencia, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico)
                 values (prRazonSocial, prAlias, prActivo, prLimiteEncuestas, prVigencia, prFechaRegistro, prFechaModificacion, prUsuarioRegistro,
                         prUsuarioModifico);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spclientesIsDuplicated` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spclientesIsDuplicated`(prUserSigned bigint, pridCliente bigint, prNombre NVarchar(50), prValidaAliasOrName int)
BEGIN

	declare liCount bigint;

	-- 
    if prValidaAliasOrName = 1 then -- Valida razon social
		select ifnull(count(*),0)
		  into liCount
		  from clientes
		 where Trim(Upper(RazonSocial)) = Trim(Upper(prNombre))
		   and idCliente <> pridCliente;
	else -- Valida Alias
		select ifnull(count(*),0)
		  into liCount
		  from clientes
		 where Trim(Upper(Alias)) = Trim(Upper(prNombre))
		   and idCliente <> pridCliente;    
    end if;
       
    --
    if (liCount > 0) then
		select 1 as Resultado;
	else
		select 0 as Resultado;
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spclienteslogoDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spclienteslogoDelete`(pridCliente Int)
BEGIN

	-- Delete
	delete from clienteslogo where idCliente = pridCliente;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spclienteslogoGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spclienteslogoGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;    
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idCliente, Logo, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico, ExtensionLogo
	  from clienteslogo
	order by idCliente;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spclienteslogoGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spclienteslogoGetById`(prUserSigned bigint, pridCliente Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idCliente, Logo, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico, ExtensionLogo
	  from clienteslogo
	 where idCliente = pridCliente;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spclienteslogoInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spclienteslogoInsert`(pridCliente Int, prLogo blob, prFechaRegistro Datetime, prFechaModificacion Datetime, prUsuarioRegistro Int, 
                                        prUsuarioModifico Int, prExtensionLogo NVarchar(50))
BEGIN

	-- Insert
	insert into clienteslogo(idCliente, Logo, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico, ExtensionLogo)
                     values (pridCliente, prLogo, prFechaRegistro, prFechaModificacion, prUsuarioRegistro, prUsuarioModifico, prExtensionLogo);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spclienteslogoUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spclienteslogoUpdate`(pridCliente Int, prLogo blob, prFechaRegistro Datetime, prFechaModificacion Datetime, prUsuarioRegistro Int, 
                                        prUsuarioModifico Int, prExtensionLogo NVarchar(50))
BEGIN

	-- Update
	update clienteslogo
	   set Logo = prLogo, FechaRegistro = prFechaRegistro, FechaModificacion = prFechaModificacion, UsuarioRegistro = prUsuarioRegistro,
		   UsuarioModifico = prUsuarioModifico, ExtensionLogo = prExtensionLogo
	 where idCliente = pridCliente;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spclientesUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spclientesUpdate`(pridCliente Int, prRazonSocial NVarchar(80), prAlias NVarchar(20), prActivo Bit, prLimiteEncuestas Int, prVigencia Datetime,
                                    prFechaRegistro Datetime, prFechaModificacion Datetime, prUsuarioRegistro Int, prUsuarioModifico Int )
BEGIN

	declare llEstadoCliente bit;
    
    --
    select Activo into llEstadoCliente
      from clientes
	 where idCliente = pridCliente;

	-- Update
	update clientes
	   set RazonSocial = prRazonSocial, Alias = prAlias, Activo = prActivo, LimiteEncuestas = prLimiteEncuestas, Vigencia = prVigencia,
           FechaRegistro = prFechaRegistro, FechaModificacion = prFechaModificacion, UsuarioRegistro = prUsuarioRegistro,
           UsuarioModifico = prUsuarioModifico
	 where idCliente = pridCliente;
     
     -- Activa o desactiva los usuarios segun estado del cliente
     if llEstadoCliente <> prActivo then
     
		 update usuarios
			set Activo = prActivo
		  where idCliente = pridCliente;
      
      end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDepuraRespuestasEncuestas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDepuraRespuestasEncuestas`()
BEGIN

	--
    declare liPeriodo integer;
    declare ldFechaDepuracion datetime;
    
    --
	SET SQL_SAFE_UPDATES = 0;

    -- Obtiene el periodo configurado
    select MesesDepuracion into liPeriodo
      from parametrossistema
	 where idParametrosSistema = 1;
	set liPeriodo = liPeriodo * -1;
     
	-- Calcula la fecha de acuerdo al periodo de depuración
    set ldFechaDepuracion = date_add( curdate(), INTERVAL liPeriodo MONTH );

	-- Delete detalle
	delete from respuestas
	 where FechaRegistro < ldFechaDepuracion
       and idRespuesta > 0;

	-- Delete encabezado
	delete from encuestarespuestas
     where idEncuestaRespondida not in (select idEncuestaRespondida from respuestas);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestarespuestasDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestarespuestasDelete`(pridEncuestaRespondida Int)
BEGIN

	-- Delete
	delete from encuestarespuestas where idEncuestaRespondida = pridEncuestaRespondida;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestarespuestasGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestarespuestasGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
		select idEncuestaRespondida, idEncuesta, CorreoRespuestaEncuesta, FechaRegistro, FechaRegistroFinal
          from encuestarespuestas
          order by idEncuesta, idRespuesta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestarespuestasGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestarespuestasGetById`(prUserSigned bigint, pridEncuestaRespondida Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idEncuestaRespondida, idEncuesta, CorreoRespuestaEncuesta, FechaRegistro, FechaRegistroFinal
	  from encuestarespuestas
	 where idEncuestaRespondida = pridEncuestaRespondida;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestarespuestasGetTotRespuestas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestarespuestasGetTotRespuestas`(prUserSigned bigint, pridEncuesta bigint, prDesde datetime, prHasta datetime)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select ifnull(count(*),0) as TotRespuestas
	 from encuestarespuestas
	where idEncuesta = pridEncuesta
	  and FechaRegistro >= prDesde
	  and FechaRegistro <= prHasta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestarespuestasInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestarespuestasInsert`(pridEncuesta Int, prCorreoRespuestaEncuesta NVarchar(80), prFechaRegistro Datetime, prFechaRegistroFinal Datetime)
BEGIN

	--
     -- insert into LogTable(LogSubject, LogLine) Values ('spencuestarespuestasInsert', concat('pridEncuesta=', cast(pridEncuesta as signed), ', prCorreoRespuestaEncuesta=', prCorreoRespuestaEncuesta, ', prFechaRegistro=', cast(prFechaRegistro as char), ', prFechaRegistroFinal=', cast(prFechaRegistroFinal as char)));

	-- Insert
	insert into encuestarespuestas(idEncuesta, CorreoRespuestaEncuesta, FechaRegistro, FechaRegistroFinal)
                           values (pridEncuesta, prCorreoRespuestaEncuesta, prFechaRegistro, prFechaRegistroFinal);

	-- Regresa el ID insertado
	select last_insert_id() as IdAdded;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestarespuestasUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestarespuestasUpdate`(pridEncuestaRespondida Int, pridEncuesta Int, prCorreoRespuestaEncuesta NVarchar(80), prFechaRegistro Datetime, prFechaRegistroFinal Datetime)
BEGIN

	-- Update
	update encuestarespuestas
	   set idEncuesta = pridEncuesta,
           CorreoRespuestaEncuesta = prCorreoRespuestaEncuesta,
	       FechaRegistro = prFechaRegistro,
           FechaRegistroFinal = prFechaRegistroFinal
	 where idEncuestaRespondida = pridEncuestaRespondida;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestarespuestasValidaPreviousAnswer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestarespuestasValidaPreviousAnswer`(pridEncuesta Int, prCorreoRespuestaEncuesta NVarchar(80))
BEGIN

	--
    declare liCount int;

	-- Insert
	select IfNull(count(*),0) into liCount
      from encuestarespuestas
	 where idEncuesta = pridEncuesta
       and Upper(CorreoRespuestaEncuesta) = Upper(prCorreoRespuestaEncuesta);

	-- Regresa el valor
    if liCount > 0 then
		select 1 as Resultado;
    else
		select 0 as Resultado;
    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestasDecifraCodeURL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestasDecifraCodeURL`(prUserSigned bigint, prCode varchar(2048), psCipherKey varchar(32))
BEGIN
  
    --
    if Trim(prCode) <> "" then
    
		select cast(aes_decrypt(unhex(prCode), psCipherKey) as char) as Result;
        
	else
    
		select "" as Result;

    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestasDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestasDelete`(pridEncuesta Int)
BEGIN

	-- Delete
	delete from encuestas where idEncuesta = pridEncuesta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestasGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestasGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select idEncuesta, NombreEncuesta, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico, idCliente
          from encuestas
          order by NombreEncuesta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestasGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestasGetById`(prUserSigned bigint, pridEncuesta Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idEncuesta, NombreEncuesta, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico, idCliente
	  from encuestas
	 where idEncuesta = pridEncuesta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestasGetCodeURL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestasGetCodeURL`(prUserSigned bigint, prIdEncuesta bigint, psCipherKey varchar(32))
BEGIN

	declare lsCodeRet varchar(2048);
    declare lsCadena varchar(1024);
    declare liCount bigint;
    declare liIdUsuario bigint;
    declare liIdCliente bigint;
    
    -- Busca al cliente de la encuesta
    select idCliente
      into liIdCliente
	  from encuestas
	 where idEncuesta = prIdEncuesta;
    
    -- Busca al usuario con rol 3 - Survey User que pertenezca al cliente
	set @row_number = 0;
    select U.idUsuario 
      into liIdUsuario
	  from (
			select idUsuario,
				   -- ROW_NUMBER() OVER(order by idusuario) as RowNum
                   (@row_number := @row_number + 1) as RowNum
			  from usuarios
			 where Rol = 3
			   and idCliente = liIdCliente
			   and Activo = 1
			) as U
	 where RowNum = 1;

	--
    if not IsNull(liIdUsuario) then
    
		--
		set lsCadena = Concat("idEncuesta=", cast(prIdEncuesta as char), "&idUsuario=", cast(liIdUsuario as char));
		
		--
		-- SET block_encryption_mode = 'aes-256-ecb';
		select hex(aes_encrypt(lsCadena, psCipherKey)) into @lsCodeRet;
        
	else
		set @lsCodeRet = "-1";
    end if;
    
    --
    select @lsCodeRet as Result;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestasGetEncuestasxCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestasGetEncuestasxCliente`(prUserSigned bigint, pridCliente Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select ifnull(count(*),0) as Resultado
	  from encuestas
	 where idCliente = pridCliente;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestasHasEncuestas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestasHasEncuestas`(prUserSigned bigint, pridCliente Int)
BEGIN

	declare liCount bigint;

	-- 
    select ifnull(count(*),0)
      into liCount
      from encuestas
	 where idCliente = pridCliente;
       
    --
    if (liCount > 0) then
		select 1 as Resultado;
	else
		select 0 as Resultado;
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestasInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestasInsert`(prNombreEncuesta NVarchar(50), prFechaRegistro Datetime, prFechaModificacion Datetime, prUsuarioRegistro Int, prUsuarioModifico Int, pridCliente Int)
BEGIN

	-- Insert
	insert into encuestas(NombreEncuesta, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico, idCliente)
                  values (prNombreEncuesta, prFechaRegistro, prFechaModificacion, prUsuarioRegistro, prUsuarioModifico, pridCliente);

	-- Regresa el ID insertado
	select last_insert_id() as IdAdded;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestasIsDuplicated` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestasIsDuplicated`(prUserSigned bigint, prIdEncuesta bigint, prNombreEncuesta NVarchar(50), pridCliente Int)
BEGIN

	declare liCount bigint;

	-- 
    select count(*)
      into liCount
      from encuestas
	 where Trim(Upper(NombreEncuesta)) = Trim(Upper(prNombreEncuesta))
       and idCliente = pridCliente
       and idEncuesta <> prIdEncuesta;
       
	--
    if (IsNull(liCount)) then
		set liCount = 0;
	end if;
    
    --
    if (liCount > 0) then
		select 1 as Resultado;
	else
		select 0 as Resultado;
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spencuestasUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spencuestasUpdate`(pridEncuesta Int, prNombreEncuesta NVarchar(50), prFechaRegistro Datetime, prFechaModificacion Datetime,
                                     prUsuarioRegistro Int, prUsuarioModifico Int, pridCliente Int)
BEGIN

	-- Update
	update encuestas
	   set NombreEncuesta = prNombreEncuesta, FechaRegistro = prFechaRegistro, FechaModificacion = prFechaModificacion, UsuarioRegistro = prUsuarioRegistro,
           UsuarioModifico = prUsuarioModifico, idCliente = pridCliente
	 where idEncuesta = pridEncuesta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spparametrossistemaDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spparametrossistemaDelete`()
BEGIN

	-- Delete
	delete from parametrossistema;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spparametrossistemaGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spparametrossistemaGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select idParametrosSistema, LimiteGeneralEncuestas, MesesDepuracion
          from parametrossistema;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spparametrossistemaGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spparametrossistemaGetById`(prUserSigned bigint, pridParametrosSistema Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idParametrosSistema, LimiteGeneralEncuestas, MesesDepuracion
	  from parametrossistema
	 where idParametrosSistema = pridParametrosSistema;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spparametrossistemaInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spparametrossistemaInsert`(prLimiteGeneralEncuestas Int, prMesesDepuracion Int)
BEGIN

	-- Insert
	insert into parametrossistema(LimiteGeneralEncuestas, MesesDepuracion) values (prLimiteGeneralEncuestas, prMesesDepuracion);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spparametrossistemaUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spparametrossistemaUpdate`(pridParametrosSistema Int, prLimiteGeneralEncuestas Int, prMesesDepuracion Int)
BEGIN

	-- Update
	update parametrossistema
	   set LimiteGeneralEncuestas = prLimiteGeneralEncuestas, MesesDepuracion = prMesesDepuracion
	 where idParametrosSistema = pridParametrosSistema;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasDelete`(pridPregunta Int)
BEGIN

	declare liSeccion integer;

	-- Borra todas las respuestas de la pregunta
    delete from Respuestas
     where idPregunta = pridPregunta;
	
	-- Borra todos los valores de la pregunta
    delete from PreguntasValores
     where idPregunta = pridPregunta;
	
	-- Delete
    select idSeccion into liSeccion from preguntas where idPregunta = pridPregunta;
	delete from preguntas where idPregunta = pridPregunta;
    
    -- Renumera las precedencias
	set @row_number = 0;
	update preguntas P
		   inner join (select idPregunta, Precedencia,
                              -- ROW_NUMBER() OVER (PARTITION BY idSeccion ORDER BY Precedencia) AS NewPrecedencia
                              (@row_number := @row_number + 1) as NewPrecedencia
						 from preguntas
						where idSeccion = idSeccion
					   order by Precedencia
					  ) PO on P.IdPregunta = PO.IdPregunta
		   set P.Precedencia = PO.NewPrecedencia
	where P.idSeccion = idSeccion;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasDuplicar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasDuplicar`(prUserSigned bigint, prIdPregunta Int)
BEGIN

	declare prPregunta NVarchar(160);
    declare prTipoPregunta Int;
    declare prConsecutivo Int;
    declare prPrecedencia Int;
    declare prObligatoria Bit;
    declare prIdPreguntaPadre Int;
    declare prValorCondicion NVarchar(50);
    declare pridSeccion Int;
    declare prIdPreguntaDuplicada int;
    declare prPrecedenciaDuplicada Int;

	-- ----
    declare exit handler for sqlexception
    begin
		select 0 as Resultado;
		rollback;
    end;
    
	-- ----
    start transaction;
    
    -- Obtiene pregunta a duplicar
	select Pregunta, TipoPregunta, Consecutivo, Precedencia, Obligatoria, IdPreguntaPadre, ValorCondicion, idSeccion
      into prPregunta, prTipoPregunta, prConsecutivo, prPrecedencia, prObligatoria, prIdPreguntaPadre, prValorCondicion, pridSeccion
	  from preguntas
	 where idPregunta = prIdPregunta;

	-- Duplica pregunta
	insert into preguntas(Pregunta, TipoPregunta, Consecutivo, Precedencia, Obligatoria, IdPreguntaPadre, ValorCondicion, idSeccion)
				  values (concat(prPregunta, "_2"), prTipoPregunta, prConsecutivo, prPrecedencia, prObligatoria, prIdPreguntaPadre, prValorCondicion, pridSeccion);

	select last_insert_id() into prIdPreguntaDuplicada;
    
	-- Obtiene el último consecutivo de la sección y la asigna a la pregunta duplicada
    update preguntas
       set Precedencia = geo.GetLastPrecedencia(idSeccion)
	 where idPregunta = prIdPreguntaDuplicada;
     
	-- Copia los valores de la pregunta origen
	insert into preguntasvalores(idPregunta, NumeroMinimo, NumeroMaximo, ListaValores, FechaHoraDesde, FechaHoraHasta, SolicitarRango)
                select prIdPreguntaDuplicada, NumeroMinimo, NumeroMaximo, ListaValores, FechaHoraDesde, FechaHoraHasta, SolicitarRango
                  from preguntasvalores
				 where idPregunta = prIdPregunta;

	-- ----
    commit;

     -- Mueve el consecutivo de la pregunta duplicada
     select Precedencia
       into prPrecedenciaDuplicada
	   from preguntas
	 where idPregunta = prIdPreguntaDuplicada;
     
	call sppreguntasMoveToPosition(prUserSigned, pridSeccion, prIdPreguntaDuplicada, prPrecedenciaDuplicada, prPrecedencia+1);
    
	--
	select 1 as Resultado;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select idPregunta, Pregunta, TipoPregunta, Consecutivo, Precedencia, Obligatoria, IdPreguntaPadre, ValorCondicion, idSeccion
          from preguntas
          order by Pregunta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasGetById`(prUserSigned bigint, pridPregunta Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idPregunta, Pregunta, TipoPregunta, Consecutivo, Precedencia, Obligatoria, IdPreguntaPadre, ValorCondicion, idSeccion
	  from preguntas
	 where idPregunta = pridPregunta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasGetBySeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasGetBySeccion`(prUserSigned bigint, pridSeccion bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idPregunta, Pregunta, TipoPregunta, Consecutivo, Precedencia, Obligatoria, IdPreguntaPadre, ValorCondicion, idSeccion
	  from preguntas
	 where idSeccion = pridSeccion
	  order by Precedencia;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasGetPadres` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasGetPadres`(prUserSigned bigint, prPrecedencia Int, pridSeccion Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idPregunta, Pregunta, TipoPregunta, Consecutivo, Precedencia, Obligatoria, IdPreguntaPadre, ValorCondicion, idSeccion
      from preguntas
     where idSeccion = pridSeccion
	   and Precedencia < prPrecedencia
	 order by Precedencia;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasGetPrecedencias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasGetPrecedencias`(prUserSigned bigint, prIdPregunta Int, pridSeccion Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idPregunta, Pregunta, TipoPregunta, Consecutivo, Precedencia, Obligatoria, IdPreguntaPadre, ValorCondicion, idSeccion
      from preguntas
     where idSeccion = pridSeccion
	   and idPregunta <> prIdPregunta
	 order by Precedencia;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasHasAnswers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasHasAnswers`(prIdPregunta Int)
BEGIN

	declare liCount bigint;

	-- 
    select count(*)
      into liCount
      from respuestas R
	 where R.idPregunta = prIdPregunta;
       
	--
    if (IsNull(liCount)) then
		set liCount = 0;
	end if;
    
    --
    if (liCount > 0) then
		select 1 as Resultado;
	else
		select 0 as Resultado;
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasHasQuestions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasHasQuestions`(pridEncuesta Int)
BEGIN

	declare liCount bigint;

	-- 
    select IfNull(count(*),0)
      into liCount
      from preguntas P
           inner join secciones S on S.idSeccion = P.idSeccion
	 where S.idEncuesta = pridEncuesta;    

    --
    if (liCount > 0) then
		select 1 as Resultado;
	else
		select 0 as Resultado;
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasInsert`(prPregunta NVarchar(160), prTipoPregunta Int, prConsecutivo Int, prPrecedencia Int, prObligatoria Bit, 
                                     prIdPreguntaPadre Int, prValorCondicion NVarchar(50), pridSeccion Int)
BEGIN

	-- Insert
	insert into preguntas(Pregunta, TipoPregunta, Consecutivo, Precedencia, Obligatoria, IdPreguntaPadre, ValorCondicion, idSeccion)
				  values (prPregunta, prTipoPregunta, prConsecutivo, prPrecedencia, prObligatoria, prIdPreguntaPadre, prValorCondicion, pridSeccion);

	-- Regresa el ID insertado
	select last_insert_id() as IdAdded;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasIsDuplicated` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasIsDuplicated`(prUserSigned bigint, prIdPregunta Int, prIdEncuesta bigint, prPregunta NVarchar(160))
BEGIN

	declare liCount bigint;

	-- 
    select count(*)
      into liCount
      from preguntas P
           inner join secciones S on S.idSeccion = P.idSeccion
	 where P.Pregunta = prPregunta
       and S.idEncuesta = prIdEncuesta
       and P.idPregunta <> prIdPregunta;
       
	--
    if (IsNull(liCount)) then
		set liCount = 0;
	end if;
    
    --
    if (liCount > 0) then
		select 1 as Resultado;
	else
		select 0 as Resultado;
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasMoveToPosition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasMoveToPosition`(prUserSigned bigint, pridSeccion Int, pridPregunta Int, prPosicionOrigen int, prPosicionDestino int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
    declare liMaxPosition integer;
    declare liIdPadre integer;
    declare liPrecedencia integer;
    declare liPrecedenciaPadre integer;
        
	-- ----
    declare exit handler for sqlexception
    begin
		select 0 as Resultado;
		rollback;
    end;
    
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;
            
	-- ----
    insert into LogTable(LogSubject, LogLine) Values ('sppreguntasMoveToPosition', concat('prUserSigned=', cast(prUserSigned as signed), ', pridSeccion=', cast(pridSeccion as signed), ', pridPregunta=', cast(pridPregunta as signed), ', prPosicionOrigen=', cast(prPosicionOrigen as signed), ", prPosicionDestino=", cast(prPosicionDestino as signed)));
    start transaction;
    
    --
    if prPosicionDestino > 0 then

		-- Mueve pregunta de posicion y recorre las preguntas debajo
		-- Recorre las preguntas
		if (prPosicionOrigen - prPosicionDestino) > 0 then
			update preguntas 
			   set Precedencia = Precedencia + 1
			 where Precedencia >= prPosicionDestino
			   and Precedencia < prPosicionOrigen
			   and idPregunta <> pridPregunta
			   and idSeccion = pridSeccion;
		elseif (prPosicionOrigen - prPosicionDestino) < 0 then
			update preguntas 
			   set Precedencia = Precedencia - 1
			 where Precedencia <= prPosicionDestino
			   and Precedencia > prPosicionOrigen
			   and idPregunta <> pridPregunta
			   and idSeccion = pridSeccion;    
		end if;
		
		-- Mueve la pregunta destino
		update preguntas
		   set Precedencia = prPosicionDestino
		 where idPregunta = pridPregunta;
         
	else
    
		--
        select Max(Precedencia)+1
          into liMaxPosition
          from preguntas
		 where idSeccion = pridSeccion;    
    
		
        if IsNull(liMaxPosition) then
			set liMaxPosition = 1;
        end if;
        
		-- Mueve la pregunta destino
		update preguntas
		   set Precedencia = prPosicionDestino
		 where idPregunta = pridPregunta;

    end if;
    
    -- Verifica que el padre sea menor a la posicion destino
    select idPreguntaPadre, Precedencia
      into liIdPadre, liPrecedencia
      from preguntas
	 where idPregunta = pridPregunta;
	
    if liIdPadre > 0 then
    
		select Precedencia
		  into liPrecedenciaPadre
		  from preguntas
		 where idPregunta = liIdPadre;
         
         if liPrecedenciaPadre > liPrecedencia then
         
			update preguntas
               set idPreguntaPadre = 0
			 where idPregunta = pridPregunta;
            
         end if;
    
    end if;
     
	-- ----
    commit;
	select 1 as Resultado;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasPreguntasxEncuesta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasPreguntasxEncuesta`(prIdEncuesta Int)
BEGIN

	declare liCount bigint;

	-- 
    select count(*)
      into liCount
      from preguntas P
           inner join secciones S on S.idSeccion = P.idSeccion           
	 where S.idEncuesta = prIdEncuesta;
       
	--
    if (IsNull(liCount)) then
		set liCount = 0;
	end if;
    
    --
	select liCount as Resultado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasUpdate`(pridPregunta Int, prPregunta NVarchar(160), prTipoPregunta Int, prConsecutivo Int, prPrecedencia Int, prObligatoria Bit,
                                     prIdPreguntaPadre Int, prValorCondicion NVarchar(50), pridSeccion Int)
BEGIN

	-- Update
	update preguntas
	   set Pregunta = prPregunta, TipoPregunta = prTipoPregunta, Consecutivo = prConsecutivo, Precedencia = prPrecedencia, Obligatoria = prObligatoria,
           IdPreguntaPadre = prIdPreguntaPadre, ValorCondicion = prValorCondicion, idSeccion = pridSeccion
	 where idPregunta = pridPregunta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasvaloresDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasvaloresDelete`(pridPregunta Int)
BEGIN

	-- Delete
	delete from preguntasvalores where idPregunta = pridPregunta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasvaloresGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasvaloresGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select idPregunta, NumeroMinimo, NumeroMaximo, ListaValores, FechaHoraDesde, FechaHoraHasta, SolicitarRango
          from preguntasvalores
          order by idPregunta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasvaloresGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasvaloresGetById`(prUserSigned bigint, pridPregunta Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idPregunta, NumeroMinimo, NumeroMaximo, ListaValores, FechaHoraDesde, FechaHoraHasta, SolicitarRango
	  from preguntasvalores
	 where idPregunta = pridPregunta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasvaloresInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasvaloresInsert`(pridPregunta Int, prNumeroMinimo Int, prNumeroMaximo Int, prListaValores NVarchar(1024), prFechaHoraDesde Datetime, prFechaHoraHasta Datetime, prSolicitarRango Bit)
BEGIN

	-- Insert
	insert into preguntasvalores(idPregunta, NumeroMinimo, NumeroMaximo, ListaValores, FechaHoraDesde, FechaHoraHasta, SolicitarRango)
				         values (pridPregunta, prNumeroMinimo, prNumeroMaximo, prListaValores, prFechaHoraDesde, prFechaHoraHasta, prSolicitarRango);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sppreguntasvaloresUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sppreguntasvaloresUpdate`(pridPregunta Int, prNumeroMinimo Int, prNumeroMaximo Int, prListaValores NVarchar(1024), prFechaHoraDesde Datetime, prFechaHoraHasta Datetime, prSolicitarRango Bit)
BEGIN

	-- Update
	update preguntasvalores
	   set NumeroMinimo = prNumeroMinimo, NumeroMaximo = prNumeroMaximo, ListaValores = prListaValores, 
           FechaHoraDesde = prFechaHoraDesde, FechaHoraHasta = prFechaHoraHasta, SolicitarRango = prSolicitarRango
	 where idPregunta = pridPregunta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sprespuestasDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sprespuestasDelete`(pridRespuesta Int)
BEGIN

	-- Delete
	delete from respuestas where idRespuesta = pridRespuesta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sprespuestasGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sprespuestasGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select idRespuesta, ValorNumerico, ValorTexto, ValorMultiple, ValorFechaHora, FechaRegistro, idPregunta, idEncuestaRespondida
          from respuestas
          order by idRespuesta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sprespuestasGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sprespuestasGetById`(prUserSigned bigint, pridRespuesta Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idRespuesta, ValorNumerico, ValorTexto, ValorMultiple, ValorFechaHora, FechaRegistro, idPregunta, idEncuestaRespondida
	  from respuestas
	 where idRespuesta = pridRespuesta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sprespuestasHasAnswers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sprespuestasHasAnswers`(pridEncuesta Int)
BEGIN

	declare liCount bigint;

	-- 
    select IfNull(count(*),0)
      into liCount
      from respuestas R
           inner join preguntas P on P.idPregunta = R.idPregunta
           inner join secciones S on S.idSeccion = P.idSeccion
	 where S.idEncuesta = pridEncuesta;
       
    --
    if (liCount > 0) then
		select 1 as Resultado;
	else
		select 0 as Resultado;
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sprespuestasInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sprespuestasInsert`(prValorNumerico Real, prValorTexto NVarchar(1024), prValorMultiple NVarchar(50), prValorFechaHora Datetime, 
                                      prFechaRegistro Datetime, pridPregunta Int, pridEncuestaRespondida Int)
BEGIN

	-- Insert
	insert into respuestas(ValorNumerico, ValorTexto, ValorMultiple, ValorFechaHora, FechaRegistro, idPregunta, idEncuestaRespondida)
                   values (prValorNumerico, prValorTexto, prValorMultiple, prValorFechaHora, prFechaRegistro, pridPregunta, pridEncuestaRespondida);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sprespuestasUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sprespuestasUpdate`(pridRespuesta Int, prValorNumerico Real, prValorTexto NVarchar(1024), prValorMultiple NVarchar(50),
									  prValorFechaHora Datetime, prFechaRegistro Datetime, pridPregunta Int, pridEncuestaRespondida Int)
BEGIN

	-- Update
	update respuestas
	   set ValorNumerico = prValorNumerico, ValorTexto = prValorTexto, ValorMultiple = prValorMultiple, ValorFechaHora = prValorFechaHora,
           FechaRegistro = prFechaRegistro, idPregunta = pridPregunta, idEncuestaRespondida = pridEncuestaRespondida
	 where idRespuesta = pridRespuesta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spseccionesDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spseccionesDelete`(pridSeccion Int)
BEGIN

	-- Borra todas las respuestas de las preguntas de la seccion
    delete from Respuestas
     where idPregunta in (select idPregunta from Preguntas where idSeccion = pridSeccion);
	
	-- Borra todos los valores de las preguntas de la seccion
    delete from PreguntasValores
     where idPregunta in (select idPregunta from Preguntas where idSeccion = pridSeccion);
	
    -- Borra todas las preguntas de la seccion
    delete from Preguntas
     where idSeccion = pridSeccion;
    
	-- Delete seccion
	delete from secciones where idSeccion = pridSeccion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spseccionesGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spseccionesGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select idSeccion, NombreSeccion, NumeroSeccion, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico, idEncuesta
          from secciones
          order by NombreSeccion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spseccionesGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spseccionesGetById`(prUserSigned bigint, pridSeccion Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idSeccion, NombreSeccion, NumeroSeccion, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico, idEncuesta
	  from secciones
	 where idSeccion = pridSeccion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spseccionesGetPosiciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spseccionesGetPosiciones`(prUserSigned bigint, pridEncuesta Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select cast(NumeroSeccion as char) as DescNumeroSeccion, NumeroSeccion
          from (
				select NumeroSeccion
				  from secciones
				 where idEncuesta = pridEncuesta
				  order by NumeroSeccion
			   ) A
		union
        select 'Al final', 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spseccionesInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spseccionesInsert`(prNombreSeccion NVarchar(50), prNumeroSeccion Int, prFechaRegistro Datetime, prFechaModificacion Datetime,
                                     prUsuarioRegistro Int, prUsuarioModifico Int, pridEncuesta Int)
BEGIN

	--
    declare liMaxNumeroSeccion int;
    
    --
    select Max(NumeroSeccion)+1 into liMaxNumeroSeccion
      from Secciones
	 where idEncuesta = pridEncuesta;
     
	if IsNull(liMaxNumeroSeccion) then
		set liMaxNumeroSeccion = 1;
    end if;

	-- Insert
	insert into secciones(NombreSeccion, NumeroSeccion, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico, idEncuesta)
                  values (prNombreSeccion, liMaxNumeroSeccion, prFechaRegistro, prFechaModificacion, prUsuarioRegistro, prUsuarioModifico, pridEncuesta);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spseccionesIsDuplicated` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spseccionesIsDuplicated`(prUserSigned bigint, prIdEncuesta bigint, pridSeccion Int, prNombreSeccion NVarchar(50), pridCliente Int)
BEGIN

	declare liCount bigint;

	-- 
    select count(*)
      into liCount
      from secciones S
	       inner join encuestas E on E.idEncuesta = S.idEncuesta
	 where Trim(Upper(S.NombreSeccion)) = Trim(Upper(prNombreSeccion))
       and S.idEncuesta = prIdEncuesta
       and S.idSeccion <> pridSeccion
       and E.idCliente = pridCliente;
       
	--
    if (IsNull(liCount)) then
		set liCount = 0;
	end if;
    
    --
    if (liCount > 0) then
		select 1 as Resultado;
	else
		select 0 as Resultado;
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spseccionesMoveToPosition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spseccionesMoveToPosition`(prUserSigned bigint, pridEncuesta Int, pridSeccion Int, prNumeroPosicionOrigen int, prNumeroPosicionDestino int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
    declare liMaxPosition integer;
        
	-- ----
    declare exit handler for sqlexception
    begin
		select 0 as Resultado;
		rollback;
    end;
    
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;
            
	-- ----
    insert into LogTable(LogSubject, LogLine) Values ('spseccionesMoveToPosition', concat('prUserSigned=', cast(prUserSigned as signed), ', pridEncuesta=', cast(pridEncuesta as signed), ', pridSeccion=', cast(pridSeccion as signed), ', prNumeroPosicionOrigen=', cast(prNumeroPosicionOrigen as signed), ", prNumeroPosicionDestino=", cast(prNumeroPosicionDestino as signed)));
    start transaction;
    
    --
    if prNumeroPosicionDestino > 0 then

		-- Mueve sección de posicion y recorre las secciones debajo
		-- Recorre las secciones
		if (prNumeroPosicionOrigen - prNumeroPosicionDestino) > 0 then
			update secciones 
			   set NumeroSeccion = NumeroSeccion + 1
			 where NumeroSeccion >= prNumeroPosicionDestino
			   and NumeroSeccion < prNumeroPosicionOrigen
			   and idSeccion <> pridSeccion
			   and idEncuesta = pridEncuesta;
		elseif (prNumeroPosicionOrigen - prNumeroPosicionDestino) < 0 then
			update secciones 
			   set NumeroSeccion = NumeroSeccion - 1
			 where NumeroSeccion <= prNumeroPosicionDestino
			   and NumeroSeccion > prNumeroPosicionOrigen
			   and idSeccion <> pridSeccion
			   and idEncuesta = pridEncuesta;    
		end if;
		
		-- Mueve la seccion destino
		update secciones
		   set NumeroSeccion = prNumeroPosicionDestino
		 where idSeccion = pridSeccion;
         
	else
    
		--
        select Max(NumeroSeccion)+1
          into liMaxPosition
          from secciones
		 where idEncuesta = pridEncuesta;    
		
        if IsNull(liMaxPosition) then
			set liMaxPosition = 1;
        end if;
    
		-- Mueve la seccion destino
		update secciones
		   set NumeroSeccion = prNumeroPosicionDestino
		 where idSeccion = pridSeccion;

    end if;
     
	-- ----
    commit;
	select 1 as Resultado;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spseccionesUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spseccionesUpdate`(pridSeccion Int, prNombreSeccion NVarchar(50), prNumeroSeccion Int, prFechaRegistro Datetime,
                                     prFechaModificacion Datetime, prUsuarioRegistro Int, prUsuarioModifico Int, pridEncuesta Int)
BEGIN

	-- Update
	update secciones
	   set NombreSeccion = prNombreSeccion, NumeroSeccion = prNumeroSeccion, FechaRegistro = prFechaRegistro, FechaModificacion = prFechaModificacion,
           UsuarioRegistro = prUsuarioRegistro, UsuarioModifico = prUsuarioModifico, idEncuesta = pridEncuesta
	 where idSeccion = pridSeccion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spsysmodulosDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spsysmodulosDelete`(pridModulo Int)
BEGIN

	-- Delete
	delete from sysmodulos where idModulo = pridModulo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spsysmodulosGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spsysmodulosGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select idModulo, Modulo, PageName, PageRelativeURL, ModuloPadre
          from sysmodulos
          order by Modulo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spsysmodulosGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spsysmodulosGetById`(prUserSigned bigint, pridModulo Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idModulo, Modulo, PageName, PageRelativeURL, ModuloPadre
	  from sysmodulos
	 where idModulo = pridModulo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spsysmodulosInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spsysmodulosInsert`(pridModulo Int, prModulo NVarchar(50), prPageName NVarchar(50), prPageRelativeURL NVarchar(255), prModuloPadre Int)
BEGIN

	-- Insert
	insert into sysmodulos(idModulo, Modulo, PageName, PageRelativeURL, ModuloPadre)
                   values (pridModulo, prModulo, prPageName, prPageRelativeURL, prModuloPadre);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spsysmodulosrolesDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spsysmodulosrolesDelete`(prSysModulos_idModulo Int, prRol Int)
BEGIN

	-- Delete
	delete from sysmodulosroles where SysModulos_idModulo = prSysModulos_idModulo and SysRoles_idRol = prRol;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spsysmodulosrolesGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spsysmodulosrolesGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select SysModulos_idModulo, SysRoles_idRol
          from sysmodulosroles
          order by SysModulos_idModulo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spsysmodulosrolesGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spsysmodulosrolesGetById`(prUserSigned bigint, prSysModulos_idModulo Int, prRol Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select SysModulos_idModulo, SysRoles_idRol
	  from sysmodulosroles
	 where SysModulos_idModulo = prSysModulos_idModulo and SysRoles_idRol = prRol;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spsysmodulosrolesInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spsysmodulosrolesInsert`(prSysModulos_idModulo Int, prRol Int)
BEGIN

	-- Insert
	insert into sysmodulosroles(SysModulos_idModulo, SysRoles_idRol) values (prSysModulos_idModulo, prRol);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spsysmodulosUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spsysmodulosUpdate`(pridModulo Int, prModulo NVarchar(50), prPageName NVarchar(50), prPageRelativeURL NVarchar(255), prModuloPadre Int)
BEGIN

	-- Update
	update sysmodulos
	   set Modulo = prModulo, PageName = prPageName, PageRelativeURL = prPageRelativeURL, ModuloPadre = prModuloPadre
	 where idModulo = pridModulo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spsysrolesDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spsysrolesDelete`(pridRol Int)
BEGIN

	-- Delete
	delete from sysroles where idRol = pridRol;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spsysrolesGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spsysrolesGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select idRol, NombreRol
          from sysroles
          order by NombreRol;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spsysrolesGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spsysrolesGetById`(prUserSigned bigint, pridRol Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idRol, NombreRol
	  from sysroles
	 where idRol = pridRol;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spsysrolesInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spsysrolesInsert`(pridRol Int, prNombreRol NVarchar(30))
BEGIN

	-- Insert
	insert into sysroles(idRol, NombreRol) values (pridRol, prNombreRol);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spsysrolesUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spsysrolesUpdate`(pridRol Int, prNombreRol NVarchar(30))
BEGIN

	-- Update
	update sysroles
	   set NombreRol = prNombreRol
	 where idRol = pridRol;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spusuariosChangePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spusuariosChangePassword`(pridUsuario Bigint, psPassword varchar(60), psPasswordKey varchar(32), piRemoveUsuarioNuevo int)
BEGIN

	declare lxRemove varchar(5) default 'No';

	-- Remove usuario nuevo
    if piRemoveUsuarioNuevo = 1 then
		update usuarios
		   set UsuarioNuevo = b'0'
		 where idUsuario = pridUsuario;
         set lxRemove = 'Si';
    end if;

	-- Update password
	update usuarios
	   set Password = AES_ENCRYPT(psPassword,psPasswordKey)
	 where idUsuario = pridUsuario;

	--
	SELECT ROW_COUNT(); -- , piRemoveUsuarioNuevo, lxRemove;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spusuariosDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spusuariosDelete`(pridUsuario Int)
BEGIN

	-- Delete
	delete from usuarios where idUsuario = pridUsuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spusuariosGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spusuariosGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select idUsuario, Usuario, NombreUsuario, Rol, Activo, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico, idCliente
          from usuarios
          order by Usuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spusuariosGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spusuariosGetById`(prUserSigned bigint, pridUsuario Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idUsuario, Usuario, NombreUsuario, Rol, Activo, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico, idCliente
	  from usuarios
	 where idUsuario = pridUsuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUsuariosGetByUserName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUsuariosGetByUserName`(prUserSigned integer, prUserName varchar(60))
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idUsuario, Usuario, NombreUsuario, Activo, Password, FechaRegistro, UsuarioRegistro, 
           FechaModificacion, UsuarioModifico, idCliente, Rol
	  from usuarios
	 where Upper(Usuario) = Upper(prUserName);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spusuariosInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spusuariosInsert`(prUsuario NVarchar(80), prNombreUsuario NVarchar(80), prRol Int, prActivo Bit, prFechaRegistro Datetime,
                                    prFechaModificacion Datetime, prUsuarioRegistro Int, prUsuarioModifico Int, pridCliente Int
)
BEGIN

	-- Insert
	insert into usuarios(Usuario, NombreUsuario, Rol, Activo, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico, idCliente)
				 values (prUsuario, prNombreUsuario, prRol, prActivo, prFechaRegistro, prFechaModificacion, prUsuarioRegistro, prUsuarioModifico, pridCliente);

	-- Regresa el ID insertado
	select last_insert_id() as IdAdded;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spusuariosIsDuplicated` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spusuariosIsDuplicated`(prUserSigned bigint, pridUsuario bigint, prNombre NVarchar(50), prValidaUsuarioOrName int)
BEGIN

	declare liCount bigint;

	-- 
    if prValidaUsuarioOrName = 1 then -- Valida nombre
		select ifnull(count(*),0)
		  into liCount
		  from usuarios
		 where Trim(Upper(NombreUsuario)) = Trim(Upper(prNombre))
		   and idUsuario <> pridUsuario;
	else -- Valida usuario
		select ifnull(count(*),0)
		  into liCount
		  from usuarios
		 where Trim(Upper(Usuario)) = Trim(Upper(prNombre))
		   and idUsuario <> pridUsuario;    
    end if;
       
    --
    if (liCount > 0) then
		select 1 as Resultado;
	else
		select 0 as Resultado;
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spusuariosUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spusuariosUpdate`(pridUsuario Int, prUsuario NVarchar(80), prNombreUsuario NVarchar(80), prRol Int, prActivo Bit, prFechaRegistro Datetime,
                                    prFechaModificacion Datetime, prUsuarioRegistro Int, prUsuarioModifico Int, pridCliente Int)
BEGIN

	-- Update
	update usuarios
	   set Usuario = prUsuario, NombreUsuario = prNombreUsuario, Rol = prRol, Activo = prActivo, FechaRegistro = prFechaRegistro,
           FechaModificacion = prFechaModificacion, UsuarioRegistro = prUsuarioRegistro, UsuarioModifico = prUsuarioModifico, idCliente = pridCliente
	 where idUsuario = pridUsuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUsuariosValidaPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUsuariosValidaPassword`(prUserSigned integer, prIdUser integer, psPassword varchar(60), psPasswordKey varchar(32))
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
    select geo.ValidaUserPassword(prIdUser, psPassword, psPasswordKey) as Valida;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwclienteslogosurlGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwclienteslogosurlGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;    
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select idCliente, Alias, NombreImagenLogo
          from vwclienteslogosurl
          order by Alias;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwclienteslogosurlGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwclienteslogosurlGetById`(prUserSigned bigint, pridCliente int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idCliente, Alias, NombreImagenLogo
	  from vwclienteslogosurl
	 where idCliente = pridCliente;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwlistaclientesGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwlistaclientesGetAll`(prUserSigned bigint, prNombreCliente NVarchar(30))
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select idCliente, RazonSocial, Alias, Activo, LimiteEncuestas, Vigencia, FechaRegistro,
               NombreParte1, NombreParte2, Estado, TotalEncuestas, CreadaPor
          from vwlistaclientes
		 where (Upper(RazonSocial) LIKE concat('%', Upper(prNombreCliente), '%'))
            or (Upper(Alias) LIKE concat('%', Upper(prNombreCliente), '%'))
          order by RazonSocial;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwlistaclientesGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwlistaclientesGetById`(prUserSigned bigint, pridCliente bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idCliente, RazonSocial, Alias, Activo, LimiteEncuestas, Vigencia, FechaRegistro,
           NombreParte1, NombreParte2, Estado, TotalEncuestas, CreadaPor
	  from vwlistaclientes
	 where idCliente = pridCliente;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwlistaencuestasGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwlistaencuestasGetAll`(prUserSigned bigint, prNombreEncuesta NVarchar(30))
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;

	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	/* Este comando esta comentado porque al buscar manda error:
    
        -- Select
        select idEncuesta, NombreEncuesta, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico, idCliente,
               NombreParte1, NombreParte2, RazonSocial, Alias, TotPreguntas, EncuestasContestadas
          from vwlistaencuestas
		 where idCliente = liIdCliente            
	       and NombreEncuesta like _utf8 '' || @prNombreEncuesta collate utf8_spanish_ci
          order by NombreEncuesta;
          
	*/
   /* 
     La solucion sería mediante armanda la cadena del comando y ejecutarla
     
    SET @nombre = CONCAT('%', 'quiro' ,'%');
    SET @t1 =CONCAT('SELECT * FROM vwlistaencuestas WHERE NombreEncuesta LIKE _utf8 ''', @nombre, ''' collate utf8_spanish_ci');
    select @t1;
    PREPARE stmt3 FROM @t1;
    EXECUTE stmt3;
    DEALLOCATE PREPARE stmt3;
    
    */

	-- Select
	select idEncuesta, NombreEncuesta, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico, idCliente,
		   NombreParte1, NombreParte2, RazonSocial, Alias, TotPreguntas, EncuestasContestadas, CreadaPor
	  from vwlistaencuestas
	 where idCliente = liIdCliente            
	   and ( (Upper(NombreEncuesta) LIKE concat('%', Upper(prNombreEncuesta), '%')) )
	  order by NombreEncuesta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwlistaencuestasGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwlistaencuestasGetById`(prUserSigned bigint, pridEncuesta bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idEncuesta, NombreEncuesta, FechaRegistro, FechaModificacion, UsuarioRegistro, UsuarioModifico, idCliente,
           NombreParte1, NombreParte2, RazonSocial, Alias, TotPreguntas, EncuestasContestadas, CreadaPor
	  from vwlistaencuestas
	 where idCliente = liIdCliente
       and idEncuesta = pridEncuesta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwlistapreguntasGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwlistapreguntasGetAll`(prUserSigned bigint, prIdEncuesta bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select idSeccion, NombreSeccion, NumeroSeccion, idEncuesta, idPregunta, Pregunta, TipoPregunta, Consecutivo,
               Precedencia, Obligatoria, idPreguntaPadre, ValorCondicion, NumeroMinimo, NumeroMaximo, ListaValores,
               FechaHoraDesde, FechaHoraHasta, SolicitarRango, idCliente, DescTipoPregunta, ConsecutivoPadre, PadreCodeName
          from vwlistapreguntas
		 where idCliente = liIdCliente
           and idEncuesta = prIdEncuesta
          order by NumeroSeccion, Precedencia;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwlistapreguntasGetByPregunta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwlistapreguntasGetByPregunta`(prUserSigned bigint, pridPregunta Int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idSeccion, NombreSeccion, NumeroSeccion, idEncuesta, idPregunta, Pregunta, TipoPregunta, Consecutivo,
		   Precedencia, Obligatoria, idPreguntaPadre, ValorCondicion, NumeroMinimo, NumeroMaximo, ListaValores,
		   FechaHoraDesde, FechaHoraHasta, SolicitarRango, idCliente, DescTipoPregunta, ConsecutivoPadre, PadreCodeName
	  from vwlistapreguntas
	 where idCliente = liIdCliente
       and idPregunta = pridPregunta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwlistapreguntasGetBySeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwlistapreguntasGetBySeccion`(prUserSigned bigint, prIdSeccion bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idSeccion, NombreSeccion, NumeroSeccion, idEncuesta, idPregunta, Pregunta, TipoPregunta, Consecutivo,
		   Precedencia, Obligatoria, idPreguntaPadre, ValorCondicion, NumeroMinimo, NumeroMaximo, ListaValores,
		   FechaHoraDesde, FechaHoraHasta, SolicitarRango, idCliente, DescTipoPregunta, ConsecutivoPadre, PadreCodeName
	  from vwlistapreguntas
	 where idCliente = liIdCliente
       and idSeccion = prIdSeccion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwlistapreguntasGetQuestions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwlistapreguntasGetQuestions`(prUserSigned bigint, prIdEncuesta bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select idSeccion, NombreSeccion, NumeroSeccion, idEncuesta, idPregunta, Pregunta, TipoPregunta, Consecutivo,
               Precedencia, Obligatoria, idPreguntaPadre, ValorCondicion, NumeroMinimo, NumeroMaximo, ListaValores,
               FechaHoraDesde, FechaHoraHasta, SolicitarRango, idCliente, DescTipoPregunta, ConsecutivoPadre, PadreCodeName
          from vwlistapreguntas
		 where idCliente = liIdCliente
           and idEncuesta = prIdEncuesta
           and not IsNull(idPregunta)
           -- and (idPreguntaPadre = 0 or Trim(ValorCondicion) = '')
          order by NumeroSeccion, Precedencia;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwlistarespuestasGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwlistarespuestasGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
		select idPregunta, Precedencia, Pregunta, TipoPregunta, idSeccion, ValorRespuesta, FechaRespuesta, idRespuesta,
			   NombreSeccion, idEncuesta, CorreoRespuestaEncuesta, idEncuestaRespondida
          from vwlistarespuestas
          order by CorreoRespuestaEncuesta, idSeccion, FechaRespuesta DESC, Precedencia;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwlistarespuestasGetByEncuesta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwlistarespuestasGetByEncuesta`(prUserSigned bigint, pridEncuesta bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
		select idPregunta, Precedencia, Pregunta, TipoPregunta, idSeccion, ValorRespuesta, FechaRespuesta, idRespuesta,
			   NombreSeccion, idEncuesta, CorreoRespuestaEncuesta, idEncuestaRespondida
          from vwlistarespuestas
		 where idEncuesta = pridEncuesta
          order by CorreoRespuestaEncuesta, idSeccion, FechaRespuesta DESC, Precedencia;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwlistarespuestasGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwlistarespuestasGetById`(prUserSigned bigint, pridPregunta int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idPregunta, Precedencia, Pregunta, TipoPregunta, idSeccion, ValorRespuesta, FechaRespuesta, idRespuesta,
           NombreSeccion, idEncuesta, CorreoRespuestaEncuesta, idEncuestaRespondida
	  from vwlistarespuestas
	 where idPregunta = pridPregunta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwlistausuariosGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwlistausuariosGetAll`(prUserSigned bigint, prNombre NVarchar(30))
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idUsuario, Usuario, NombreUsuario, Rol, Activo, idCliente, Estado, NombreRol, AliasCliente, RazonSocial
	  from vwlistausuarios
	 where (Upper(NombreUsuario) LIKE concat('%', Upper(prNombre), '%'))
		or (Upper(Usuario) LIKE concat('%', Upper(prNombre), '%'))
		or (Upper(NombreRol) LIKE concat('%', Upper(prNombre), '%'))
		or (Upper(RazonSocial) LIKE concat('%', Upper(prNombre), '%'))
	  order by NombreUsuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwlistausuariosGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwlistausuariosGetById`(prUserSigned bigint, pridUsuario bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idUsuario, Usuario, NombreUsuario, Rol, Activo, idCliente, Estado, NombreRol, AliasCliente, RazonSocial
	  from vwlistausuarios
	 where idUsuario = pridUsuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwlstNumeroSeccionesGetPosiciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwlstNumeroSeccionesGetPosiciones`(prUserSigned bigint, pridEncuesta Int, prIncluyeFinal int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	--
    if prIncluyeFinal = 1 then
        -- Select
        select DescNumeroSeccion, NumeroSeccion, idEncuesta
          from vwlstNumeroSecciones
		 where idEncuesta = pridEncuesta
		union
        select 'Al final', 0, 0
        order by idEncuesta desc, NumeroSeccion;
	else
        -- Select
        select DescNumeroSeccion, NumeroSeccion, idEncuesta
          from vwlstNumeroSecciones
		 where idEncuesta = pridEncuesta
        order by idEncuesta desc, NumeroSeccion;
    end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwmodulosrolesGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwmodulosrolesGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select idModulo, Modulo, PageName, PageRelativeURL, ModuloPadre, idRol, NombreRol
          from vwmodulosroles
          order by Modulo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwmodulosrolesGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwmodulosrolesGetById`(prUserSigned bigint, pridModulo int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idModulo, Modulo, PageName, PageRelativeURL, ModuloPadre, idRol, NombreRol
	  from vwmodulosroles
	 where idModulo = pridModulo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwmodulosrolesHasAccess` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwmodulosrolesHasAccess`(prUserSigned bigint, pridRol bigint, prPageName VARCHAR(50))
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select (Count(*) > 0) as HasAccess
	  from vwmodulosroles
	 where idRol = pridRol
       and Upper(PageName) = Upper(Trim(prPageName));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwrespuestasencuestaGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwrespuestasencuestaGetAll`(prUserSigned bigint, pridEncuesta bigint, prDesde datetime, prHasta datetime)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

     -- insert into LogTable(LogSubject, LogLine) Values ('spvwrespuestasencuestaGetAll', concat('prUserSigned=', cast(prUserSigned as signed), ', pridEncuesta=', cast(pridEncuesta as signed), ', prDesde=', cast(prDesde as char), ', prHasta=', cast(prHasta as char)));
    
        -- Select
        select idPregunta, Precedencia, Pregunta, TipoPregunta, idSeccion, ValorRespuesta, FechaRegistro, idRespuesta, NombreSeccion, 
               idEncuesta, CorreoRespuestaEncuesta, idEncuestaRespondida, FechaInicialRespuesta, FechaFinalRespuesta, ElapTime,
               NombreEncuesta, RazonSocial, Alias
          from vwrespuestasencuesta
		 where idEncuesta = pridEncuesta
           -- and FechaInicialRespuesta between CAST(prDesde as datetime) and CAST(prHasta as datetime)
           and (FechaInicialRespuesta >= prDesde
                and FechaInicialRespuesta <= prHasta
		   	   )
          order by CorreoRespuestaEncuesta, idEncuesta, idSeccion, Precedencia;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwrespuestasencuestaGetById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwrespuestasencuestaGetById`(prUserSigned bigint, pridPregunta int)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
	select idPregunta, Precedencia, Pregunta, TipoPregunta, idSeccion, ValorRespuesta, FechaRegistro, idRespuesta, NombreSeccion,
           idEncuesta, CorreoRespuestaEncuesta, idEncuestaRespondida, FechaInicialRespuesta, FechaFinalRespuesta, ElapTime,
           NombreEncuesta, RazonSocial, Alias
	  from vwrespuestasencuesta
	 where idPregunta = pridPregunta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwresumenencuestaGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwresumenencuestaGetAll`(prUserSigned bigint)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

        -- Select
        select idPregunta, Precedencia, Pregunta, TipoPregunta, idSeccion, ValorRespuesta, idEncuesta, FechaRespuesta, NombreSeccion, TotalPregunta
          from vwresumenencuesta
		order by idPRegunta, ValorRespuesta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spvwresumenencuestaGetByEncuesta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spvwresumenencuestaGetByEncuesta`(prUserSigned bigint, pridEncuesta bigint, prDesde datetime, prHasta datetime)
BEGIN

	--
	declare liIdUserSigned bigint default 0;
	declare liIdRol int unsigned default 0;
	declare llActivo bit default 0;
    declare liIdCliente integer unsigned default 0;
        
	-- Obtiene datos del usuario firmado
    select idUsuario, Activo, Rol, idCliente
	  into liIdUserSigned, llActivo, liIdRol, liIdCliente
	  from vwUsersSecurityData
      where idUsuario = prUserSigned;

	-- Select
/*
	select idPregunta, Precedencia, Pregunta, TipoPregunta, idSeccion, ValorRespuesta, idEncuesta, FechaRespuesta, NombreSeccion, TotalPregunta
	  from vwresumenencuesta
     where idEncuesta = pridEncuesta
	   and (FechaRespuesta >= prDesde
			and FechaRespuesta <= prHasta
		   )
    order by idPregunta, ValorRespuesta;
*/

    
    select p.idPregunta, p.Precedencia, p.Pregunta, p.TipoPregunta, p.idSeccion,
           ifnull(geo.GetValorRespuesta(r.idRespuesta, 1),"(sin respuesta)") AS ValorRespuesta,
           er.idEncuesta, er.FechaRegistro as FechaRespuesta, s.NombreSeccion,
           count(*) as TotalPregunta
    from respuestas r
         inner join preguntas p ON p.idPregunta = r.idPregunta
         inner join encuestarespuestas er ON r.idEncuestaRespondida = er.idEncuestaRespondida
         inner join secciones s ON s.idSeccion = p.idSeccion
	 where TipoPregunta not in (3,4) -- Quitar respuestas tipo texto
		 and er.idEncuesta = pridEncuesta
		   and (er.FechaRegistro >= prDesde
				and er.FechaRegistro <= prHasta
			   )
	 group by p.idPregunta, ValorRespuesta
	order by p.idPRegunta, ValorRespuesta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vwlistaclientes`
--

/*!50001 DROP VIEW IF EXISTS `vwlistaclientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwlistaclientes` AS select `c`.`idCliente` AS `idCliente`,`c`.`RazonSocial` AS `RazonSocial`,`c`.`Alias` AS `Alias`,`c`.`Activo` AS `Activo`,`c`.`LimiteEncuestas` AS `LimiteEncuestas`,`c`.`Vigencia` AS `Vigencia`,`c`.`FechaRegistro` AS `FechaRegistro`,substr(trim(`c`.`RazonSocial`),1,35) AS `NombreParte1`,substr(trim(`c`.`RazonSocial`),36,45) AS `NombreParte2`,if((`c`.`Activo` = 1),'Activo','Inactivo') AS `Estado`,ifnull(`ec`.`TotEncuestas`,0) AS `TotalEncuestas`,`u`.`NombreUsuario` AS `CreadaPor` from ((`geo`.`clientes` `c` left join (select `geo`.`encuestas`.`idCliente` AS `idCliente`,count(0) AS `TotEncuestas` from `geo`.`encuestas` group by `geo`.`encuestas`.`idCliente`) `ec` on((`ec`.`idCliente` = `c`.`idCliente`))) join `geo`.`usuarios` `u` on((`u`.`idUsuario` = `c`.`UsuarioRegistro`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwlistaencuestas`
--

/*!50001 DROP VIEW IF EXISTS `vwlistaencuestas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwlistaencuestas` AS select `e`.`idEncuesta` AS `idEncuesta`,`e`.`NombreEncuesta` AS `NombreEncuesta`,`e`.`FechaRegistro` AS `FechaRegistro`,`e`.`FechaModificacion` AS `FechaModificacion`,`e`.`UsuarioRegistro` AS `UsuarioRegistro`,`e`.`UsuarioModifico` AS `UsuarioModifico`,`e`.`idCliente` AS `idCliente`,substr(trim(`e`.`NombreEncuesta`),1,30) AS `NombreParte1`,substr(trim(`e`.`NombreEncuesta`),31,20) AS `NombreParte2`,`c`.`RazonSocial` AS `RazonSocial`,`c`.`Alias` AS `Alias`,ifnull(`tp`.`TotPreguntas`,0) AS `TotPreguntas`,ifnull(`ec`.`TotEncuestas`,0) AS `EncuestasContestadas`,`u`.`NombreUsuario` AS `CreadaPor` from ((((`geo`.`encuestas` `e` join `geo`.`clientes` `c` on((`c`.`idCliente` = `e`.`idCliente`))) left join (select `s`.`idEncuesta` AS `idEncuesta`,count(0) AS `TotPreguntas` from (`geo`.`secciones` `s` join `geo`.`preguntas` `p` on((`p`.`idSeccion` = `s`.`idSeccion`))) group by `s`.`idEncuesta`) `tp` on((`tp`.`idEncuesta` = `e`.`idEncuesta`))) left join (select `geo`.`encuestarespuestas`.`idEncuesta` AS `idEncuesta`,count(`geo`.`encuestarespuestas`.`CorreoRespuestaEncuesta`) AS `TotEncuestas` from `geo`.`encuestarespuestas` group by `geo`.`encuestarespuestas`.`idEncuesta`) `ec` on((`ec`.`idEncuesta` = `e`.`idEncuesta`))) join `geo`.`usuarios` `u` on((`u`.`idUsuario` = `e`.`UsuarioRegistro`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwlistapreguntas`
--

/*!50001 DROP VIEW IF EXISTS `vwlistapreguntas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwlistapreguntas` AS select `s`.`idSeccion` AS `idSeccion`,`s`.`NombreSeccion` AS `NombreSeccion`,`s`.`NumeroSeccion` AS `NumeroSeccion`,`s`.`idEncuesta` AS `idEncuesta`,`p`.`idPregunta` AS `idPregunta`,`p`.`Pregunta` AS `Pregunta`,`p`.`TipoPregunta` AS `TipoPregunta`,`p`.`Consecutivo` AS `Consecutivo`,`p`.`Precedencia` AS `Precedencia`,`p`.`Obligatoria` AS `Obligatoria`,`p`.`IdPreguntaPadre` AS `idPreguntaPadre`,`p`.`ValorCondicion` AS `ValorCondicion`,`pv`.`NumeroMinimo` AS `NumeroMinimo`,`pv`.`NumeroMaximo` AS `NumeroMaximo`,`pv`.`ListaValores` AS `ListaValores`,`pv`.`FechaHoraDesde` AS `FechaHoraDesde`,`pv`.`FechaHoraHasta` AS `FechaHoraHasta`,`pv`.`SolicitarRango` AS `SolicitarRango`,`e`.`idCliente` AS `idCliente`,`tp`.`DescTipoPregunta` AS `DescTipoPregunta`,`pp`.`Precedencia` AS `ConsecutivoPadre`,if((`p`.`IdPreguntaPadre` = 0),'',concat('ID',convert(lpad(`p`.`IdPreguntaPadre`,10,0) using utf8mb4))) AS `PadreCodeName` from (((((`secciones` `s` left join `preguntas` `p` on((`s`.`idSeccion` = `p`.`idSeccion`))) left join `preguntasvalores` `pv` on((`p`.`idPregunta` = `pv`.`idPregunta`))) join `encuestas` `e` on((`s`.`idEncuesta` = `e`.`idEncuesta`))) left join `vwtipospreguntas` `tp` on((`p`.`TipoPregunta` = `tp`.`TipoPregunta`))) left join `preguntas` `pp` on((`pp`.`idPregunta` = `p`.`IdPreguntaPadre`))) order by `s`.`NumeroSeccion`,`p`.`Precedencia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwlistarespuestas`
--

/*!50001 DROP VIEW IF EXISTS `vwlistarespuestas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwlistarespuestas` AS select `p`.`idPregunta` AS `idPregunta`,`p`.`Precedencia` AS `Precedencia`,`p`.`Pregunta` AS `Pregunta`,`p`.`TipoPregunta` AS `TipoPregunta`,`p`.`idSeccion` AS `idSeccion`,`geo`.`GetValorRespuesta`(`r`.`idRespuesta`,0) AS `ValorRespuesta`,`r`.`FechaRegistro` AS `FechaRespuesta`,`r`.`idRespuesta` AS `idRespuesta`,`s`.`NombreSeccion` AS `NombreSeccion`,`s`.`idEncuesta` AS `idEncuesta`,`er`.`CorreoRespuestaEncuesta` AS `CorreoRespuestaEncuesta`,`er`.`idEncuestaRespondida` AS `idEncuestaRespondida` from (((`encuestarespuestas` `er` join `respuestas` `r` on((`r`.`idEncuestaRespondida` = `er`.`idEncuestaRespondida`))) join `preguntas` `p` on((`p`.`idPregunta` = `r`.`idPregunta`))) join `secciones` `s` on((`s`.`idSeccion` = `p`.`idSeccion`))) order by `er`.`CorreoRespuestaEncuesta`,`p`.`idSeccion`,`r`.`FechaRegistro` desc,`p`.`Precedencia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwlistausuarios`
--

/*!50001 DROP VIEW IF EXISTS `vwlistausuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwlistausuarios` AS select `u`.`idUsuario` AS `idUsuario`,`u`.`Usuario` AS `Usuario`,`u`.`NombreUsuario` AS `NombreUsuario`,`u`.`Rol` AS `Rol`,`u`.`Activo` AS `Activo`,`u`.`idCliente` AS `idCliente`,if((`u`.`Activo` = 1),'Activo','Inactivo') AS `Estado`,`r`.`NombreRol` AS `NombreRol`,`c`.`Alias` AS `AliasCliente`,`c`.`RazonSocial` AS `RazonSocial` from ((`usuarios` `u` join `sysroles` `r` on((`r`.`idRol` = `u`.`Rol`))) join `clientes` `c` on((`c`.`idCliente` = `u`.`idCliente`))) where (`u`.`idUsuario` > 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwlstnumerosecciones`
--

/*!50001 DROP VIEW IF EXISTS `vwlstnumerosecciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwlstnumerosecciones` AS select cast(`a`.`NumeroSeccion` as char charset utf8mb4) AS `DescNumeroSeccion`,`a`.`NumeroSeccion` AS `NumeroSeccion`,`a`.`idEncuesta` AS `idEncuesta` from (select `geo`.`secciones`.`NumeroSeccion` AS `NumeroSeccion`,`geo`.`secciones`.`idEncuesta` AS `idEncuesta` from `geo`.`secciones` order by `geo`.`secciones`.`NumeroSeccion`) `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwmodulosroles`
--

/*!50001 DROP VIEW IF EXISTS `vwmodulosroles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwmodulosroles` AS select `m`.`idModulo` AS `idModulo`,`m`.`Modulo` AS `Modulo`,`m`.`PageName` AS `PageName`,`m`.`PageRelativeURL` AS `PageRelativeURL`,`m`.`ModuloPadre` AS `ModuloPadre`,`r`.`idRol` AS `idRol`,`r`.`NombreRol` AS `NombreRol` from ((`sysmodulos` `m` join `sysmodulosroles` `mr` on((`m`.`idModulo` = `mr`.`SysModulos_idModulo`))) join `sysroles` `r` on((`r`.`idRol` = `mr`.`SysRoles_idRol`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwrespuestasencuesta`
--

/*!50001 DROP VIEW IF EXISTS `vwrespuestasencuesta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwrespuestasencuesta` AS select `p`.`idPregunta` AS `idPregunta`,`p`.`Precedencia` AS `Precedencia`,`p`.`Pregunta` AS `Pregunta`,`p`.`TipoPregunta` AS `TipoPregunta`,`p`.`idSeccion` AS `idSeccion`,`geo`.`GetValorRespuesta`(`r`.`idRespuesta`,0) AS `ValorRespuesta`,`r`.`FechaRegistro` AS `FechaRegistro`,`r`.`idRespuesta` AS `idRespuesta`,`s`.`NombreSeccion` AS `NombreSeccion`,`s`.`idEncuesta` AS `idEncuesta`,`er`.`CorreoRespuestaEncuesta` AS `CorreoRespuestaEncuesta`,`er`.`idEncuestaRespondida` AS `idEncuestaRespondida`,`er`.`FechaRegistro` AS `FechaInicialRespuesta`,`er`.`FechaRegistroFinal` AS `FechaFinalRespuesta`,date_format(timediff(`er`.`FechaRegistroFinal`,`er`.`FechaRegistro`),'%H:%i:%s') AS `ElapTime`,`e`.`NombreEncuesta` AS `NombreEncuesta`,`c`.`RazonSocial` AS `RazonSocial`,`c`.`Alias` AS `Alias` from (((((`encuestarespuestas` `er` join `respuestas` `r` on((`r`.`idEncuestaRespondida` = `er`.`idEncuestaRespondida`))) join `preguntas` `p` on((`p`.`idPregunta` = `r`.`idPregunta`))) join `secciones` `s` on((`s`.`idSeccion` = `p`.`idSeccion`))) join `encuestas` `e` on((`e`.`idEncuesta` = `er`.`idEncuesta`))) join `clientes` `c` on((`c`.`idCliente` = `e`.`idCliente`))) order by `er`.`CorreoRespuestaEncuesta`,`p`.`idSeccion`,`r`.`FechaRegistro` desc,`p`.`Precedencia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwresumenencuesta`
--

/*!50001 DROP VIEW IF EXISTS `vwresumenencuesta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwresumenencuesta` AS select `p`.`idPregunta` AS `idPregunta`,`p`.`Precedencia` AS `Precedencia`,`p`.`Pregunta` AS `Pregunta`,`p`.`TipoPregunta` AS `TipoPregunta`,`p`.`idSeccion` AS `idSeccion`,ifnull(`geo`.`GetValorRespuesta`(`r`.`idRespuesta`,1),'(sin respuesta)') AS `ValorRespuesta`,`er`.`idEncuesta` AS `idEncuesta`,`er`.`FechaRegistro` AS `FechaRespuesta`,`s`.`NombreSeccion` AS `NombreSeccion`,count(0) AS `TotalPregunta` from (((`respuestas` `r` join `preguntas` `p` on((`p`.`idPregunta` = `r`.`idPregunta`))) join `encuestarespuestas` `er` on((`r`.`idEncuestaRespondida` = `er`.`idEncuestaRespondida`))) join `secciones` `s` on((`s`.`idSeccion` = `p`.`idSeccion`))) where (`p`.`TipoPregunta` not in (3,4)) group by `p`.`idPregunta`,`ValorRespuesta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwtipospreguntas`
--

/*!50001 DROP VIEW IF EXISTS `vwtipospreguntas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwtipospreguntas` AS select 1 AS `TipoPregunta`,'Valoración' AS `DescTipoPregunta` union select 2 AS `2`,'Valor numérico' AS `Valor numérico` union select 3 AS `3`,'Texto corto' AS `Texto corto` union select 4 AS `4`,'Texto largo' AS `Texto largo` union select 5 AS `5`,'Opción múltiple' AS `Opción múltiple` union select 6 AS `6`,'Selección múltiple' AS `Selección múltiple` union select 7 AS `7`,'Lista desplegable' AS `Lista desplegable` union select 8 AS `8`,'Fecha' AS `Fecha` union select 9 AS `9`,'Hora' AS `Hora` union select 0 AS `0`,'Ninguno' AS `Ninguno` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwuserssecuritydata`
--

/*!50001 DROP VIEW IF EXISTS `vwuserssecuritydata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwuserssecuritydata` AS select `u`.`idUsuario` AS `idUsuario`,`u`.`Activo` AS `Activo`,`u`.`Rol` AS `Rol`,`u`.`idCliente` AS `IdCliente` from (`usuarios` `u` join `sysroles` `r` on((`u`.`Rol` = `r`.`idRol`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-26 13:34:42
