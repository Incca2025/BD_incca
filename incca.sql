-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: incca
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignaturas` (
  `IdAsignatura` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodAsignatura` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesAsignatura` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdDepartamento` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdAsignatura`),
  UNIQUE KEY `asignaturas_codasignatura_unique` (`CodAsignatura`),
  KEY `asignaturas_iddepartamento_foreign` (`IdDepartamento`),
  CONSTRAINT `asignaturas_iddepartamento_foreign` FOREIGN KEY (`IdDepartamento`) REFERENCES `departamentos` (`IdDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobros_estudiante`
--

DROP TABLE IF EXISTS `cobros_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cobros_estudiante` (
  `IdCobros` bigint unsigned NOT NULL AUTO_INCREMENT,
  `IdCostEstudiante` bigint unsigned NOT NULL,
  `NumCuota` int unsigned NOT NULL,
  `ValorCobro` decimal(10,2) NOT NULL,
  `ValorAbonado` decimal(10,2) NOT NULL,
  `MesCobro` int unsigned NOT NULL,
  `YearCobro` int unsigned NOT NULL,
  `IdFacturaPSE` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdCobros`),
  KEY `cobros_estudiante_idcostestudiante_foreign` (`IdCostEstudiante`),
  CONSTRAINT `cobros_estudiante_idcostestudiante_foreign` FOREIGN KEY (`IdCostEstudiante`) REFERENCES `costos_estudiante` (`IdCostEstudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobros_estudiante`
--

LOCK TABLES `cobros_estudiante` WRITE;
/*!40000 ALTER TABLE `cobros_estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobros_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costos`
--

DROP TABLE IF EXISTS `costos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costos` (
  `IdCostos` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DesCostos` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdProgAcademico` bigint unsigned NOT NULL,
  `IdProgAcaPeriodo` bigint unsigned NOT NULL,
  `Valor` decimal(10,2) NOT NULL,
  `CodContable` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumMaxCuotas` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CargoFijo` int unsigned NOT NULL DEFAULT '1',
  `CredMinimo` int unsigned NOT NULL,
  `CredMaximo` int unsigned NOT NULL,
  `PorcCuota1` int unsigned NOT NULL,
  `CostoOcasional` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdCostos`),
  KEY `costos_idprogacademico_foreign` (`IdProgAcademico`),
  KEY `costos_idprogacaperiodo_foreign` (`IdProgAcaPeriodo`),
  CONSTRAINT `costos_idprogacademico_foreign` FOREIGN KEY (`IdProgAcademico`) REFERENCES `progacademico` (`IdProgAcademico`),
  CONSTRAINT `costos_idprogacaperiodo_foreign` FOREIGN KEY (`IdProgAcaPeriodo`) REFERENCES `progaca_periodo` (`IdProgAcaPeriodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costos`
--

LOCK TABLES `costos` WRITE;
/*!40000 ALTER TABLE `costos` DISABLE KEYS */;
/*!40000 ALTER TABLE `costos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `costos_estudiante`
--

DROP TABLE IF EXISTS `costos_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costos_estudiante` (
  `IdCostEstudiante` bigint unsigned NOT NULL AUTO_INCREMENT,
  `IdEstudProAca` bigint unsigned NOT NULL,
  `IdCostos` bigint unsigned NOT NULL,
  `NumCuotas` int unsigned NOT NULL,
  `FecLiquidacion` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdCostEstudiante`),
  KEY `costos_estudiante_idestudproaca_foreign` (`IdEstudProAca`),
  KEY `costos_estudiante_idcostos_foreign` (`IdCostos`),
  CONSTRAINT `costos_estudiante_idcostos_foreign` FOREIGN KEY (`IdCostos`) REFERENCES `costos` (`IdCostos`),
  CONSTRAINT `costos_estudiante_idestudproaca_foreign` FOREIGN KEY (`IdEstudProAca`) REFERENCES `estud_progacademico` (`IdEstudProAca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `costos_estudiante`
--

LOCK TABLES `costos_estudiante` WRITE;
/*!40000 ALTER TABLE `costos_estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `costos_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `IdDepartamento` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodDepartamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesDepartamento` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdDepartamento`),
  UNIQUE KEY `departamentos_coddepartamento_unique` (`CodDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_tip_proceso`
--

DROP TABLE IF EXISTS `doc_tip_proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doc_tip_proceso` (
  `IdDoc_TipProceso` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DesTipProceso` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdDoc_TipProceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_tip_proceso`
--

LOCK TABLES `doc_tip_proceso` WRITE;
/*!40000 ALTER TABLE `doc_tip_proceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_tip_proceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estud_estados`
--

DROP TABLE IF EXISTS `estud_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estud_estados` (
  `IdEstEstudiante` bigint unsigned NOT NULL,
  `DesEstEstudiante` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActEstEstudiante` int unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdEstEstudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estud_estados`
--

LOCK TABLES `estud_estados` WRITE;
/*!40000 ALTER TABLE `estud_estados` DISABLE KEYS */;
INSERT INTO `estud_estados` VALUES (1,'Activo',1,NULL,NULL),(2,'Aspirante',1,NULL,NULL),(3,'Inactivo',0,NULL,NULL),(4,'Graduado',0,NULL,NULL);
/*!40000 ALTER TABLE `estud_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estud_progacademico`
--

DROP TABLE IF EXISTS `estud_progacademico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estud_progacademico` (
  `IdEstudProAca` bigint unsigned NOT NULL AUTO_INCREMENT,
  `IdPersona` bigint unsigned NOT NULL,
  `IdProgAcademico` bigint unsigned NOT NULL,
  `IdPensum` bigint unsigned NOT NULL,
  `IdProgAca_Periodo` bigint unsigned NOT NULL,
  `FecIngreso` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdEstudProAca`),
  UNIQUE KEY `estud_progacademico_idpersona_idprogacademico_unique` (`IdPersona`,`IdProgAcademico`),
  KEY `estud_progacademico_idprogacademico_foreign` (`IdProgAcademico`),
  KEY `estud_progacademico_idpensum_foreign` (`IdPensum`),
  KEY `estud_progacademico_idprogaca_periodo_foreign` (`IdProgAca_Periodo`),
  CONSTRAINT `estud_progacademico_idpensum_foreign` FOREIGN KEY (`IdPensum`) REFERENCES `progacademico` (`IdProgAcademico`),
  CONSTRAINT `estud_progacademico_idpersona_foreign` FOREIGN KEY (`IdPersona`) REFERENCES `personas` (`IdPersona`),
  CONSTRAINT `estud_progacademico_idprogaca_periodo_foreign` FOREIGN KEY (`IdProgAca_Periodo`) REFERENCES `progaca_periodo` (`IdProgAcaPeriodo`),
  CONSTRAINT `estud_progacademico_idprogacademico_foreign` FOREIGN KEY (`IdProgAcademico`) REFERENCES `progacademico` (`IdProgAcademico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estud_progacademico`
--

LOCK TABLES `estud_progacademico` WRITE;
/*!40000 ALTER TABLE `estud_progacademico` DISABLE KEYS */;
/*!40000 ALTER TABLE `estud_progacademico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `IdPersona` bigint unsigned NOT NULL,
  `CodEstudiante` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EmailEstudiante` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdEstEstudiante` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdPersona`),
  KEY `estudiante_idestestudiante_foreign` (`IdEstEstudiante`),
  CONSTRAINT `estudiante_idestestudiante_foreign` FOREIGN KEY (`IdEstEstudiante`) REFERENCES `estud_estados` (`IdEstEstudiante`),
  CONSTRAINT `estudiante_idpersona_foreign` FOREIGN KEY (`IdPersona`) REFERENCES `personas` (`IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inter_estseguimiento`
--

DROP TABLE IF EXISTS `inter_estseguimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inter_estseguimiento` (
  `IdIntEstSeguimiento` bigint unsigned NOT NULL,
  `DesIntEstSeguimiento` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActivaMatricula` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdIntEstSeguimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inter_estseguimiento`
--

LOCK TABLES `inter_estseguimiento` WRITE;
/*!40000 ALTER TABLE `inter_estseguimiento` DISABLE KEYS */;
INSERT INTO `inter_estseguimiento` VALUES (1,'Registro inicial',0,NULL,NULL),(2,'En Seguimiento',0,NULL,NULL),(3,'Desiste del proceso',0,NULL,NULL),(4,'No responde',0,NULL,NULL),(5,'Prematricula ',1,NULL,NULL);
/*!40000 ALTER TABLE `inter_estseguimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inter_seguimientos`
--

DROP TABLE IF EXISTS `inter_seguimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inter_seguimientos` (
  `IdIntSeguimiento` bigint unsigned NOT NULL AUTO_INCREMENT,
  `IdInteresado` bigint unsigned NOT NULL,
  `IdIntTipSeguimiento` bigint unsigned NOT NULL,
  `ObsIntSeguimiento` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdIntSeguimiento`),
  KEY `inter_seguimientos_idinteresado_foreign` (`IdInteresado`),
  KEY `inter_seguimientos_idinttipseguimiento_foreign` (`IdIntTipSeguimiento`),
  CONSTRAINT `inter_seguimientos_idinteresado_foreign` FOREIGN KEY (`IdInteresado`) REFERENCES `interesado` (`IdInteresado`),
  CONSTRAINT `inter_seguimientos_idinttipseguimiento_foreign` FOREIGN KEY (`IdIntTipSeguimiento`) REFERENCES `inter_tipseguimiento` (`IdIntTipSeguimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inter_seguimientos`
--

LOCK TABLES `inter_seguimientos` WRITE;
/*!40000 ALTER TABLE `inter_seguimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `inter_seguimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inter_tipseguimiento`
--

DROP TABLE IF EXISTS `inter_tipseguimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inter_tipseguimiento` (
  `IdIntTipSeguimiento` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DesTipSeguimiento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `InstTipSeguimiento` varchar(4000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdIntTipSeguimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inter_tipseguimiento`
--

LOCK TABLES `inter_tipseguimiento` WRITE;
/*!40000 ALTER TABLE `inter_tipseguimiento` DISABLE KEYS */;
INSERT INTO `inter_tipseguimiento` VALUES (1,'Telefónico','Prueba Instructivo Telefónico',NULL,NULL),(2,'Email','Prueba Instructivo Email',NULL,NULL);
/*!40000 ALTER TABLE `inter_tipseguimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interesado`
--

DROP TABLE IF EXISTS `interesado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interesado` (
  `IdInteresado` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Nombres_Int` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Apellidos_Int` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email_Int` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdProgAcademico` bigint unsigned NOT NULL,
  `Celular_Int` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdIntEstSeguimiento` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdInteresado`),
  KEY `interesado_idprogacademico_foreign` (`IdProgAcademico`),
  KEY `interesado_idintestseguimiento_foreign` (`IdIntEstSeguimiento`),
  CONSTRAINT `interesado_idintestseguimiento_foreign` FOREIGN KEY (`IdIntEstSeguimiento`) REFERENCES `inter_estseguimiento` (`IdIntEstSeguimiento`),
  CONSTRAINT `interesado_idprogacademico_foreign` FOREIGN KEY (`IdProgAcademico`) REFERENCES `progacademico` (`IdProgAcademico`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interesado`
--

LOCK TABLES `interesado` WRITE;
/*!40000 ALTER TABLE `interesado` DISABLE KEYS */;
INSERT INTO `interesado` VALUES (1,'Juan Pablo','Betancourt Vargas','juanbetancourt0013@gmail.com',3,'3222663866',5,NULL,NULL);
/*!40000 ALTER TABLE `interesado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1035 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (994,'2024_10_21_000000_create_roles_table',1),(995,'2024_10_21_000001_create_users_table',1),(996,'2024_10_21_000002_create_cache_table',1),(997,'2024_10_21_000003_create_jobs_table',1),(998,'2024_10_21_224251_create_nivprograma_table',1),(999,'2024_10_21_224272_create_tip_periodopensum_table',1),(1000,'2024_10_21_224301_create_progacademico_table',1),(1001,'2024_10_22_152247_create_tipcapexcepcional_table',1),(1002,'2024_10_22_163156_create_tipcomnegra_table',1),(1003,'2024_10_22_163838_create_tipcondiscapacidad_table',1),(1004,'2024_10_22_165310_create_tipdocidentidad_table',1),(1005,'2024_10_22_171123_create_tipestcivil_table',1),(1006,'2024_10_22_200757_create_tipestrato_table',1),(1007,'2024_10_22_201149_create_tipgenbiologico_table',1),(1008,'2024_10_22_201335_create_tipgrupetnico_table',1),(1009,'2024_10_22_201642_create_tippaises_table',1),(1010,'2024_10_22_201851_create_tippueindigena_table',1),(1011,'2024_10_22_201956_create_tipveteranos_table',1),(1012,'2024_10_22_202029_create_tipzonaresidencia_table',1),(1013,'2024_10_23_125623_create_tipdiscapacidad_table',1),(1014,'2024_10_23_133112_create_tipdepartamentos_table',1),(1015,'2024_10_23_133248_create_tipmunicipios_table',1),(1016,'2024_10_23_135142_create_personas_table',1),(1017,'2024_10_30_164406_create_inter_estseguimiento_table',1),(1018,'2024_10_30_164534_create_inter_tipseguimiento_table',1),(1019,'2024_10_30_164534_create_interesado_table',1),(1020,'2024_10_30_164536_create_inter_seguimientos_table',1),(1021,'2024_11_14_153831_create_variables_table',1),(1022,'2024_11_15_105056_create_estud_estados_table',1),(1023,'2024_11_15_110543_create_estudiante_table',1),(1024,'2024_11_15_110558_create_progaca_periodo_table',1),(1025,'2024_11_18_111514_create_pensum_table',1),(1026,'2024_11_18_112449_create_departamentos_table',1),(1027,'2024_11_18_112619_create_asignaturas_table',1),(1028,'2024_11_18_112813_create_pen_asignatura_table',1),(1029,'2024_11_18_113049_create_doc_tip_proceso_table',1),(1030,'2024_12_10_101740_create_estud_progacademico_table',1),(1031,'2024_12_10_163334_create_pen_asignatura_requisitos_table',1),(1032,'2024_12_18_082754_create_costos_table',1),(1033,'2024_12_18_082825_create_costos_estudiante_table',1),(1034,'2024_12_18_082838_create_cobros_estudiante_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivprograma`
--

DROP TABLE IF EXISTS `nivprograma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivprograma` (
  `IdNivPrograma` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DesPrograma` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdNivPrograma`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivprograma`
--

LOCK TABLES `nivprograma` WRITE;
/*!40000 ALTER TABLE `nivprograma` DISABLE KEYS */;
INSERT INTO `nivprograma` VALUES (1,'Profesional',NULL,NULL);
/*!40000 ALTER TABLE `nivprograma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pen_asignatura`
--

DROP TABLE IF EXISTS `pen_asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pen_asignatura` (
  `IdPen_Asignatura` bigint unsigned NOT NULL AUTO_INCREMENT,
  `numPeriodo` int unsigned NOT NULL DEFAULT '1',
  `Electiva` int unsigned NOT NULL DEFAULT '0',
  `numCreditos` int unsigned NOT NULL DEFAULT '0',
  `IdPensum` bigint unsigned NOT NULL,
  `IdAsignatura` bigint unsigned NOT NULL,
  `NumCreditosPreRequisito` int unsigned NOT NULL DEFAULT '0',
  `NumHorClase` int unsigned NOT NULL,
  `AfectaPromedio` int unsigned NOT NULL DEFAULT '1',
  `TipValoracion` int unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdPen_Asignatura`),
  UNIQUE KEY `pen_asignatura_idpensum_idasignatura_unique` (`IdPensum`,`IdAsignatura`),
  KEY `pen_asignatura_idasignatura_foreign` (`IdAsignatura`),
  CONSTRAINT `pen_asignatura_idasignatura_foreign` FOREIGN KEY (`IdAsignatura`) REFERENCES `asignaturas` (`IdAsignatura`),
  CONSTRAINT `pen_asignatura_idpensum_foreign` FOREIGN KEY (`IdPensum`) REFERENCES `pensum` (`IdPensum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pen_asignatura`
--

LOCK TABLES `pen_asignatura` WRITE;
/*!40000 ALTER TABLE `pen_asignatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `pen_asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pen_asignatura_requisitos`
--

DROP TABLE IF EXISTS `pen_asignatura_requisitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pen_asignatura_requisitos` (
  `IdPenRequisito` bigint unsigned NOT NULL AUTO_INCREMENT,
  `IdPen_Asignatura` bigint unsigned NOT NULL,
  `IdRequisito` bigint unsigned NOT NULL,
  `Prerequisito` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdPenRequisito`),
  UNIQUE KEY `pen_asignatura_requisitos_idpen_asignatura_idrequisito_unique` (`IdPen_Asignatura`,`IdRequisito`),
  KEY `pen_asignatura_requisitos_idrequisito_foreign` (`IdRequisito`),
  CONSTRAINT `pen_asignatura_requisitos_idpen_asignatura_foreign` FOREIGN KEY (`IdPen_Asignatura`) REFERENCES `pen_asignatura` (`IdPen_Asignatura`),
  CONSTRAINT `pen_asignatura_requisitos_idrequisito_foreign` FOREIGN KEY (`IdRequisito`) REFERENCES `pen_asignatura` (`IdPen_Asignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pen_asignatura_requisitos`
--

LOCK TABLES `pen_asignatura_requisitos` WRITE;
/*!40000 ALTER TABLE `pen_asignatura_requisitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pen_asignatura_requisitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pensum`
--

DROP TABLE IF EXISTS `pensum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pensum` (
  `IdPensum` bigint unsigned NOT NULL AUTO_INCREMENT,
  `IdProgAcademico` bigint unsigned NOT NULL,
  `perAcademico_Inicial` bigint unsigned NOT NULL,
  `perAcademico_Final` bigint unsigned DEFAULT NULL,
  `desPensum` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numCredAprob` int unsigned NOT NULL,
  `promMinimo` decimal(4,2) NOT NULL,
  `numPeriodos` int unsigned NOT NULL,
  `CodPensum` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdTipPeriodos` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdPensum`),
  UNIQUE KEY `pensum_idprogacademico_codpensum_unique` (`IdProgAcademico`,`CodPensum`),
  KEY `pensum_peracademico_inicial_foreign` (`perAcademico_Inicial`),
  KEY `pensum_peracademico_final_foreign` (`perAcademico_Final`),
  KEY `pensum_idtipperiodos_foreign` (`IdTipPeriodos`),
  CONSTRAINT `pensum_idprogacademico_foreign` FOREIGN KEY (`IdProgAcademico`) REFERENCES `progacademico` (`IdProgAcademico`),
  CONSTRAINT `pensum_idtipperiodos_foreign` FOREIGN KEY (`IdTipPeriodos`) REFERENCES `tip_periodopensum` (`IdTipPeriodos`),
  CONSTRAINT `pensum_peracademico_final_foreign` FOREIGN KEY (`perAcademico_Final`) REFERENCES `progaca_periodo` (`IdProgAcaPeriodo`),
  CONSTRAINT `pensum_peracademico_inicial_foreign` FOREIGN KEY (`perAcademico_Inicial`) REFERENCES `progaca_periodo` (`IdProgAcaPeriodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pensum`
--

LOCK TABLES `pensum` WRITE;
/*!40000 ALTER TABLE `pensum` DISABLE KEYS */;
/*!40000 ALTER TABLE `pensum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `IdPersona` bigint unsigned NOT NULL AUTO_INCREMENT,
  `NumDocIdentidad` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumDocIdentidad_Num` int unsigned DEFAULT NULL,
  `IdTipDocIdentidad` bigint unsigned NOT NULL,
  `PriApellido` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SegApellido` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PriNombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SegNombre` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DirResidencia` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TelResidencia` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MailPersonal` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FecNacimiento` date DEFAULT NULL,
  `TelCelular` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdPaisNacimiento` bigint unsigned DEFAULT NULL,
  `IdTipMunNacimiento` bigint unsigned DEFAULT NULL,
  `OtroMunNacimiento` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IdTipDeptoNacimiento` bigint unsigned DEFAULT NULL,
  `OtroDeptoNacimiento` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IdPaisResidencia` bigint unsigned DEFAULT NULL,
  `IdTipMunResidencia` bigint unsigned DEFAULT NULL,
  `OtroMunResidencia` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IdTipDeptoResidencia` bigint unsigned DEFAULT NULL,
  `OtroDeptoResidencia` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DocExpedidoEn` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nacionalidad` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IdTipCapExcepcional` bigint unsigned DEFAULT NULL,
  `IdTipComNegra` bigint unsigned DEFAULT NULL,
  `IdTipConDiscapacidad` bigint unsigned DEFAULT NULL,
  `IdTipDiscapacidad` bigint unsigned DEFAULT NULL,
  `IdTipEstCivil` bigint unsigned DEFAULT NULL,
  `IdTipEstrato` bigint unsigned DEFAULT NULL,
  `IdTipGenBiologico` bigint unsigned DEFAULT NULL,
  `IdTipGrupEtnico` bigint unsigned DEFAULT NULL,
  `IdTipPueIndigena` bigint unsigned DEFAULT NULL,
  `IdTipVeteranos` bigint unsigned DEFAULT NULL,
  `IdTipZonaResidencia` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdPersona`),
  UNIQUE KEY `personas_numdocidentidad_unique` (`NumDocIdentidad`),
  UNIQUE KEY `personas_numdocidentidad_num_unique` (`NumDocIdentidad_Num`),
  KEY `personas_idtipdocidentidad_foreign` (`IdTipDocIdentidad`),
  KEY `personas_idpaisnacimiento_foreign` (`IdPaisNacimiento`),
  KEY `personas_idtipmunnacimiento_foreign` (`IdTipMunNacimiento`),
  KEY `personas_idtipdeptonacimiento_foreign` (`IdTipDeptoNacimiento`),
  KEY `personas_idpaisresidencia_foreign` (`IdPaisResidencia`),
  KEY `personas_idtipmunresidencia_foreign` (`IdTipMunResidencia`),
  KEY `personas_idtipdeptoresidencia_foreign` (`IdTipDeptoResidencia`),
  KEY `personas_idtipcapexcepcional_foreign` (`IdTipCapExcepcional`),
  KEY `personas_idtipcomnegra_foreign` (`IdTipComNegra`),
  KEY `personas_idtipcondiscapacidad_foreign` (`IdTipConDiscapacidad`),
  KEY `personas_idtipdiscapacidad_foreign` (`IdTipDiscapacidad`),
  KEY `personas_idtipestcivil_foreign` (`IdTipEstCivil`),
  KEY `personas_idtipestrato_foreign` (`IdTipEstrato`),
  KEY `personas_idtipgenbiologico_foreign` (`IdTipGenBiologico`),
  KEY `personas_idtipgrupetnico_foreign` (`IdTipGrupEtnico`),
  KEY `personas_idtippueindigena_foreign` (`IdTipPueIndigena`),
  KEY `personas_idtipveteranos_foreign` (`IdTipVeteranos`),
  KEY `personas_idtipzonaresidencia_foreign` (`IdTipZonaResidencia`),
  CONSTRAINT `personas_idpaisnacimiento_foreign` FOREIGN KEY (`IdPaisNacimiento`) REFERENCES `tippaises` (`IdTipPais`),
  CONSTRAINT `personas_idpaisresidencia_foreign` FOREIGN KEY (`IdPaisResidencia`) REFERENCES `tippaises` (`IdTipPais`),
  CONSTRAINT `personas_idtipcapexcepcional_foreign` FOREIGN KEY (`IdTipCapExcepcional`) REFERENCES `tipcapexcepcional` (`IdTipCapExcepcional`),
  CONSTRAINT `personas_idtipcomnegra_foreign` FOREIGN KEY (`IdTipComNegra`) REFERENCES `tipcomnegra` (`IdTipComNegra`),
  CONSTRAINT `personas_idtipcondiscapacidad_foreign` FOREIGN KEY (`IdTipConDiscapacidad`) REFERENCES `tipcondiscapacidad` (`IdTipConDiscapacidad`),
  CONSTRAINT `personas_idtipdeptonacimiento_foreign` FOREIGN KEY (`IdTipDeptoNacimiento`) REFERENCES `tipdepartamentos` (`IdTipDepartamento`),
  CONSTRAINT `personas_idtipdeptoresidencia_foreign` FOREIGN KEY (`IdTipDeptoResidencia`) REFERENCES `tipdepartamentos` (`IdTipDepartamento`),
  CONSTRAINT `personas_idtipdiscapacidad_foreign` FOREIGN KEY (`IdTipDiscapacidad`) REFERENCES `tipdiscapacidad` (`IdTipDiscapacidad`),
  CONSTRAINT `personas_idtipdocidentidad_foreign` FOREIGN KEY (`IdTipDocIdentidad`) REFERENCES `tipdocidentidad` (`IdTipDocIdentidad`),
  CONSTRAINT `personas_idtipestcivil_foreign` FOREIGN KEY (`IdTipEstCivil`) REFERENCES `tipestcivil` (`IdTipEstCivil`),
  CONSTRAINT `personas_idtipestrato_foreign` FOREIGN KEY (`IdTipEstrato`) REFERENCES `tipestrato` (`IdTipEstrato`),
  CONSTRAINT `personas_idtipgenbiologico_foreign` FOREIGN KEY (`IdTipGenBiologico`) REFERENCES `tipgenbiologico` (`IdTipGenBiologico`),
  CONSTRAINT `personas_idtipgrupetnico_foreign` FOREIGN KEY (`IdTipGrupEtnico`) REFERENCES `tipgrupetnico` (`IdTipGrupEtnico`),
  CONSTRAINT `personas_idtipmunnacimiento_foreign` FOREIGN KEY (`IdTipMunNacimiento`) REFERENCES `tipmunicipios` (`IdTipMunicipio`),
  CONSTRAINT `personas_idtipmunresidencia_foreign` FOREIGN KEY (`IdTipMunResidencia`) REFERENCES `tipmunicipios` (`IdTipMunicipio`),
  CONSTRAINT `personas_idtippueindigena_foreign` FOREIGN KEY (`IdTipPueIndigena`) REFERENCES `tippueindigena` (`IdTipPueIndigena`),
  CONSTRAINT `personas_idtipveteranos_foreign` FOREIGN KEY (`IdTipVeteranos`) REFERENCES `tipveteranos` (`IdTipVeteranos`),
  CONSTRAINT `personas_idtipzonaresidencia_foreign` FOREIGN KEY (`IdTipZonaResidencia`) REFERENCES `tipzonaresidencia` (`IdTipZonaResidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progaca_periodo`
--

DROP TABLE IF EXISTS `progaca_periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progaca_periodo` (
  `IdProgAcaPeriodo` bigint unsigned NOT NULL AUTO_INCREMENT,
  `IdProgAcademico` bigint unsigned NOT NULL,
  `Peracademico` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ValMatNuevos` decimal(10,2) NOT NULL,
  `FecIniInscripciones` date NOT NULL,
  `FecFinInscripciones` date NOT NULL,
  `FecIniMatriculas` date NOT NULL,
  `FecFinMatriculas` date NOT NULL,
  `FecIniClases` date NOT NULL,
  `FecFinClases` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdProgAcaPeriodo`),
  UNIQUE KEY `progaca_periodo_idprogacademico_peracademico_unique` (`IdProgAcademico`,`Peracademico`),
  CONSTRAINT `progaca_periodo_idprogacademico_foreign` FOREIGN KEY (`IdProgAcademico`) REFERENCES `progacademico` (`IdProgAcademico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progaca_periodo`
--

LOCK TABLES `progaca_periodo` WRITE;
/*!40000 ALTER TABLE `progaca_periodo` DISABLE KEYS */;
/*!40000 ALTER TABLE `progaca_periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progacademico`
--

DROP TABLE IF EXISTS `progacademico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progacademico` (
  `IdProgAcademico` bigint unsigned NOT NULL AUTO_INCREMENT,
  `NomProgAcademico` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdNivPrograma` bigint unsigned NOT NULL,
  `ResMen` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FecResMen` date NOT NULL,
  `Snies` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CodProgAcademico` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdTipPeriodos` bigint unsigned NOT NULL,
  `NumPeriodos` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdProgAcademico`),
  UNIQUE KEY `progacademico_codprogacademico_unique` (`CodProgAcademico`),
  KEY `progacademico_idnivprograma_foreign` (`IdNivPrograma`),
  KEY `progacademico_idtipperiodos_foreign` (`IdTipPeriodos`),
  CONSTRAINT `progacademico_idnivprograma_foreign` FOREIGN KEY (`IdNivPrograma`) REFERENCES `nivprograma` (`IdNivPrograma`),
  CONSTRAINT `progacademico_idtipperiodos_foreign` FOREIGN KEY (`IdTipPeriodos`) REFERENCES `tip_periodopensum` (`IdTipPeriodos`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progacademico`
--

LOCK TABLES `progacademico` WRITE;
/*!40000 ALTER TABLE `progacademico` DISABLE KEYS */;
INSERT INTO `progacademico` VALUES (1,'Administración de empresas',1,'16408','2013-11-18','14320','101',1,9,NULL,NULL),(2,'Biología',1,'2662','2020-02-21','1063','102',1,10,NULL,NULL),(3,'Cultura física',1,'7912','2020-05-20','1054','103',1,10,NULL,NULL),(4,'Derecho - Bogotá',1,'9114','2014-06-11','1056','104',1,10,NULL,NULL);
/*!40000 ALTER TABLE `progacademico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idRol` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','Administrador del sistema',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tip_periodopensum`
--

DROP TABLE IF EXISTS `tip_periodopensum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tip_periodopensum` (
  `IdTipPeriodos` bigint unsigned NOT NULL AUTO_INCREMENT,
  `DesTipPeriodos` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumMes` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipPeriodos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip_periodopensum`
--

LOCK TABLES `tip_periodopensum` WRITE;
/*!40000 ALTER TABLE `tip_periodopensum` DISABLE KEYS */;
INSERT INTO `tip_periodopensum` VALUES (1,'Semestre',6,NULL,NULL),(2,'Cuatrimestre',4,NULL,NULL),(3,'Trimestre',3,NULL,NULL);
/*!40000 ALTER TABLE `tip_periodopensum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipcapexcepcional`
--

DROP TABLE IF EXISTS `tipcapexcepcional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipcapexcepcional` (
  `IdTipCapExcepcional` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodMenCExpc` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesCapExcepcional` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipCapExcepcional`),
  UNIQUE KEY `tipcapexcepcional_codmencexpc_unique` (`CodMenCExpc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipcapexcepcional`
--

LOCK TABLES `tipcapexcepcional` WRITE;
/*!40000 ALTER TABLE `tipcapexcepcional` DISABLE KEYS */;
INSERT INTO `tipcapexcepcional` VALUES (1,'0','No aplica',NULL,NULL);
/*!40000 ALTER TABLE `tipcapexcepcional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipcomnegra`
--

DROP TABLE IF EXISTS `tipcomnegra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipcomnegra` (
  `IdTipComNegra` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodMenCN` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesComNegra` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipComNegra`),
  UNIQUE KEY `tipcomnegra_codmencn_unique` (`CodMenCN`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipcomnegra`
--

LOCK TABLES `tipcomnegra` WRITE;
/*!40000 ALTER TABLE `tipcomnegra` DISABLE KEYS */;
INSERT INTO `tipcomnegra` VALUES (1,'0','No aplica',NULL,NULL);
/*!40000 ALTER TABLE `tipcomnegra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipcondiscapacidad`
--

DROP TABLE IF EXISTS `tipcondiscapacidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipcondiscapacidad` (
  `IdTipConDiscapacidad` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodMenCDiscap` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesConDiscapacidad` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipConDiscapacidad`),
  UNIQUE KEY `tipcondiscapacidad_codmencdiscap_unique` (`CodMenCDiscap`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipcondiscapacidad`
--

LOCK TABLES `tipcondiscapacidad` WRITE;
/*!40000 ALTER TABLE `tipcondiscapacidad` DISABLE KEYS */;
INSERT INTO `tipcondiscapacidad` VALUES (1,'0','No informa',NULL,NULL);
/*!40000 ALTER TABLE `tipcondiscapacidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipdepartamentos`
--

DROP TABLE IF EXISTS `tipdepartamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipdepartamentos` (
  `IdTipDepartamento` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodDepartamento` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesDepartamento` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdTipPais` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipDepartamento`),
  UNIQUE KEY `tipdepartamentos_coddepartamento_unique` (`CodDepartamento`),
  KEY `tipdepartamentos_idtippais_foreign` (`IdTipPais`),
  CONSTRAINT `tipdepartamentos_idtippais_foreign` FOREIGN KEY (`IdTipPais`) REFERENCES `tippaises` (`IdTipPais`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipdepartamentos`
--

LOCK TABLES `tipdepartamentos` WRITE;
/*!40000 ALTER TABLE `tipdepartamentos` DISABLE KEYS */;
INSERT INTO `tipdepartamentos` VALUES (1,'5','Antioquia',1,NULL,NULL),(2,'11','Bogotá D.C.',1,NULL,NULL);
/*!40000 ALTER TABLE `tipdepartamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipdiscapacidad`
--

DROP TABLE IF EXISTS `tipdiscapacidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipdiscapacidad` (
  `IdTipDiscapacidad` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodMenDiscap` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesDiscapacidad` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipDiscapacidad`),
  UNIQUE KEY `tipdiscapacidad_codmendiscap_unique` (`CodMenDiscap`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipdiscapacidad`
--

LOCK TABLES `tipdiscapacidad` WRITE;
/*!40000 ALTER TABLE `tipdiscapacidad` DISABLE KEYS */;
INSERT INTO `tipdiscapacidad` VALUES (1,'0','No aplica',NULL,NULL);
/*!40000 ALTER TABLE `tipdiscapacidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipdocidentidad`
--

DROP TABLE IF EXISTS `tipdocidentidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipdocidentidad` (
  `IdTipDocIdentidad` bigint unsigned NOT NULL AUTO_INCREMENT,
  `AbreDocIdentidad` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesDocidentidad` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DocDian` int unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipDocIdentidad`),
  UNIQUE KEY `tipdocidentidad_abredocidentidad_unique` (`AbreDocIdentidad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipdocidentidad`
--

LOCK TABLES `tipdocidentidad` WRITE;
/*!40000 ALTER TABLE `tipdocidentidad` DISABLE KEYS */;
INSERT INTO `tipdocidentidad` VALUES (1,'CC','Cédula de ciudadanía',0,NULL,NULL);
/*!40000 ALTER TABLE `tipdocidentidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipestcivil`
--

DROP TABLE IF EXISTS `tipestcivil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipestcivil` (
  `IdTipEstCivil` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodMenEstCivil` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesEstCivil` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipEstCivil`),
  UNIQUE KEY `tipestcivil_codmenestcivil_unique` (`CodMenEstCivil`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipestcivil`
--

LOCK TABLES `tipestcivil` WRITE;
/*!40000 ALTER TABLE `tipestcivil` DISABLE KEYS */;
INSERT INTO `tipestcivil` VALUES (1,'1','Soltero(a)',NULL,NULL);
/*!40000 ALTER TABLE `tipestcivil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipestrato`
--

DROP TABLE IF EXISTS `tipestrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipestrato` (
  `IdTipEstrato` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodMenEstrato` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesEstrato` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipEstrato`),
  UNIQUE KEY `tipestrato_codmenestrato_unique` (`CodMenEstrato`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipestrato`
--

LOCK TABLES `tipestrato` WRITE;
/*!40000 ALTER TABLE `tipestrato` DISABLE KEYS */;
INSERT INTO `tipestrato` VALUES (1,'0','No informa',NULL,NULL);
/*!40000 ALTER TABLE `tipestrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipgenbiologico`
--

DROP TABLE IF EXISTS `tipgenbiologico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipgenbiologico` (
  `IdTipGenBiologico` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodMenGBio` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesGenBiologico` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipGenBiologico`),
  UNIQUE KEY `tipgenbiologico_codmengbio_unique` (`CodMenGBio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipgenbiologico`
--

LOCK TABLES `tipgenbiologico` WRITE;
/*!40000 ALTER TABLE `tipgenbiologico` DISABLE KEYS */;
INSERT INTO `tipgenbiologico` VALUES (1,'1','Hombre-Masculino',NULL,NULL);
/*!40000 ALTER TABLE `tipgenbiologico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipgrupetnico`
--

DROP TABLE IF EXISTS `tipgrupetnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipgrupetnico` (
  `IdTipGrupEtnico` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodMenGEtnico` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesGrupEtnico` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipGrupEtnico`),
  UNIQUE KEY `tipgrupetnico_codmengetnico_unique` (`CodMenGEtnico`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipgrupetnico`
--

LOCK TABLES `tipgrupetnico` WRITE;
/*!40000 ALTER TABLE `tipgrupetnico` DISABLE KEYS */;
INSERT INTO `tipgrupetnico` VALUES (1,'0','No informa',NULL,NULL);
/*!40000 ALTER TABLE `tipgrupetnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipmunicipios`
--

DROP TABLE IF EXISTS `tipmunicipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipmunicipios` (
  `IdTipMunicipio` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodMunicipio` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesMunicipio` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdTipPais` bigint unsigned NOT NULL,
  `IdTipDepartamento` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipMunicipio`),
  UNIQUE KEY `tipmunicipios_codmunicipio_unique` (`CodMunicipio`),
  KEY `tipmunicipios_idtippais_foreign` (`IdTipPais`),
  KEY `tipmunicipios_idtipdepartamento_foreign` (`IdTipDepartamento`),
  CONSTRAINT `tipmunicipios_idtipdepartamento_foreign` FOREIGN KEY (`IdTipDepartamento`) REFERENCES `tipdepartamentos` (`IdTipDepartamento`),
  CONSTRAINT `tipmunicipios_idtippais_foreign` FOREIGN KEY (`IdTipPais`) REFERENCES `tippaises` (`IdTipPais`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipmunicipios`
--

LOCK TABLES `tipmunicipios` WRITE;
/*!40000 ALTER TABLE `tipmunicipios` DISABLE KEYS */;
INSERT INTO `tipmunicipios` VALUES (1,'5001','Medellín',1,1,NULL,NULL),(2,'11001','Bogotá D.C.',1,2,NULL,NULL);
/*!40000 ALTER TABLE `tipmunicipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tippaises`
--

DROP TABLE IF EXISTS `tippaises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tippaises` (
  `IdTipPais` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodPais` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesPais` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipPais`),
  UNIQUE KEY `tippaises_codpais_unique` (`CodPais`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tippaises`
--

LOCK TABLES `tippaises` WRITE;
/*!40000 ALTER TABLE `tippaises` DISABLE KEYS */;
INSERT INTO `tippaises` VALUES (1,'170','Colombia',NULL,NULL),(2,'032','Argentina',NULL,NULL);
/*!40000 ALTER TABLE `tippaises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tippueindigena`
--

DROP TABLE IF EXISTS `tippueindigena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tippueindigena` (
  `IdTipPueIndigena` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodMenPIndigena` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesPueIndigena` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipPueIndigena`),
  UNIQUE KEY `tippueindigena_codmenpindigena_unique` (`CodMenPIndigena`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tippueindigena`
--

LOCK TABLES `tippueindigena` WRITE;
/*!40000 ALTER TABLE `tippueindigena` DISABLE KEYS */;
INSERT INTO `tippueindigena` VALUES (1,'0','No aplica',NULL,NULL);
/*!40000 ALTER TABLE `tippueindigena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipveteranos`
--

DROP TABLE IF EXISTS `tipveteranos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipveteranos` (
  `IdTipVeteranos` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodMenVetarno` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesVeterano` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipVeteranos`),
  UNIQUE KEY `tipveteranos_codmenvetarno_unique` (`CodMenVetarno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipveteranos`
--

LOCK TABLES `tipveteranos` WRITE;
/*!40000 ALTER TABLE `tipveteranos` DISABLE KEYS */;
INSERT INTO `tipveteranos` VALUES (1,'1','Veterano',NULL,NULL);
/*!40000 ALTER TABLE `tipveteranos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipzonaresidencia`
--

DROP TABLE IF EXISTS `tipzonaresidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipzonaresidencia` (
  `IdTipZonaResidencia` bigint unsigned NOT NULL AUTO_INCREMENT,
  `CodMenZResidencial` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesZonaResidencial` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipZonaResidencia`),
  UNIQUE KEY `tipzonaresidencia_codmenzresidencial_unique` (`CodMenZResidencial`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipzonaresidencia`
--

LOCK TABLES `tipzonaresidencia` WRITE;
/*!40000 ALTER TABLE `tipzonaresidencia` DISABLE KEYS */;
INSERT INTO `tipzonaresidencia` VALUES (1,'1','Urbana',NULL,NULL);
/*!40000 ALTER TABLE `tipzonaresidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IdRol` bigint unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_idrol_foreign` (`IdRol`),
  CONSTRAINT `users_idrol_foreign` FOREIGN KEY (`IdRol`) REFERENCES `roles` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@admin.com',NULL,'$2y$12$IiJwngDrkTEZUNnehHpb8.XYyW5/HbSp23jr.x4BZCnoU70T28Tw.',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variables`
--

DROP TABLE IF EXISTS `variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variables` (
  `IdVariable` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Variable` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DesVariable` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumVariable` decimal(10,2) DEFAULT NULL,
  `TxtVariable` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IdVariable`),
  UNIQUE KEY `variables_variable_unique` (`Variable`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variables`
--

LOCK TABLES `variables` WRITE;
/*!40000 ALTER TABLE `variables` DISABLE KEYS */;
INSERT INTO `variables` VALUES (1,'paginaPrincipal','Página principal de la universidad',NULL,'https://unincca.edu.co/',NULL,NULL),(2,'paginaTrataDatos','Pagina que describe el tratamiento de datos',NULL,'https://unincca.edu.co/TDatos.html',NULL,NULL),(3,'agradecimientoInteresado','Frase de agradecimiento al interesado',NULL,'Gracias por su interés en nuestros programas académicos, un asesor de admisiones se comunicará con usted muy pronto.',NULL,NULL);
/*!40000 ALTER TABLE `variables` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-14 21:44:16
