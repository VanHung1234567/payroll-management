CREATE DATABASE  IF NOT EXISTS `misapayroll_development` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `misapayroll_development`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: misapayroll_development
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `pa_grid_config`
--

DROP TABLE IF EXISTS `pa_grid_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_grid_config` (
  `grid_config_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Khóa chính config',
  `grid_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'salary_composition, salary_composition_system, employee...',
  `field_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên field bind lên grid',
  `caption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên cột hiển thị',
  `width` int DEFAULT '150' COMMENT 'Độ rộng cột',
  `visible` tinyint(1) DEFAULT '1' COMMENT 'Ẩn/hiện cột',
  `is_fixed` tinyint(1) DEFAULT '0' COMMENT 'Ghim cột',
  `fixed_position` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'left/right',
  `allow_sorting` tinyint(1) DEFAULT '1',
  `sort_order` int DEFAULT '0' COMMENT 'Thứ tự cột',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`grid_config_id`),
  UNIQUE KEY `UQ_Grid_Field` (`grid_key`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_grid_config`
--

LOCK TABLES `pa_grid_config` WRITE;
/*!40000 ALTER TABLE `pa_grid_config` DISABLE KEYS */;
INSERT INTO `pa_grid_config` VALUES ('eba8c59c-55c6-11f1-bd41-088fc372284f','salary_composition','SalaryCompositionCode','Mã thành phần',200,1,0,NULL,1,1,'2026-05-22 22:11:31'),('eba8ce2b-55c6-11f1-bd41-088fc372284f','salary_composition','SalaryCompositionName','Tên thành phần',200,1,0,NULL,1,2,'2026-05-22 22:11:31'),('eba8cf84-55c6-11f1-bd41-088fc372284f','salary_composition','OrganizationNames','Đơn vị áp dụng',200,1,0,NULL,1,3,'2026-05-22 22:11:31'),('eba8d044-55c6-11f1-bd41-088fc372284f','salary_composition','SalaryCompositionType','Loại thành phần',200,1,0,NULL,1,4,'2026-05-22 22:11:31'),('eba8d0d9-55c6-11f1-bd41-088fc372284f','salary_composition','Nature','Tính chất',200,1,0,NULL,1,5,'2026-05-22 22:11:31'),('eba8d15e-55c6-11f1-bd41-088fc372284f','salary_composition','TaxType','Chịu thuế',200,0,0,NULL,1,6,'2026-05-22 22:11:31'),('eba8d1ed-55c6-11f1-bd41-088fc372284f','salary_composition','IsTaxReduction','Giảm trừ khi tính thuế',200,0,0,NULL,1,7,'2026-05-22 22:11:31'),('eba8d274-55c6-11f1-bd41-088fc372284f','salary_composition','NormFormula','Định mức',200,0,0,NULL,1,8,'2026-05-22 22:11:31'),('eba8d3b0-55c6-11f1-bd41-088fc372284f','salary_composition','ValueType','Kiểu giá trị',200,1,0,NULL,1,9,'2026-05-22 22:11:31'),('eba8d4a4-55c6-11f1-bd41-088fc372284f','salary_composition','ValueFormula','Giá trị',200,1,0,NULL,1,10,'2026-05-22 22:11:31'),('eba8d564-55c6-11f1-bd41-088fc372284f','salary_composition','Description','Mô tả',200,0,0,NULL,1,11,'2026-05-22 22:11:31'),('eba8d6f8-55c6-11f1-bd41-088fc372284f','salary_composition','PayslipDisplayType','Hiển thị trên phiếu lương',200,0,0,NULL,1,12,'2026-05-22 22:11:31'),('eba8d79e-55c6-11f1-bd41-088fc372284f','salary_composition','CreatedSource','Nguồn tạo',200,1,0,NULL,1,13,'2026-05-22 22:11:31'),('eba8d82d-55c6-11f1-bd41-088fc372284f','salary_composition','Status','Trạng thái',200,1,0,NULL,1,14,'2026-05-22 22:11:31'),('fb69357c-5a4f-11f1-bd41-088fc372284f','salary_composition_system','SalaryCompositionCode','Mã thành phần',200,1,0,NULL,1,1,'2026-05-28 11:44:59'),('fb6966f6-5a4f-11f1-bd41-088fc372284f','salary_composition_system','SalaryCompositionName','Tên thành phần',200,1,0,NULL,1,2,'2026-05-28 11:44:59'),('fb6970c7-5a4f-11f1-bd41-088fc372284f','salary_composition_system','salaryCompositionType','Loại thành phần',200,1,0,NULL,1,3,'2026-05-28 11:44:59'),('fb697bba-5a4f-11f1-bd41-088fc372284f','salary_composition_system','Nature','Tính chất',200,1,0,NULL,1,4,'2026-05-28 11:44:59'),('fb6993c8-5a4f-11f1-bd41-088fc372284f','salary_composition_system','TaxType','Chịu thuế',200,0,0,NULL,1,5,'2026-05-28 11:44:59'),('fb699565-5a4f-11f1-bd41-088fc372284f','salary_composition_system','IsTaxReduction','Giảm trừ khi tính thuế',200,0,0,NULL,1,6,'2026-05-28 11:44:59'),('fb699646-5a4f-11f1-bd41-088fc372284f','salary_composition_system','NormFormula','Định mức',200,0,0,NULL,1,7,'2026-05-28 11:44:59'),('fb699821-5a4f-11f1-bd41-088fc372284f','salary_composition_system','ValueType','Kiểu giá trị',200,1,0,NULL,1,5,'2026-05-28 11:44:59'),('fb699f54-5a4f-11f1-bd41-088fc372284f','salary_composition_system','ValueFormula','Giá trị',200,1,0,NULL,1,6,'2026-05-28 11:44:59'),('fb69a104-5a4f-11f1-bd41-088fc372284f','salary_composition_system','Description','Mô tả',200,0,0,NULL,1,10,'2026-05-28 11:44:59'),('fb69ae26-5a4f-11f1-bd41-088fc372284f','salary_composition_system','PayslipDisplayType','Hiển thị trên phiếu lương',200,0,0,NULL,1,11,'2026-05-28 11:44:59');
/*!40000 ALTER TABLE `pa_grid_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_organization`
--

DROP TABLE IF EXISTS `pa_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_organization` (
  `organization_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Khóa chính đơn vị công tác',
  `organization_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Mã đơn vị',
  `organization_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên đơn vị',
  `parent_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Đơn vị cha',
  `sort_order` int DEFAULT '0' COMMENT 'Thứ tự hiển thị',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`organization_id`),
  UNIQUE KEY `UQ_OrganizationCode` (`organization_code`),
  KEY `IX_Organization_ParentID` (`parent_id`),
  CONSTRAINT `FK_Organization_Parent` FOREIGN KEY (`parent_id`) REFERENCES `pa_organization` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_organization`
--

LOCK TABLES `pa_organization` WRITE;
/*!40000 ALTER TABLE `pa_organization` DISABLE KEYS */;
INSERT INTO `pa_organization` VALUES ('550e8400-e29b-41d4-a716-446655440001','MISA_TEST_PDTHIEN_2024','Misa Test pdthien 2024',NULL,1,'2026-05-23 01:02:03'),('550e8400-e29b-41d4-a716-446655440002','CN_MIEN_BAC','Chi nhánh miền Bắc','550e8400-e29b-41d4-a716-446655440001',2,'2026-05-23 01:02:03'),('550e8400-e29b-41d4-a716-446655440003','KHOI_SAN_XUAT_BAC','Khối sản xuất','550e8400-e29b-41d4-a716-446655440002',3,'2026-05-23 01:02:03'),('550e8400-e29b-41d4-a716-446655440004','TT_KINH_DOANH_BAC','Trung tâm kinh doanh','550e8400-e29b-41d4-a716-446655440002',4,'2026-05-23 01:02:03'),('550e8400-e29b-41d4-a716-446655440005','TT_HO_TRO_KH_BAC','Trung tâm hỗ trợ khách hàng','550e8400-e29b-41d4-a716-446655440002',5,'2026-05-23 01:02:03'),('550e8400-e29b-41d4-a716-446655440006','CN_MIEN_NAM','Chi nhánh miền Nam','550e8400-e29b-41d4-a716-446655440001',6,'2026-05-23 01:02:03'),('550e8400-e29b-41d4-a716-446655440007','TT_KINH_DOANH_NAM','Trung tâm kinh doanh','550e8400-e29b-41d4-a716-446655440006',7,'2026-05-23 01:02:03');
/*!40000 ALTER TABLE `pa_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_salary_composition`
--

DROP TABLE IF EXISTS `pa_salary_composition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_salary_composition` (
  `salary_composition_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Khóa chính TPL',
  `salary_composition_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Mã thành phần',
  `salary_composition_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên thành phần',
  `salary_composition_type` int NOT NULL DEFAULT '9',
  `nature` int NOT NULL COMMENT 'Tính chất: 1-Thu nhập, 2-Khấu trừ, 3-Khác',
  `tax_type` int DEFAULT '1' COMMENT '1-Chịu thuế, 2-Miễn thuế toàn phần, 3-Miễn thuế một phần',
  `is_tax_reduction` tinyint(1) DEFAULT '0' COMMENT 'Giảm trừ khi tính thuế',
  `norm_formula` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'Định mức',
  `allow_over_norm` tinyint(1) DEFAULT '0' COMMENT 'Cho phép giá trị vượt định mức',
  `value_type` int DEFAULT '1' COMMENT '1-Tiền tệ, 2-Số, 3-Phần trăm, 4-Công thức',
  `value_formula` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'Giá trị hoặc công thức',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'Mô tả',
  `payslip_display_type` int DEFAULT '1' COMMENT '1-Có, 2-Không, 3-Chỉ hiện nếu giá trị khác 0',
  `created_source` int DEFAULT '1' COMMENT '1-Tự thêm, 2-Từ hệ thống',
  `status` int DEFAULT '1' COMMENT '1-Đang theo dõi, 0-Ngừng theo dõi',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `salary_composition_system_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`salary_composition_id`),
  UNIQUE KEY `UQ_Composition_Code_Org` (`salary_composition_code`),
  KEY `IX_Composition_Status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_salary_composition`
--

LOCK TABLES `pa_salary_composition` WRITE;
/*!40000 ALTER TABLE `pa_salary_composition` DISABLE KEYS */;
INSERT INTO `pa_salary_composition` VALUES ('00cf5339-64d1-11f1-a50e-088fc372284f','CC_NGHI_PHEP','Ngày nghỉ phép',9,3,NULL,0,'',0,1,'','Chấm công',1,2,1,'2026-06-10 20:33:44',NULL),('526f372b-5e55-11f1-bd41-088fc372284f','LUONG_CO_BAN)','Lương cơ bản 1',3,2,1,0,'',0,1,NULL,NULL,1,2,1,'2026-06-02 14:33:17',NULL),('55cebf00-6413-11f1-9c08-088fc372284f','BHTN_2','Bảo hiểm thất nghiệp',9,2,2,0,'',0,2,'','Bảo hiểm',1,2,1,'2026-06-09 21:56:03',NULL),('599d4136-598e-11f1-bd41-088fc372284f','LUONG_CB_01','Lương cơ bản miền Bắc',4,1,1,0,NULL,0,1,NULL,'Lương cơ bản CN miền Bắc',1,1,0,'2026-05-27 12:38:54',NULL),('599d7709-598e-11f1-bd41-088fc372284f','LUONG_CB_02','Lương CB2',1,2,1,1,'',1,2,'','Lương cơ bản CN miền Nam',2,1,0,'2026-05-27 12:38:54',NULL),('599d8ad7-598e-11f1-bd41-088fc372284f','LUONG_KD_BAC','Lương kinh doanh Bắc',6,2,NULL,0,'',0,1,'{\"mode\":\"auto_sum\",\"scope\":\"same_organization\",\"salaryCode\":\"PRODUCT_01\"}','Lương TTKD Bắc',1,1,1,'2026-05-27 12:38:54',NULL),('599d8c56-598e-11f1-bd41-088fc372284f','LUONG_KD_NAM','Lương kinh doanh Nam',8,1,1,0,NULL,0,1,NULL,'Lương TTKD Nam',1,1,0,'2026-05-27 12:38:54',NULL),('599d8d63-598e-11f1-bd41-088fc372284f','KPI_BAC_01','KPI miền Bắc',5,1,1,0,NULL,0,3,NULL,'KPI chi nhánh Bắc',1,1,0,'2026-05-27 12:38:54',NULL),('599d9783-598e-11f1-bd41-088fc372284f','KPI_NAM_01','KPI miền Nam',2,1,1,0,NULL,0,3,NULL,'KPI chi nhánh Nam',1,1,1,'2026-05-27 12:38:54',NULL),('599d994f-598e-11f1-bd41-088fc372284f','KPI_KD_BAC','KPI trung tâm KD Bắc',9,1,1,NULL,'',0,3,'=SUM(1111111A,2312A)','KPI kinh doanh',1,1,1,'2026-05-27 12:38:54',NULL),('599d9a31-598e-11f1-bd41-088fc372284f','KPI_KD_NAM','KPI trung tâm KD Nam',2,1,1,0,NULL,0,3,NULL,'KPI kinh doanh',1,1,0,'2026-05-27 12:38:54',NULL),('599d9b05-598e-11f1-bd41-088fc372284f','SALE_BAC_01','Doanh số miền Bắc',3,1,1,0,NULL,0,2,NULL,'Doanh số CN Bắc',1,1,1,'2026-05-27 12:38:54',NULL),('599d9bd2-598e-11f1-bd41-088fc372284f','SALE_NAM_01','Doanh số miền Nam',5,1,1,0,NULL,0,2,NULL,'Doanh số CN Nam',1,1,1,'2026-05-27 12:38:54',NULL),('599d9cbd-598e-11f1-bd41-088fc372284f','SALE_KD_BAC','Doanh số KD Bắc',9,1,1,0,NULL,0,2,NULL,'Doanh số trung tâm KD Bắc',1,1,1,'2026-05-27 12:38:54',NULL),('599da0ac-598e-11f1-bd41-088fc372284f','PIT_BAC','Thuế TNCN Bắc',4,2,NULL,0,'',0,2,'=SUM(BHNT,PRODUCT_01)','Thuế TNCN CN Bắc',1,2,1,'2026-05-27 12:38:54',NULL),('599da2e1-598e-11f1-bd41-088fc372284f','PIT_NAM','Thuế TNCN Nam',1,2,NULL,0,'',0,2,'=LUONG*0.1','Thuế TNCN CN Nam',1,2,1,'2026-05-27 12:38:54',NULL),('599da3de-598e-11f1-bd41-088fc372284f','BHXH_BAC','BHXH miền Bắc',3,2,NULL,0,'',0,4,'=LUONG*0.08','BHXH CN Bắc',1,2,1,'2026-05-27 12:38:54',NULL),('599da4b5-598e-11f1-bd41-088fc372284f','BHXH_NAM','BHXH miền Nam1',6,2,2,1,'',0,4,'=LUONG*0.08','BHXH CN Nam',1,2,1,'2026-05-27 12:38:54',NULL),('599da594-598e-11f1-bd41-088fc372284f','BHYT_BAC','BHYT miền Bắc1',4,2,NULL,0,'',0,2,'=LUONG*0.015','BHYT CN Bắc',1,2,1,'2026-05-27 12:38:54',NULL),('599da658-598e-11f1-bd41-088fc372284f','BHYT_NAM','BHYT miền Nam',4,2,2,0,NULL,0,4,'=LUONG*0.015','BHYT CN Nam',1,2,1,'2026-05-27 12:38:54',NULL),('599da715-598e-11f1-bd41-088fc372284f','CC_BAC','Chấm công Bắc',4,1,1,0,NULL,0,2,NULL,'Chấm công CN Bắc',1,1,1,'2026-05-27 12:38:54',NULL),('599db555-598e-11f1-bd41-088fc372284f','CC_NAM','Chấm công Nam',4,1,1,0,NULL,0,2,NULL,'Chấm công CN Nam',1,1,1,'2026-05-27 12:38:54',NULL),('599db6ab-598e-11f1-bd41-088fc372284f','EMP_INFO_01','Thông tin nhân viên Bắc',6,1,1,0,NULL,0,1,NULL,'Thông tin nhân viên CN Bắc',1,1,1,'2026-05-27 12:38:54',NULL),('599dbeeb-598e-11f1-bd41-088fc372284f','EMP_INFO_02','Thông tin nhân viên Nam',5,1,1,0,NULL,0,1,NULL,'Thông tin nhân viên CN Nam',1,1,1,'2026-05-27 12:38:54',NULL),('599dbffa-598e-11f1-bd41-088fc372284f','OTHER_01','Khác 01',4,1,1,0,NULL,0,1,NULL,'Khác hệ thống',1,1,1,'2026-05-27 12:38:54',NULL),('599dc164-598e-11f1-bd41-088fc372284f','OTHER_02','Khác 02',2,1,1,0,NULL,0,1,NULL,'Khác sản xuất',1,1,1,'2026-05-27 12:38:54',NULL),('602232f6-99fa-4a98-ac4f-5537fecc9b8b','LUONG_CO_BAN_4','Lương cơ bản3',5,2,1,0,NULL,0,1,NULL,NULL,1,1,1,'2026-05-23 14:30:29',NULL),('628d4667-0afc-4708-bba6-dbb791d4c249','MALUONG','MaLuong',3,1,1,NULL,'',0,2,'','',1,1,1,'2026-06-10 20:38:00',NULL),('68f24820-0fcb-49f4-8a64-d66524c0cab6','LUONG_CO_BAN_2','Lương cơ bản',5,0,1,0,NULL,0,1,NULL,NULL,1,1,1,'2026-05-23 13:42:26',NULL),('6b42e7ab-4130-45ca-a829-3eaac0b0e1e9','LUONG_CO_BAN_13','Lương cơ bản6',3,1,3,NULL,'',0,1,'','',1,1,1,'2026-05-28 16:03:03',NULL),('75434026-617d-11f1-bd41-088fc372284f','PHU_CAP_DI_LAI','Phụ cấp đi lại',8,1,2,0,'',0,2,'','Lương',1,2,1,'2026-06-06 14:58:09',NULL),('7d0fb59b-5e92-11f1-bd41-088fc372284f','CC_DI_LAM','Số ngày đi làm',5,3,NULL,0,'',0,1,'','Chấm công',1,2,1,'2026-06-02 21:51:08',NULL),('7f7a84eb-5e60-11f1-bd41-088fc372284f','BHYT','Bảo hiểm y tế',5,2,2,0,'',0,4,'=LUONG_DONG_BH*0.015',NULL,1,2,1,'2026-06-02 15:53:17',NULL),('880e8400-e29b-41d4-a716-446655440001','LUONG_CO_BAN','Lương cơ bản',9,1,1,0,NULL,0,1,NULL,NULL,1,2,1,'2026-05-23 01:02:03',NULL),('880e8400-e29b-41d4-a716-446655440002','BHXH','Bảo hiểm xã hội',3,2,2,0,NULL,0,4,'=LUONG_DONG_BH*0.08',NULL,1,2,0,'2026-05-23 01:02:03',NULL),('880e8400-e29b-41d4-a716-446655440003','THUE_TNCN','Thuế TNCN',3,2,2,0,NULL,0,4,'=THUE_TNCN',NULL,1,2,1,'2026-05-23 01:02:03',NULL),('880e8400-e29b-41d4-a716-446655440004','DOANH_THU','Doanh thu',8,1,1,0,NULL,0,1,NULL,NULL,1,1,1,'2026-05-23 01:02:03',NULL),('880e8400-e29b-41d4-a716-446655440005','KPI_THANG','KPI tháng',7,1,1,0,NULL,0,3,NULL,NULL,1,1,0,'2026-05-23 01:02:03',NULL),('b5770a94-e014-4294-bf0b-0fa665cf2a89','BHXH_3','Bảo hiểm xã hội',1,2,NULL,0,'',0,2,'{\"mode\":\"auto_sum\",\"scope\":\"organization_level\",\"level\":3,\"salaryCode\":\"LUONG_CO_BAN\"}','Bảo hiểm xã hội',1,1,0,'2026-06-03 18:19:40',NULL),('c0dda887-c80b-4680-b07e-1a510f9d7924','BHXH_1','Bảo hiểm xã hội',4,2,2,0,'',0,2,'{\"mode\":\"auto_sum\",\"scope\":\"organization_level\",\"level\":3,\"salaryCode\":\"LUONG_CO_BAN\"}','Bảo hiểm xã hội',1,1,0,'2026-06-01 16:18:19',NULL),('c1b96cd9-9f53-4b69-83a9-0046776eb8f3','LUONG_CO_BAN_9','Lương',3,1,1,0,NULL,0,1,NULL,NULL,1,1,1,'2026-05-28 11:13:41',NULL),('e050a6bd-5f43-11f1-bd41-088fc372284f','PRODUCT_01','Sản lượng sản phẩm A',4,1,NULL,0,'',0,1,'','Sản phẩm',1,2,1,'2026-06-03 19:00:55',NULL),('ee96a78a-5e57-11f1-bd41-088fc372284f','BHYT_2','Bảo hiểm y tế',2,2,2,0,'',0,2,'','Bảo hiểm',1,2,0,'2026-06-02 14:51:58',NULL),('f8bb68a2-64d0-11f1-a50e-088fc372284f','CC_TANG_CA','Tổng giờ tăng ca',9,3,NULL,0,'',0,1,'','Chấm công',1,2,1,'2026-06-10 20:33:31',NULL),('fb3ca074-638d-46bf-8eb4-f9485a4bcd33','SALE_01','SALE_01',1,1,1,NULL,'',0,2,'','',1,1,1,'2026-06-11 23:04:20',NULL);
/*!40000 ALTER TABLE `pa_salary_composition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_salary_composition_organization`
--

DROP TABLE IF EXISTS `pa_salary_composition_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_salary_composition_organization` (
  `salary_composition_organization_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `salary_composition_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `organization_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`salary_composition_organization_id`),
  UNIQUE KEY `UQ_SalaryComposition_Organization` (`salary_composition_id`,`organization_id`),
  KEY `FK_SCO_Organization` (`organization_id`),
  CONSTRAINT `FK_SCO_Organization` FOREIGN KEY (`organization_id`) REFERENCES `pa_organization` (`organization_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_SCO_SalaryComposition` FOREIGN KEY (`salary_composition_id`) REFERENCES `pa_salary_composition` (`salary_composition_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_salary_composition_organization`
--

LOCK TABLES `pa_salary_composition_organization` WRITE;
/*!40000 ALTER TABLE `pa_salary_composition_organization` DISABLE KEYS */;
INSERT INTO `pa_salary_composition_organization` VALUES ('00d0eda5-64d1-11f1-a50e-088fc372284f','00cf5339-64d1-11f1-a50e-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-06-10 20:33:44'),('316c173f-618a-11f1-bd41-088fc372284f','599d8ad7-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-06-06 16:29:18'),('316c38db-618a-11f1-bd41-088fc372284f','599d8ad7-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440004','2026-06-06 16:29:18'),('35074334-65af-11f1-a50e-088fc372284f','fb3ca074-638d-46bf-8eb4-f9485a4bcd33','550e8400-e29b-41d4-a716-446655440001','2026-06-11 23:04:20'),('3507482e-65af-11f1-a50e-088fc372284f','fb3ca074-638d-46bf-8eb4-f9485a4bcd33','550e8400-e29b-41d4-a716-446655440002','2026-06-11 23:04:20'),('35074c62-65af-11f1-a50e-088fc372284f','fb3ca074-638d-46bf-8eb4-f9485a4bcd33','550e8400-e29b-41d4-a716-446655440003','2026-06-11 23:04:20'),('3507504c-65af-11f1-a50e-088fc372284f','fb3ca074-638d-46bf-8eb4-f9485a4bcd33','550e8400-e29b-41d4-a716-446655440004','2026-06-11 23:04:20'),('35076e70-65af-11f1-a50e-088fc372284f','fb3ca074-638d-46bf-8eb4-f9485a4bcd33','550e8400-e29b-41d4-a716-446655440005','2026-06-11 23:04:20'),('3507736f-65af-11f1-a50e-088fc372284f','fb3ca074-638d-46bf-8eb4-f9485a4bcd33','550e8400-e29b-41d4-a716-446655440006','2026-06-11 23:04:20'),('35077885-65af-11f1-a50e-088fc372284f','fb3ca074-638d-46bf-8eb4-f9485a4bcd33','550e8400-e29b-41d4-a716-446655440007','2026-06-11 23:04:20'),('5270aa9c-5e55-11f1-bd41-088fc372284f','526f372b-5e55-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-06-02 14:33:17'),('54124532-6206-11f1-bd41-088fc372284f','6b42e7ab-4130-45ca-a829-3eaac0b0e1e9','550e8400-e29b-41d4-a716-446655440001','2026-06-07 07:17:54'),('55cfeade-6413-11f1-9c08-088fc372284f','55cebf00-6413-11f1-9c08-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-06-09 21:56:03'),('59e17fa8-5dcd-11f1-bd41-088fc372284f','599da2e1-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-06-01 22:19:58'),('612a9d14-6197-11f1-bd41-088fc372284f','599d7709-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-06-06 18:03:42'),('612af3f8-6197-11f1-bd41-088fc372284f','599d7709-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-06-06 18:03:42'),('612b5302-6197-11f1-bd41-088fc372284f','599d7709-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440003','2026-06-06 18:03:42'),('612ba5da-6197-11f1-bd41-088fc372284f','599d7709-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440004','2026-06-06 18:03:42'),('612bf1fa-6197-11f1-bd41-088fc372284f','599d7709-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440005','2026-06-06 18:03:42'),('612c33af-6197-11f1-bd41-088fc372284f','599d7709-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-06-06 18:03:42'),('612c7316-6197-11f1-bd41-088fc372284f','599d7709-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440007','2026-06-06 18:03:42'),('63572fe1-5dcd-11f1-bd41-088fc372284f','599da594-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-06-01 22:20:14'),('75443f0f-617d-11f1-bd41-088fc372284f','75434026-617d-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-06-06 14:58:09'),('77040815-6196-11f1-bd41-088fc372284f','599da4b5-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-06-06 17:57:09'),('77044a16-6196-11f1-bd41-088fc372284f','599da4b5-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440007','2026-06-06 17:57:09'),('7a247757-6197-11f1-bd41-088fc372284f','b5770a94-e014-4294-bf0b-0fa665cf2a89','550e8400-e29b-41d4-a716-446655440002','2026-06-06 18:04:24'),('7a247ddc-6197-11f1-bd41-088fc372284f','b5770a94-e014-4294-bf0b-0fa665cf2a89','550e8400-e29b-41d4-a716-446655440003','2026-06-06 18:04:24'),('7a248859-6197-11f1-bd41-088fc372284f','b5770a94-e014-4294-bf0b-0fa665cf2a89','550e8400-e29b-41d4-a716-446655440004','2026-06-06 18:04:24'),('7a248e56-6197-11f1-bd41-088fc372284f','b5770a94-e014-4294-bf0b-0fa665cf2a89','550e8400-e29b-41d4-a716-446655440005','2026-06-06 18:04:24'),('7d10ce29-5e92-11f1-bd41-088fc372284f','7d0fb59b-5e92-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-06-02 21:51:08'),('7f7b170c-5e60-11f1-bd41-088fc372284f','7f7a84eb-5e60-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-06-02 15:53:17'),('98fef166-64d1-11f1-a50e-088fc372284f','628d4667-0afc-4708-bba6-dbb791d4c249','550e8400-e29b-41d4-a716-446655440001','2026-06-10 20:38:00'),('98fef3e9-64d1-11f1-a50e-088fc372284f','628d4667-0afc-4708-bba6-dbb791d4c249','550e8400-e29b-41d4-a716-446655440002','2026-06-10 20:38:00'),('98fef548-64d1-11f1-a50e-088fc372284f','628d4667-0afc-4708-bba6-dbb791d4c249','550e8400-e29b-41d4-a716-446655440003','2026-06-10 20:38:00'),('98fef67b-64d1-11f1-a50e-088fc372284f','628d4667-0afc-4708-bba6-dbb791d4c249','550e8400-e29b-41d4-a716-446655440004','2026-06-10 20:38:00'),('98fef7c1-64d1-11f1-a50e-088fc372284f','628d4667-0afc-4708-bba6-dbb791d4c249','550e8400-e29b-41d4-a716-446655440005','2026-06-10 20:38:00'),('98fef8ef-64d1-11f1-a50e-088fc372284f','628d4667-0afc-4708-bba6-dbb791d4c249','550e8400-e29b-41d4-a716-446655440006','2026-06-10 20:38:00'),('98fefa14-64d1-11f1-a50e-088fc372284f','628d4667-0afc-4708-bba6-dbb791d4c249','550e8400-e29b-41d4-a716-446655440007','2026-06-10 20:38:00'),('c4a9492e-5de0-11f1-bd41-088fc372284f','599d994f-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440004','2026-06-02 00:38:57'),('cc218728-5a70-11f1-bd41-088fc372284f','599dbffa-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-05-28 15:39:53'),('cc2188d9-5a70-11f1-bd41-088fc372284f','880e8400-e29b-41d4-a716-446655440003','550e8400-e29b-41d4-a716-446655440001','2026-05-28 15:39:53'),('cc218978-5a70-11f1-bd41-088fc372284f','c1b96cd9-9f53-4b69-83a9-0046776eb8f3','550e8400-e29b-41d4-a716-446655440001','2026-05-28 15:39:53'),('cc218afc-5a70-11f1-bd41-088fc372284f','599d9b05-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-05-28 15:39:53'),('cc218e08-5a70-11f1-bd41-088fc372284f','599da715-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-05-28 15:39:53'),('cc218f07-5a70-11f1-bd41-088fc372284f','599db6ab-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-05-28 15:39:53'),('cc218f89-5a70-11f1-bd41-088fc372284f','602232f6-99fa-4a98-ac4f-5537fecc9b8b','550e8400-e29b-41d4-a716-446655440002','2026-05-28 15:39:53'),('cc218ffd-5a70-11f1-bd41-088fc372284f','880e8400-e29b-41d4-a716-446655440005','550e8400-e29b-41d4-a716-446655440002','2026-05-28 15:39:53'),('cc219074-5a70-11f1-bd41-088fc372284f','599dc164-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440003','2026-05-28 15:39:53'),('cc2190e7-5a70-11f1-bd41-088fc372284f','68f24820-0fcb-49f4-8a64-d66524c0cab6','550e8400-e29b-41d4-a716-446655440003','2026-05-28 15:39:53'),('cc219263-5a70-11f1-bd41-088fc372284f','599d9cbd-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440004','2026-05-28 15:39:53'),('cc2192d6-5a70-11f1-bd41-088fc372284f','880e8400-e29b-41d4-a716-446655440004','550e8400-e29b-41d4-a716-446655440004','2026-05-28 15:39:53'),('cc2194e9-5a70-11f1-bd41-088fc372284f','599d9bd2-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-05-28 15:39:53'),('cc21977d-5a70-11f1-bd41-088fc372284f','599da658-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-05-28 15:39:53'),('cc2197ef-5a70-11f1-bd41-088fc372284f','599db555-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-05-28 15:39:53'),('cc219891-5a70-11f1-bd41-088fc372284f','599dbeeb-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-05-28 15:39:53'),('cc219944-5a70-11f1-bd41-088fc372284f','880e8400-e29b-41d4-a716-446655440002','550e8400-e29b-41d4-a716-446655440006','2026-05-28 15:39:53'),('cc219b52-5a70-11f1-bd41-088fc372284f','880e8400-e29b-41d4-a716-446655440001','550e8400-e29b-41d4-a716-446655440007','2026-05-28 15:39:53'),('d4813c90-5d9a-11f1-bd41-088fc372284f','c0dda887-c80b-4680-b07e-1a510f9d7924','550e8400-e29b-41d4-a716-446655440001','2026-06-01 16:18:19'),('d48172f6-5d9a-11f1-bd41-088fc372284f','c0dda887-c80b-4680-b07e-1a510f9d7924','550e8400-e29b-41d4-a716-446655440003','2026-06-01 16:18:19'),('e0513b9f-5f43-11f1-bd41-088fc372284f','e050a6bd-5f43-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-06-03 19:00:55'),('e8567357-5a73-11f1-bd41-088fc372284f','599d4136-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-05-28 16:02:09'),('e85674eb-5a73-11f1-bd41-088fc372284f','599d4136-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440003','2026-05-28 16:02:09'),('e8567666-5a73-11f1-bd41-088fc372284f','599d4136-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440005','2026-05-28 16:02:09'),('e8567fda-5a73-11f1-bd41-088fc372284f','599d8c56-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440007','2026-05-28 16:02:09'),('e85681df-5a73-11f1-bd41-088fc372284f','599d8c56-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-05-28 16:02:09'),('e8568358-5a73-11f1-bd41-088fc372284f','599d8d63-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-05-28 16:02:09'),('e856849b-5a73-11f1-bd41-088fc372284f','599d8d63-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440003','2026-05-28 16:02:09'),('e8568646-5a73-11f1-bd41-088fc372284f','599d8d63-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440004','2026-05-28 16:02:09'),('e8568872-5a73-11f1-bd41-088fc372284f','599d9783-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-05-28 16:02:09'),('e8568b92-5a73-11f1-bd41-088fc372284f','599d9783-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440007','2026-05-28 16:02:09'),('e8568ee2-5a73-11f1-bd41-088fc372284f','599d9a31-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440007','2026-05-28 16:02:09'),('eb87f64c-6183-11f1-bd41-088fc372284f','599da3de-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-06-06 15:44:24'),('eb886a1a-6183-11f1-bd41-088fc372284f','599da3de-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440003','2026-06-06 15:44:24'),('eb88a847-6183-11f1-bd41-088fc372284f','599da3de-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440004','2026-06-06 15:44:24'),('eb88f50c-6183-11f1-bd41-088fc372284f','599da3de-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440005','2026-06-06 15:44:24'),('ee973fc8-5e57-11f1-bd41-088fc372284f','ee96a78a-5e57-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-06-02 14:51:58'),('f8bc2798-64d0-11f1-a50e-088fc372284f','f8bb68a2-64d0-11f1-a50e-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-06-10 20:33:31'),('f8c412c9-6179-11f1-bd41-088fc372284f','599da0ac-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-06-06 14:33:11');
/*!40000 ALTER TABLE `pa_salary_composition_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_salary_composition_system`
--

DROP TABLE IF EXISTS `pa_salary_composition_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pa_salary_composition_system` (
  `salary_composition_system_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Khóa chính TPL hệ thống',
  `salary_composition_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Mã thành phần',
  `salary_composition_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên thành phần',
  `salary_composition_type` int NOT NULL DEFAULT '9',
  `nature` int NOT NULL COMMENT 'Tính chất: 1-Thu nhập, 2-Khấu trừ, 3-Khác',
  `tax_type` int DEFAULT '1' COMMENT '1-Chịu thuế, 2-Miễn thuế toàn phần, 3-Miễn thuế một phần',
  `is_tax_reduction` tinyint(1) DEFAULT '0' COMMENT 'Giảm trừ khi tính thuế',
  `norm_formula` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'Định mức',
  `allow_over_norm` tinyint(1) DEFAULT '0' COMMENT 'Cho phép giá trị vượt định mức',
  `value_type` int DEFAULT '1' COMMENT '1-Tiền tệ, 2-Số, 3-Phần trăm, 4-Công thức',
  `value_formula` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'Giá trị hoặc công thức',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'Mô tả',
  `payslip_display_type` int DEFAULT '1' COMMENT '1-Có, 2-Không, 3-Chỉ hiện nếu giá trị khác 0',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`salary_composition_system_id`),
  UNIQUE KEY `UQ_System_CompositionCode` (`salary_composition_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_salary_composition_system`
--

LOCK TABLES `pa_salary_composition_system` WRITE;
/*!40000 ALTER TABLE `pa_salary_composition_system` DISABLE KEYS */;
INSERT INTO `pa_salary_composition_system` VALUES ('1476683f-5e57-11f1-bd41-088fc372284f','EMP_INFO_01','Thông tin nhân viên Bắc',1,1,NULL,0,'',0,1,'','Thông tin nhân viên',1,'2026-06-02 14:45:52'),('14767aa0-5e57-11f1-bd41-088fc372284f','EMP_INFO_02','Thông tin nhân viên Nam',2,1,NULL,0,'',0,1,'','Thông tin nhân viên',1,'2026-06-02 14:45:52'),('14767c6f-5e57-11f1-bd41-088fc372284f','CC_DI_LAM','Số ngày đi làm',3,3,NULL,0,'',0,1,'','Chấm công',1,'2026-06-02 14:45:52'),('14767daf-5e57-11f1-bd41-088fc372284f','CC_TANG_CA','Tổng giờ tăng ca',9,3,NULL,0,'',0,1,'','Chấm công',1,'2026-06-02 14:45:52'),('14767ed5-5e57-11f1-bd41-088fc372284f','CC_NGHI_PHEP','Ngày nghỉ phép',9,3,NULL,0,'',0,1,'','Chấm công',1,'2026-06-02 14:45:52'),('14767ff9-5e57-11f1-bd41-088fc372284f','SALE_01','Doanh số tháng',3,1,1,0,'',0,2,'','Doanh số',1,'2026-06-02 14:45:52'),('147680e7-5e57-11f1-bd41-088fc372284f','SALE_02','Doanh số quý',9,1,1,0,'',0,2,'','Doanh số',1,'2026-06-02 14:45:52'),('147681d4-5e57-11f1-bd41-088fc372284f','KPI_01','Điểm KPI tháng',4,1,NULL,0,'',0,3,'','KPI',1,'2026-06-02 14:45:52'),('147682b7-5e57-11f1-bd41-088fc372284f','KPI_02','Điểm KPI quý',3,1,NULL,0,'',0,3,'','KPI',1,'2026-06-02 14:45:52'),('14768396-5e57-11f1-bd41-088fc372284f','PRODUCT_01','Sản lượng sản phẩm A',4,1,NULL,0,'',0,1,'','Sản phẩm',1,'2026-06-02 14:45:52'),('14768472-5e57-11f1-bd41-088fc372284f','PRODUCT_02','Sản lượng sản phẩm B',9,1,NULL,0,'',0,1,'','Sản phẩm',1,'2026-06-02 14:45:52'),('1476854b-5e57-11f1-bd41-088fc372284f','LUONG_CB','Lương cơ bản',3,1,1,0,'',0,2,'','Lương',1,'2026-06-02 14:45:52'),('14768623-5e57-11f1-bd41-088fc372284f','LUONG_HD','Lương hợp đồng',7,1,1,0,'',0,2,'','Lương',1,'2026-06-02 14:45:52'),('147686fa-5e57-11f1-bd41-088fc372284f','PHU_CAP_AN_TRUA','Phụ cấp ăn trưa',9,1,2,0,'',0,2,'','Lương',1,'2026-06-02 14:45:52'),('147687e1-5e57-11f1-bd41-088fc372284f','PHU_CAP_DI_LAI','Phụ cấp đi lại',8,1,2,0,'',0,2,'','Lương',1,'2026-06-02 14:45:52'),('147688c9-5e57-11f1-bd41-088fc372284f','THUE_TNCN_1','Thuế thu nhập cá nhân',1,2,1,1,'',0,2,'','Thuế TNCN',1,'2026-06-02 14:45:52'),('147689bc-5e57-11f1-bd41-088fc372284f','BHXH_2','Bảo hiểm xã hội',9,2,2,0,'',0,2,'','Bảo hiểm',1,'2026-06-02 14:45:52'),('14768a92-5e57-11f1-bd41-088fc372284f','BHYT_2','Bảo hiểm y tế',9,2,2,0,'',0,2,'','Bảo hiểm',1,'2026-06-02 14:45:52'),('14768b6e-5e57-11f1-bd41-088fc372284f','BHTN_2','Bảo hiểm thất nghiệp',9,2,2,0,'',0,2,'','Bảo hiểm',1,'2026-06-02 14:45:52'),('4ef7bd95-b462-4fa0-bea3-015e668ab573','LUONG_CO_BAN)','Lương cơ bản',3,2,1,0,NULL,0,1,NULL,NULL,1,'2026-05-29 17:14:51'),('770e8400-e29b-41d4-a716-446655440001','LUONG_CO_BAN','Lương cơ bản',5,1,1,0,NULL,0,1,NULL,NULL,1,'2026-05-23 01:02:03'),('770e8400-e29b-41d4-a716-446655440002','LUONG_DONG_BH','Lương đóng bảo hiểm',4,1,1,0,NULL,0,1,NULL,NULL,1,'2026-05-23 01:02:03'),('770e8400-e29b-41d4-a716-446655440003','THUE_TNCN','Thuế TNCN',4,2,2,0,NULL,0,4,'=THUE_TNCN',NULL,1,'2026-05-23 01:02:03'),('770e8400-e29b-41d4-a716-446655440004','BHXH','Bảo hiểm xã hội',6,2,2,0,NULL,0,4,'=LUONG_DONG_BH*0.08',NULL,1,'2026-05-23 01:02:03'),('770e8400-e29b-41d4-a716-446655440005','BHYT','Bảo hiểm y tế',1,2,2,0,NULL,0,4,'=LUONG_DONG_BH*0.015',NULL,1,'2026-05-23 01:02:03');
/*!40000 ALTER TABLE `pa_salary_composition_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'misapayroll_development'
--
/*!50003 DROP PROCEDURE IF EXISTS `Proc_BulkDeleteSalaryComposition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_BulkDeleteSalaryComposition`(
    IN v_Ids TEXT
)
BEGIN
    DELETE FROM pa_salary_composition
    WHERE created_source = 1
      AND FIND_IN_SET(
          salary_composition_id,
          REPLACE(v_Ids, ';', ',')
      ) > 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_BulkUpdateSalaryCompositionStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_BulkUpdateSalaryCompositionStatus`(
    IN v_Ids TEXT,
    IN v_Status INT
)
BEGIN
    UPDATE pa_salary_composition
    SET status = v_Status
    WHERE FIND_IN_SET(
        salary_composition_id,
        REPLACE(v_Ids, ';', ',')
    ) > 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_CopySalaryCompositionSystemToSalaryComposition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_CopySalaryCompositionSystemToSalaryComposition`(
    IN v_SystemIDs TEXT
)
BEGIN
    DECLARE v_systemId CHAR(36);
    DECLARE v_systemIdsText TEXT;
    DECLARE v_pos INT DEFAULT 0;

    DECLARE v_newSalaryID CHAR(36);
    DECLARE v_rootOrganizationID CHAR(36);
    DECLARE v_inserted INT DEFAULT 0;

    SELECT organization_id
    INTO v_rootOrganizationID
    FROM pa_organization
    WHERE parent_id IS NULL
    ORDER BY sort_order ASC
    LIMIT 1;

    SET v_systemIdsText = v_SystemIDs;

    WHILE v_systemIdsText IS NOT NULL AND v_systemIdsText <> '' DO

        SET v_pos = LOCATE(';', v_systemIdsText);

        IF v_pos > 0 THEN
            SET v_systemId = TRIM(SUBSTRING(v_systemIdsText, 1, v_pos - 1));
            SET v_systemIdsText = SUBSTRING(v_systemIdsText, v_pos + 1);
        ELSE
            SET v_systemId = TRIM(v_systemIdsText);
            SET v_systemIdsText = '';
        END IF;

        IF v_systemId IS NOT NULL AND v_systemId <> '' THEN

            IF EXISTS (
                SELECT 1
                FROM pa_salary_composition_system s
                INNER JOIN pa_salary_composition sc
                    ON sc.salary_composition_code = s.salary_composition_code
                WHERE s.salary_composition_system_id = v_systemId
            ) THEN
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Mã thành phần đã tồn tại';
            END IF;

            SET v_newSalaryID = UUID();

            INSERT INTO pa_salary_composition
            (
                salary_composition_id,
                salary_composition_system_id,
                salary_composition_code,
                salary_composition_name,
                salary_composition_type,
                nature,
                tax_type,
                is_tax_reduction,
                norm_formula,
                allow_over_norm,
                value_type,
                value_formula,
                description,
                payslip_display_type,
                created_source,
                status
            )
            SELECT
                v_newSalaryID,
                s.salary_composition_system_id,
                s.salary_composition_code,
                s.salary_composition_name,
                s.salary_composition_type,
                s.nature,
                s.tax_type,
                s.is_tax_reduction,
                '',
                s.allow_over_norm,
                s.value_type,
                s.value_formula,
                s.description,
                1,
                2,
                1
            FROM pa_salary_composition_system s
            WHERE s.salary_composition_system_id = v_systemId;

            IF ROW_COUNT() > 0 THEN
                SET v_inserted = v_inserted + 1;

                IF v_rootOrganizationID IS NOT NULL THEN
                    INSERT INTO pa_salary_composition_organization
                    (
                        salary_composition_organization_id,
                        salary_composition_id,
                        organization_id
                    )
                    VALUES
                    (
                        UUID(),
                        v_newSalaryID,
                        v_rootOrganizationID
                    );
                END IF;
            END IF;

        END IF;

    END WHILE;

    SELECT v_inserted AS Inserted;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_DeleteGridConfigById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_DeleteGridConfigById`(
    IN v_GridConfigID CHAR(36)
)
BEGIN
    DELETE FROM pa_grid_config
    WHERE grid_config_id COLLATE utf8mb4_general_ci = v_GridConfigID COLLATE utf8mb4_general_ci;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_DeleteOrganizationById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_DeleteOrganizationById`(
    IN v_OrganizationID CHAR(36)
)
BEGIN
    DELETE FROM pa_organization
    WHERE organization_id COLLATE utf8mb4_general_ci = v_OrganizationID COLLATE utf8mb4_general_ci;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_DeleteSalaryCompositionById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_DeleteSalaryCompositionById`(
    IN v_SalaryCompositionID CHAR(36)
)
BEGIN
    DELETE FROM pa_salary_composition
    WHERE salary_composition_id COLLATE utf8mb4_general_ci = v_SalaryCompositionID COLLATE utf8mb4_general_ci;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_DeleteSalaryCompositionSystemById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_DeleteSalaryCompositionSystemById`(
    IN v_SalaryCompositionSystemID CHAR(36)
)
BEGIN
    DELETE FROM pa_salary_composition_system
    WHERE salary_composition_system_id COLLATE utf8mb4_general_ci = v_SalaryCompositionSystemID COLLATE utf8mb4_general_ci;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GridConfig_FilterPaging` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_GridConfig_FilterPaging`(
    IN v_pageIndex INT,
    IN v_pageSize INT,
    IN v_search VARCHAR(255),
    IN v_sort VARCHAR(200),
    IN v_searchFields JSON
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_where TEXT DEFAULT ' WHERE 1=1 ';
    DECLARE v_orderBy TEXT DEFAULT '';
    DECLARE v_searchCondition TEXT;

    IF v_pageIndex < 1 THEN 
        SET v_pageIndex = 1; 
    END IF;

    IF v_pageSize < 1 THEN 
        SET v_pageSize = 20; 
    END IF;

    SET v_offset = (v_pageIndex - 1) * v_pageSize;

    IF v_search IS NOT NULL 
        AND v_search <> '' 
        AND v_searchFields IS NOT NULL THEN

        SELECT GROUP_CONCAT(
            CONCAT(
                '`',
                JSON_UNQUOTE(JSON_EXTRACT(v_searchFields, CONCAT('$[', n, ']'))),
                '` LIKE ',
                QUOTE(CONCAT('%', v_search, '%'))
            )
            SEPARATOR ' OR '
        ) 
        INTO v_searchCondition

        FROM (
            SELECT 0 n 
            UNION SELECT 1 
            UNION SELECT 2 
            UNION SELECT 3 
            UNION SELECT 4
        ) t

        WHERE n < JSON_LENGTH(v_searchFields);

        IF v_searchCondition IS NOT NULL THEN
            SET v_where = CONCAT(v_where, ' AND (', v_searchCondition, ')');
        END IF;

    END IF;

    IF v_sort IS NOT NULL AND v_sort <> '' THEN

        SELECT GROUP_CONCAT(
            CONCAT(
                '`',
                IF(LEFT(item, 1) = '-', SUBSTRING(item, 2), item),
                '` ',
                IF(LEFT(item, 1) = '-', 'DESC', 'ASC')
            )
            SEPARATOR ', '
        ) 
        INTO v_orderBy

        FROM (
            SELECT TRIM(
                SUBSTRING_INDEX(
                    SUBSTRING_INDEX(v_sort, ',', n),
                    ',',
                    -1
                )
            ) item

            FROM (
                SELECT 1 n 
                UNION SELECT 2 
                UNION SELECT 3 
                UNION SELECT 4 
                UNION SELECT 5
            ) x

            WHERE n <= 1 + LENGTH(v_sort) - LENGTH(REPLACE(v_sort, ',', ''))
        ) y;

        IF v_orderBy IS NOT NULL THEN 
            SET v_orderBy = CONCAT(' ORDER BY ', v_orderBy); 
        END IF;

    END IF;

    IF v_orderBy IS NULL OR v_orderBy = '' THEN
        SET v_orderBy = ' ORDER BY sort_order ASC';
    END IF;

    SET @v_sql = CONCAT(
        'SELECT grid_config_id AS GridConfigID,
            grid_key AS GridKey,
            field_name AS FieldName,
            caption AS Caption,
            width AS Width,
            visible AS Visible,
            is_fixed AS IsFixed,
            fixed_position AS FixedPosition,
            allow_sorting AS AllowSorting,
            sort_order AS SortOrder,
            created_date AS CreatedDate            FROM pa_grid_config ',
        v_where,
        v_orderBy,
        ' LIMIT ', v_offset, ',', v_pageSize
    );

    SET @v_sqlCount = CONCAT(
        'SELECT COUNT(*) AS Total FROM pa_grid_config ',
        v_where
    );

    PREPARE stmt1 FROM @v_sql; 
    EXECUTE stmt1; 
    DEALLOCATE PREPARE stmt1;

    PREPARE stmt2 FROM @v_sqlCount; 
    EXECUTE stmt2; 
    DEALLOCATE PREPARE stmt2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GridConfig_GetByGridKey` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_GridConfig_GetByGridKey`(
    IN v_GridKey VARCHAR(100)
)
BEGIN
    SELECT
        grid_config_id AS GridConfigID,
            grid_key AS GridKey,
            field_name AS FieldName,
            caption AS Caption,
            width AS Width,
            visible AS Visible,
            is_fixed AS IsFixed,
            fixed_position AS FixedPosition,
            allow_sorting AS AllowSorting,
            sort_order AS SortOrder,
            created_date AS CreatedDate    FROM pa_grid_config
    WHERE grid_key COLLATE utf8mb4_general_ci = v_GridKey COLLATE utf8mb4_general_ci
     
    ORDER BY sort_order ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_GridConfig_Save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_GridConfig_Save`(
    IN v_GridKey VARCHAR(100),
    IN v_Columns JSON
)
BEGIN
    UPDATE pa_grid_config
    SET visible = 0
    WHERE grid_key = v_GridKey;

    UPDATE pa_grid_config g
    JOIN JSON_TABLE(
        v_Columns,
        '$[*]'
        COLUMNS(
            FieldName VARCHAR(100) PATH '$.FieldName',
            Visible TINYINT PATH '$.Visible',
            SortOrder INT PATH '$.SortOrder'
        )
    ) c
        ON g.grid_key = v_GridKey
        AND g.field_name = c.FieldName
    SET
        g.visible = IFNULL(c.Visible, 0),
        g.sort_order = IFNULL(c.SortOrder, g.sort_order);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_InsertGridConfig` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_InsertGridConfig`(
    IN v_GridConfigID CHAR(36),
    IN v_GridKey VARCHAR(100),
    IN v_FieldName VARCHAR(100),
    IN v_Caption VARCHAR(255),

    IN v_Width INT,
    IN v_Visible TINYINT,
    IN v_IsFixed TINYINT,
    IN v_FixedPosition VARCHAR(10),

    IN v_AllowSorting TINYINT,

    IN v_SortOrder INT
)
BEGIN
    IF EXISTS (
        SELECT 1 FROM pa_grid_config
        WHERE grid_key COLLATE utf8mb4_general_ci = v_GridKey COLLATE utf8mb4_general_ci
          AND field_name COLLATE utf8mb4_general_ci = v_FieldName COLLATE utf8mb4_general_ci
         
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cấu hình cột đã tồn tại';
    ELSE
        INSERT INTO pa_grid_config
        (grid_config_id, grid_key, field_name, caption, width, visible, is_fixed, fixed_position, allow_sorting, sort_order)
        VALUES
        (v_GridConfigID, v_GridKey, v_FieldName, v_Caption, IFNULL(v_Width, 150), IFNULL(v_Visible, 1), IFNULL(v_IsFixed, 0), v_FixedPosition, IFNULL(v_AllowSorting, 1), IFNULL(v_SortOrder, 0));
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_InsertOrganization` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_InsertOrganization`(
    IN v_OrganizationID CHAR(36),
    IN v_OrganizationCode VARCHAR(50),
    IN v_OrganizationName VARCHAR(255),
    IN v_ParentID CHAR(36),
    IN v_SortOrder INT
)
BEGIN
    IF EXISTS (
        SELECT 1 FROM pa_organization
        WHERE organization_code COLLATE utf8mb4_general_ci = v_OrganizationCode COLLATE utf8mb4_general_ci
         
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mã đơn vị đã tồn tại';
    ELSE
        INSERT INTO pa_organization
        (organization_id, organization_code, organization_name, parent_id, sort_order)
        VALUES
        (v_OrganizationID, v_OrganizationCode, v_OrganizationName, v_ParentID, IFNULL(v_SortOrder, 0));
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_InsertSalaryComposition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_InsertSalaryComposition`(
    IN v_SalaryCompositionID CHAR(36),
    IN v_SalaryCompositionCode VARCHAR(255),
    IN v_SalaryCompositionName VARCHAR(255),

    IN v_OrganizationIDs TEXT,
    IN v_SalaryCompositionType INT,
    IN v_Nature INT,
    IN v_TaxType INT,
    IN v_IsTaxReduction TINYINT,
    IN v_NormFormula TEXT,
    IN v_AllowOverNorm TINYINT,
    IN v_ValueType INT,
    IN v_ValueFormula TEXT,
    IN v_Description TEXT,
    IN v_PayslipDisplayType INT,
    IN v_CreatedSource INT,
    IN v_Status INT
)
BEGIN
    DECLARE v_item VARCHAR(50);
    DECLARE v_pos INT DEFAULT 0;
    DECLARE v_ids TEXT;

    IF EXISTS (
        SELECT 1
        FROM pa_salary_composition
        WHERE salary_composition_code COLLATE utf8mb4_general_ci
            = v_SalaryCompositionCode COLLATE utf8mb4_general_ci
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Mã thành phần đã tồn tại';
    ELSE
        INSERT INTO pa_salary_composition
        (
            salary_composition_id,
            salary_composition_code,
            salary_composition_name,

            salary_composition_type,
            nature,
            tax_type,
            is_tax_reduction,
            norm_formula,
            allow_over_norm,
            value_type,
            value_formula,
            description,
            payslip_display_type,
            created_source,
            status
        )
        VALUES
        (
            v_SalaryCompositionID,
            v_SalaryCompositionCode,
            v_SalaryCompositionName,

            v_SalaryCompositionType,
            v_Nature,
            v_TaxType,
            v_IsTaxReduction,
            v_NormFormula,
            IFNULL(v_AllowOverNorm, 0),
            IFNULL(v_ValueType, 1),
            v_ValueFormula,
            v_Description,
            IFNULL(v_PayslipDisplayType, 1),
            IFNULL(v_CreatedSource, 1),
            IFNULL(v_Status, 1)
        );

        SET v_ids = v_OrganizationIDs;

        IF v_ids IS NULL OR v_ids = '' THEN
            SET v_ids = '';
        END IF;

        WHILE v_ids IS NOT NULL AND v_ids <> '' DO
            SET v_pos = LOCATE(';', v_ids);

            IF v_pos > 0 THEN
                SET v_item = TRIM(SUBSTRING(v_ids, 1, v_pos - 1));
                SET v_ids = SUBSTRING(v_ids, v_pos + 1);
            ELSE
                SET v_item = TRIM(v_ids);
                SET v_ids = '';
            END IF;

            IF v_item IS NOT NULL AND v_item <> '' THEN
                INSERT IGNORE INTO pa_salary_composition_organization
                (
                    salary_composition_organization_id,
                    salary_composition_id,
                    organization_id
                )
                VALUES
                (
                    UUID(),
                    v_SalaryCompositionID,
                    v_item
                );
            END IF;
        END WHILE;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_InsertSalaryCompositionSystem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_InsertSalaryCompositionSystem`(
    IN v_SalaryCompositionSystemID CHAR(36),
    IN v_SalaryCompositionCode VARCHAR(255),
    IN v_SalaryCompositionName VARCHAR(255),
    IN v_SalaryCompositionType INT,
    IN v_Nature INT,
    IN v_TaxType INT,
    IN v_IsTaxReduction TINYINT,
    IN v_NormFormula TEXT,
    IN v_AllowOverNorm TINYINT,
    IN v_ValueType INT,
    IN v_ValueFormula TEXT,
    IN v_Description TEXT,
    IN v_PayslipDisplayType INT
)
BEGIN
    IF EXISTS (
        SELECT 1 FROM pa_salary_composition_system
        WHERE salary_composition_code COLLATE utf8mb4_general_ci = v_SalaryCompositionCode COLLATE utf8mb4_general_ci
         
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mã thành phần hệ thống đã tồn tại';
    ELSE
        INSERT INTO pa_salary_composition_system
        (salary_composition_system_id, salary_composition_code, salary_composition_name, salary_composition_type, nature,
         tax_type, is_tax_reduction, norm_formula, allow_over_norm, value_type, value_formula, description, payslip_display_type)
        VALUES
        (v_SalaryCompositionSystemID, v_SalaryCompositionCode, v_SalaryCompositionName, v_SalaryCompositionType, v_Nature,
         IFNULL(v_TaxType, 1), IFNULL(v_IsTaxReduction, 0), v_NormFormula, IFNULL(v_AllowOverNorm, 0),
         IFNULL(v_ValueType, 1), v_ValueFormula, v_Description, IFNULL(v_PayslipDisplayType, 1));
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_Organization_FilterPaging` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Organization_FilterPaging`(
    IN v_pageIndex INT,
    IN v_pageSize INT,
    IN v_search VARCHAR(255),
    IN v_sort VARCHAR(200),
    IN v_searchFields json)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_where TEXT DEFAULT ' WHERE 1=1 ';
    DECLARE v_orderBy TEXT DEFAULT '';
    DECLARE v_searchCondition TEXT;

    IF v_pageIndex < 1 THEN SET v_pageIndex = 1; END IF;
    IF v_pageSize < 1 THEN SET v_pageSize = 20; END IF;

    SET v_offset = (v_pageIndex - 1) * v_pageSize;

    IF v_search IS NOT NULL AND v_search <> '' AND v_searchFields IS NOT NULL THEN
        SELECT GROUP_CONCAT(
            CONCAT('`', JSON_UNQUOTE(JSON_EXTRACT(v_searchFields, CONCAT('$[', n, ']'))), '` LIKE ', QUOTE(CONCAT('%', v_search, '%')))
            SEPARATOR ' OR '
        ) INTO v_searchCondition
        FROM (
            SELECT 0 n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
        ) t
        WHERE n < JSON_LENGTH(v_searchFields);

        IF v_searchCondition IS NOT NULL THEN
            SET v_where = CONCAT(v_where, ' AND (', v_searchCondition, ')');
        END IF;
    END IF;

    IF v_sort IS NOT NULL AND v_sort <> '' THEN
        SELECT GROUP_CONCAT(
            CONCAT('`', IF(LEFT(item, 1) = '-', SUBSTRING(item, 2), item), '` ', IF(LEFT(item, 1) = '-', 'DESC', 'ASC'))
            SEPARATOR ', '
        ) INTO v_orderBy
        FROM (
            SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(v_sort, ',', n), ',', -1)) item
            FROM (SELECT 1 n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) x
            WHERE n <= 1 + LENGTH(v_sort) - LENGTH(REPLACE(v_sort, ',', ''))
        ) y;

        IF v_orderBy IS NOT NULL THEN SET v_orderBy = CONCAT(' ORDER BY ', v_orderBy); END IF;
    END IF;

    IF v_orderBy IS NULL OR v_orderBy = '' THEN
        SET v_orderBy = ' ORDER BY sort_order ASC, organization_name ASC';
    END IF;

    SET @v_sql = CONCAT('SELECT organization_id AS OrganizationID,
            organization_code AS OrganizationCode,
            organization_name AS OrganizationName,
            parent_id AS ParentID,
            sort_order AS SortOrder,
            created_date AS CreatedDate            FROM pa_organization ', v_where, v_orderBy, ' LIMIT ', v_offset, ',', v_pageSize);
    SET @v_sqlCount = CONCAT('SELECT COUNT(*) AS Total FROM pa_organization ', v_where);

    PREPARE stmt1 FROM @v_sql; EXECUTE stmt1; DEALLOCATE PREPARE stmt1;
    PREPARE stmt2 FROM @v_sqlCount; EXECUTE stmt2; DEALLOCATE PREPARE stmt2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_SalaryCompositionSystem_Filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_SalaryCompositionSystem_Filter`(
    IN v_pageIndex INT,
    IN v_pageSize INT,
    IN v_search VARCHAR(255),
    IN v_sort VARCHAR(200),
    IN v_SalaryCompositionType INT,
    IN v_advancedFilters JSON
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_where TEXT DEFAULT ' WHERE 1=1 ';
    DECLARE v_orderBy TEXT DEFAULT '';

    DECLARE v_done INT DEFAULT 0;
    DECLARE v_fieldName VARCHAR(100);
    DECLARE v_operator VARCHAR(50);
    DECLARE v_value TEXT;
    DECLARE v_columnName VARCHAR(100);

    DECLARE cur CURSOR FOR
        SELECT
            field_name,
            operator_name,
            filter_value
        FROM JSON_TABLE(
            v_advancedFilters,
            '$[*]'
            COLUMNS(
                field_name VARCHAR(100) PATH '$.FieldName',
                operator_name VARCHAR(50) PATH '$.Operator',
                filter_value TEXT PATH '$.Value'
            )
        ) jt;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

    IF v_pageIndex < 1 THEN SET v_pageIndex = 1; END IF;
    IF v_pageSize < 1 THEN SET v_pageSize = 20; END IF;

    SET v_offset = (v_pageIndex - 1) * v_pageSize;

    SET v_where = CONCAT(
        v_where,
        ' AND NOT EXISTS (
    SELECT 1
    FROM pa_salary_composition sc
    WHERE sc.salary_composition_system_id = s.salary_composition_system_id
) '
    );

    IF v_search IS NOT NULL AND v_search <> '' THEN
        SET v_where = CONCAT(
            v_where,
            ' AND (
                s.salary_composition_code LIKE ', QUOTE(CONCAT('%', v_search, '%')),
                ' OR s.salary_composition_name LIKE ', QUOTE(CONCAT('%', v_search, '%')),
                ' OR CAST(s.salary_composition_type AS CHAR) LIKE ', QUOTE(CONCAT('%', v_search, '%')),
            ')'
        );
    END IF;

    IF v_SalaryCompositionType IS NOT NULL THEN
        SET v_where = CONCAT(
            v_where,
            ' AND s.salary_composition_type = ',
            v_SalaryCompositionType
        );
    END IF;

    IF v_advancedFilters IS NOT NULL AND JSON_LENGTH(v_advancedFilters) > 0 THEN
        OPEN cur;

        read_loop: LOOP
            FETCH cur INTO v_fieldName, v_operator, v_value;

            IF v_done = 1 THEN
                LEAVE read_loop;
            END IF;

            SET v_columnName =
                CASE v_fieldName
                    WHEN 'SalaryCompositionCode' THEN 's.salary_composition_code'
                    WHEN 'SalaryCompositionName' THEN 's.salary_composition_name'
                    WHEN 'SalaryCompositionType' THEN 's.salary_composition_type'
                    WHEN 'Nature' THEN 's.nature'
                    WHEN 'TaxType' THEN 's.tax_type'
                    WHEN 'IsTaxReduction' THEN 's.is_tax_reduction'
                    WHEN 'NormFormula' THEN 's.norm_formula'
                    WHEN 'ValueType' THEN 's.value_type'
                    WHEN 'ValueFormula' THEN 's.value_formula'
                    WHEN 'Description' THEN 's.description'
                    WHEN 'PayslipDisplayType' THEN 's.payslip_display_type'
                    ELSE NULL
                END;

            IF v_columnName IS NOT NULL THEN

                IF v_fieldName IN ('IsTaxReduction', 'AllowOverNorm') THEN
                    IF LOWER(v_value) = 'true' THEN
                        SET v_value = '1';
                    ELSEIF LOWER(v_value) = 'false' THEN
                        SET v_value = '0';
                    END IF;
                END IF;

                IF v_operator = 'contains' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND IFNULL(CAST(', v_columnName, ' AS CHAR), "") LIKE ',
                        QUOTE(CONCAT('%', IFNULL(v_value, ''), '%'))
                    );

                ELSEIF v_operator = 'notContains' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND IFNULL(CAST(', v_columnName, ' AS CHAR), "") NOT LIKE ',
                        QUOTE(CONCAT('%', IFNULL(v_value, ''), '%'))
                    );

                ELSEIF v_operator = 'equals' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND CAST(', v_columnName, ' AS CHAR) = ',
                        QUOTE(IFNULL(v_value, ''))
                    );

                ELSEIF v_operator = 'notEquals' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND CAST(', v_columnName, ' AS CHAR) <> ',
                        QUOTE(IFNULL(v_value, ''))
                    );

                ELSEIF v_operator = 'startsWith' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND IFNULL(CAST(', v_columnName, ' AS CHAR), "") LIKE ',
                        QUOTE(CONCAT(IFNULL(v_value, ''), '%'))
                    );

                ELSEIF v_operator = 'endsWith' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND IFNULL(CAST(', v_columnName, ' AS CHAR), "") LIKE ',
                        QUOTE(CONCAT('%', IFNULL(v_value, '')))
                    );

                ELSEIF v_operator = 'empty' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND (', v_columnName, ' IS NULL OR CAST(', v_columnName, ' AS CHAR) = "")'
                    );

                ELSEIF v_operator = 'notEmpty' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND (', v_columnName, ' IS NOT NULL AND CAST(', v_columnName, ' AS CHAR) <> "")'
                    );
                END IF;

            END IF;

        END LOOP;

        CLOSE cur;
    END IF;

    IF v_sort IS NOT NULL AND v_sort <> '' THEN
        SELECT GROUP_CONCAT(
            CONCAT(
                CASE
                    WHEN IF(LEFT(item, 1) = '-', SUBSTRING(item, 2), item) = 'SalaryCompositionCode'
                        THEN 's.salary_composition_code'
                    WHEN IF(LEFT(item, 1) = '-', SUBSTRING(item, 2), item) = 'SalaryCompositionName'
                        THEN 's.salary_composition_name'
                    WHEN IF(LEFT(item, 1) = '-', SUBSTRING(item, 2), item) = 'SalaryCompositionType'
                        THEN 's.salary_composition_type'
                    WHEN IF(LEFT(item, 1) = '-', SUBSTRING(item, 2), item) = 'CreatedDate'
                        THEN 's.created_date'
                    ELSE CONCAT('s.`', IF(LEFT(item, 1) = '-', SUBSTRING(item, 2), item), '`')
                END,
                ' ',
                IF(LEFT(item, 1) = '-', 'DESC', 'ASC')
            )
            SEPARATOR ', '
        ) INTO v_orderBy
        FROM (
            SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(v_sort, ',', n), ',', -1)) item
            FROM (
                SELECT 1 n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
            ) x
            WHERE n <= 1 + LENGTH(v_sort) - LENGTH(REPLACE(v_sort, ',', ''))
        ) y;

        IF v_orderBy IS NOT NULL THEN
            SET v_orderBy = CONCAT(' ORDER BY ', v_orderBy);
        END IF;
    END IF;

    IF v_orderBy IS NULL OR v_orderBy = '' THEN
        SET v_orderBy = ' ORDER BY s.created_date DESC';
    END IF;

    SET @v_sql = CONCAT(
        'SELECT
            s.salary_composition_system_id AS SalaryCompositionSystemID,
            s.salary_composition_code AS SalaryCompositionCode,
            s.salary_composition_name AS SalaryCompositionName,
            s.salary_composition_type AS SalaryCompositionType,
            s.nature AS Nature,
            s.tax_type AS TaxType,
            s.is_tax_reduction AS IsTaxReduction,
            s.norm_formula AS NormFormula,
            s.allow_over_norm AS AllowOverNorm,
            s.value_type AS ValueType,
            s.value_formula AS ValueFormula,
            s.description AS Description,
            s.payslip_display_type AS PayslipDisplayType,
            s.created_date AS CreatedDate,

            CASE s.nature
                WHEN 1 THEN "Thu nhập"
                WHEN 2 THEN "Khấu trừ"
                WHEN 3 THEN "Khác"
                ELSE "-"
            END AS NatureName,

            CASE s.tax_type
                WHEN 1 THEN "Chịu thuế"
                WHEN 2 THEN "Miễn thuế toàn phần"
                WHEN 3 THEN "Miễn thuế một phần"
                ELSE "-"
            END AS TaxTypeName,

            CASE s.value_type
                WHEN 1 THEN "Số"
                WHEN 2 THEN "Tiền tệ"
                WHEN 3 THEN "Phần trăm"
                WHEN 4 THEN "Chữ"
                WHEN 5 THEN "Ngày"
                ELSE "-"
            END AS ValueTypeName,

            CASE s.payslip_display_type
                WHEN 1 THEN "Có"
                WHEN 2 THEN "Không"
                WHEN 3 THEN "Chỉ hiển thị nếu giá trị khác 0"
                ELSE "-"
            END AS PayslipDisplayTypeName

        FROM pa_salary_composition_system s ',

        v_where,
        v_orderBy,
        ' LIMIT ', v_offset, ',', v_pageSize
    );

    SET @v_sqlCount = CONCAT(
        'SELECT COUNT(*) AS Total
        FROM pa_salary_composition_system s ',
        v_where
    );

    PREPARE stmt1 FROM @v_sql;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;

    PREPARE stmt2 FROM @v_sqlCount;
    EXECUTE stmt2;
    DEALLOCATE PREPARE stmt2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_SalaryCompositionSystem_FilterPaging` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_SalaryCompositionSystem_FilterPaging`(
    IN v_pageIndex INT,
    IN v_pageSize INT,
    IN v_search VARCHAR(255),
    IN v_sort VARCHAR(200),
    IN v_searchFields JSON
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_where TEXT DEFAULT ' WHERE 1=1 ';
    DECLARE v_orderBy TEXT DEFAULT '';

    IF v_pageIndex < 1 THEN SET v_pageIndex = 1; END IF;
    IF v_pageSize < 1 THEN SET v_pageSize = 20; END IF;

    SET v_offset = (v_pageIndex - 1) * v_pageSize;

    SET v_where = CONCAT(
        v_where,
        ' AND NOT EXISTS (
    SELECT 1
    FROM pa_salary_composition sc
    WHERE sc.salary_composition_system_id = s.salary_composition_system_id
) '
    );

    IF v_search IS NOT NULL AND v_search <> '' THEN
        SET v_where = CONCAT(
            v_where,
            ' AND (
                s.salary_composition_code LIKE ', QUOTE(CONCAT('%', v_search, '%')),
                ' OR s.salary_composition_name LIKE ', QUOTE(CONCAT('%', v_search, '%')),
                ' OR CAST(s.salary_composition_type AS CHAR) LIKE ', QUOTE(CONCAT('%', v_search, '%')),
            ')'
        );
    END IF;

    IF v_sort IS NOT NULL AND v_sort <> '' THEN
        SELECT GROUP_CONCAT(
            CONCAT(
                's.`',
                IF(LEFT(item,1)='-',SUBSTRING(item,2),item),
                '` ',
                IF(LEFT(item,1)='-','DESC','ASC')
            )
            SEPARATOR ', '
        ) INTO v_orderBy
        FROM (
            SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(v_sort, ',', n), ',', -1)) item
            FROM (
                SELECT 1 n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
            ) x
            WHERE n <= 1 + LENGTH(v_sort) - LENGTH(REPLACE(v_sort, ',', ''))
        ) y;

        IF v_orderBy IS NOT NULL AND v_orderBy <> '' THEN
            SET v_orderBy = CONCAT(' ORDER BY ', v_orderBy);
        END IF;
    END IF;

    IF v_orderBy IS NULL OR v_orderBy = '' THEN
        SET v_orderBy = ' ORDER BY s.created_date DESC';
    END IF;

    SET @v_sql = CONCAT(
        'SELECT
            s.salary_composition_system_id AS SalaryCompositionSystemID,
            s.salary_composition_code AS SalaryCompositionCode,
            s.salary_composition_name AS SalaryCompositionName,
            s.salary_composition_type AS SalaryCompositionType,
            s.nature AS Nature,
            s.tax_type AS TaxType,
            s.is_tax_reduction AS IsTaxReduction,
            s.norm_formula AS NormFormula,
            s.allow_over_norm AS AllowOverNorm,
            s.value_type AS ValueType,
            s.value_formula AS ValueFormula,
            s.description AS Description,
            s.payslip_display_type AS PayslipDisplayType,
            s.created_date AS CreatedDate,

            CASE s.nature
                WHEN 1 THEN "Thu nhập"
                WHEN 2 THEN "Khấu trừ"
                WHEN 3 THEN "Khác"
                ELSE "-"
            END AS NatureName,

            CASE s.tax_type
                WHEN 1 THEN "Chịu thuế"
                WHEN 2 THEN "Miễn thuế toàn phần"
                WHEN 3 THEN "Miễn thuế một phần"
                ELSE "-"
            END AS TaxTypeName,

            CASE s.value_type
                WHEN 1 THEN "Số"
                WHEN 2 THEN "Tiền tệ"
                WHEN 3 THEN "Phần trăm"
                WHEN 4 THEN "Chữ"
                WHEN 5 THEN "Ngày"
                ELSE "-"
            END AS ValueTypeName,

            CASE s.payslip_display_type
                WHEN 1 THEN "Có"
                WHEN 2 THEN "Không"
                WHEN 3 THEN "Chỉ hiển thị nếu giá trị khác 0"
                ELSE "-"
            END AS PayslipDisplayTypeName,

            s.created_date

        FROM pa_salary_composition_system s ',

        v_where,
        v_orderBy,
        ' LIMIT ', v_offset, ',', v_pageSize
    );

    SET @v_sqlCount = CONCAT(
        'SELECT COUNT(*) AS Total
        FROM pa_salary_composition_system s ',
        v_where
    );

    PREPARE stmt1 FROM @v_sql;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;

    PREPARE stmt2 FROM @v_sqlCount;
    EXECUTE stmt2;
    DEALLOCATE PREPARE stmt2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_SalaryComposition_Filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_SalaryComposition_Filter`(
    IN v_pageIndex INT,
    IN v_pageSize INT,
    IN v_search VARCHAR(255),
    IN v_sort VARCHAR(200),
    IN v_status INT,
    IN v_organizationIDs TEXT,
    IN v_advancedFilters JSON
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_where TEXT DEFAULT ' WHERE 1=1 ';
    DECLARE v_orderBy TEXT DEFAULT '';

    DECLARE v_done INT DEFAULT 0;
    DECLARE v_fieldName VARCHAR(100);
    DECLARE v_operator VARCHAR(50);
    DECLARE v_value TEXT;
    DECLARE v_columnName VARCHAR(100);

    DECLARE cur CURSOR FOR
        SELECT
            field_name,
            operator_name,
            filter_value
        FROM JSON_TABLE(
            v_advancedFilters,
            '$[*]'
            COLUMNS(
                field_name VARCHAR(100) PATH '$.FieldName',
                operator_name VARCHAR(50) PATH '$.Operator',
                filter_value TEXT PATH '$.Value'
            )
        ) jt;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;

    IF v_pageIndex < 1 THEN SET v_pageIndex = 1; END IF;
    IF v_pageSize < 1 THEN SET v_pageSize = 20; END IF;

    SET v_offset = (v_pageIndex - 1) * v_pageSize;

    IF v_search IS NOT NULL AND v_search <> '' THEN
        SET v_where = CONCAT(
            v_where,
            ' AND (
                sc.salary_composition_code LIKE ', QUOTE(CONCAT('%', v_search, '%')),
                ' OR sc.salary_composition_name LIKE ', QUOTE(CONCAT('%', v_search, '%')),
                ' OR IFNULL(org.organization_names, "") LIKE ', QUOTE(CONCAT('%', v_search, '%')),
                ' OR CAST(sc.salary_composition_type AS CHAR) LIKE ', QUOTE(CONCAT('%', v_search, '%')),
            ')'
        );
    END IF;

    IF v_status IS NOT NULL THEN
        SET v_where = CONCAT(v_where, ' AND sc.status = ', v_status);
    END IF;

    IF v_organizationIDs IS NOT NULL AND v_organizationIDs <> '' THEN
        SET v_where = CONCAT(
            v_where,
            ' AND EXISTS (
                SELECT 1
                FROM pa_salary_composition_organization scoFilter
                WHERE scoFilter.salary_composition_id = sc.salary_composition_id
                  AND FIND_IN_SET(
                        scoFilter.organization_id,
                        REPLACE(', QUOTE(v_organizationIDs), ', ";", ",")
                  ) > 0
            )'
        );
    END IF;

    IF v_advancedFilters IS NOT NULL AND JSON_LENGTH(v_advancedFilters) > 0 THEN
        OPEN cur;

        read_loop: LOOP
            FETCH cur INTO v_fieldName, v_operator, v_value;

            IF v_done = 1 THEN
                LEAVE read_loop;
            END IF;

            SET v_columnName =
                CASE v_fieldName
                    WHEN 'SalaryCompositionCode' THEN 'sc.salary_composition_code'
                    WHEN 'SalaryCompositionName' THEN 'sc.salary_composition_name'
                    WHEN 'OrganizationNames' THEN 'org.organization_names'
                    WHEN 'SalaryCompositionType' THEN 'sc.salary_composition_type'
                    WHEN 'Nature' THEN 'sc.nature'
                    WHEN 'TaxType' THEN 'sc.tax_type'
                    WHEN 'IsTaxReduction' THEN 'sc.is_tax_reduction'
                    WHEN 'NormFormula' THEN 'sc.norm_formula'
                    WHEN 'ValueType' THEN 'sc.value_type'
                    WHEN 'ValueFormula' THEN 'sc.value_formula'
                    WHEN 'Description' THEN 'sc.description'
                    WHEN 'PayslipDisplayType' THEN 'sc.payslip_display_type'
                    WHEN 'CreatedSource' THEN 'sc.created_source'
                    WHEN 'Status' THEN 'sc.status'
                    ELSE NULL
                END;

            IF v_columnName IS NOT NULL THEN

                IF v_operator = 'contains' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND IFNULL(CAST(', v_columnName, ' AS CHAR), "") LIKE ',
                        QUOTE(CONCAT('%', IFNULL(v_value, ''), '%'))
                    );

                ELSEIF v_operator = 'notContains' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND IFNULL(CAST(', v_columnName, ' AS CHAR), "") NOT LIKE ',
                        QUOTE(CONCAT('%', IFNULL(v_value, ''), '%'))
                    );

                ELSEIF v_operator = 'equals' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND CAST(', v_columnName, ' AS CHAR) = ',
                        QUOTE(IFNULL(v_value, ''))
                    );

                ELSEIF v_operator = 'notEquals' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND CAST(', v_columnName, ' AS CHAR) <> ',
                        QUOTE(IFNULL(v_value, ''))
                    );

                ELSEIF v_operator = 'startsWith' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND IFNULL(CAST(', v_columnName, ' AS CHAR), "") LIKE ',
                        QUOTE(CONCAT(IFNULL(v_value, ''), '%'))
                    );

                ELSEIF v_operator = 'endsWith' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND IFNULL(CAST(', v_columnName, ' AS CHAR), "") LIKE ',
                        QUOTE(CONCAT('%', IFNULL(v_value, '')))
                    );

                ELSEIF v_operator = 'empty' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND (', v_columnName, ' IS NULL OR CAST(', v_columnName, ' AS CHAR) = "")'
                    );

                ELSEIF v_operator = 'notEmpty' THEN
                    SET v_where = CONCAT(
                        v_where,
                        ' AND (', v_columnName, ' IS NOT NULL AND CAST(', v_columnName, ' AS CHAR) <> "")'
                    );
                END IF;

            END IF;

        END LOOP;

        CLOSE cur;
    END IF;

    IF v_sort IS NOT NULL AND v_sort <> '' THEN
        SELECT GROUP_CONCAT(
            CONCAT(
                CASE
                    WHEN IF(LEFT(item, 1) = '-', SUBSTRING(item, 2), item) IN ('OrganizationNames', 'organization_names')
                        THEN 'org.organization_names'
                    WHEN IF(LEFT(item, 1) = '-', SUBSTRING(item, 2), item) = 'SalaryCompositionCode'
                        THEN 'sc.salary_composition_code'
                    WHEN IF(LEFT(item, 1) = '-', SUBSTRING(item, 2), item) = 'SalaryCompositionName'
                        THEN 'sc.salary_composition_name'
                    WHEN IF(LEFT(item, 1) = '-', SUBSTRING(item, 2), item) = 'SalaryCompositionType'
                        THEN 'sc.salary_composition_type'
                    WHEN IF(LEFT(item, 1) = '-', SUBSTRING(item, 2), item) = 'CreatedDate'
                        THEN 'sc.created_date'
                    ELSE CONCAT('sc.`', IF(LEFT(item, 1) = '-', SUBSTRING(item, 2), item), '`')
                END,
                ' ',
                IF(LEFT(item, 1) = '-', 'DESC', 'ASC')
            )
            SEPARATOR ', '
        ) INTO v_orderBy
        FROM (
            SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(v_sort, ',', n), ',', -1)) item
            FROM (
                SELECT 1 n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
            ) x
            WHERE n <= 1 + LENGTH(v_sort) - LENGTH(REPLACE(v_sort, ',', ''))
        ) y;

        IF v_orderBy IS NOT NULL THEN
            SET v_orderBy = CONCAT(' ORDER BY ', v_orderBy);
        END IF;
    END IF;

    IF v_orderBy IS NULL OR v_orderBy = '' THEN
        SET v_orderBy = ' ORDER BY sc.created_date DESC';
    END IF;

    SET @v_sql = CONCAT(
        'SELECT
            sc.salary_composition_id AS SalaryCompositionID,
            sc.salary_composition_code AS SalaryCompositionCode,
            sc.salary_composition_name AS SalaryCompositionName,
            sc.nature AS Nature,
            sc.tax_type AS TaxType,
            sc.is_tax_reduction AS IsTaxReduction,
            sc.norm_formula AS NormFormula,
            sc.allow_over_norm AS AllowOverNorm,
            sc.value_type AS ValueType,
            sc.value_formula AS ValueFormula,
            sc.description AS Description,
            sc.payslip_display_type AS PayslipDisplayType,
            sc.created_source AS CreatedSource,
            sc.status AS Status,
            sc.created_date AS CreatedDate,
            sc.salary_composition_type AS SalaryCompositionType,
            org.organization_ids AS OrganizationIDs,
            org.organization_names AS OrganizationNames,

            CASE sc.nature
                WHEN 1 THEN "Thu nhập"
                WHEN 2 THEN "Khấu trừ"
                WHEN 3 THEN "Khác"
                ELSE "-"
            END AS NatureName,

            CASE sc.tax_type
                WHEN 1 THEN "Chịu thuế"
                WHEN 2 THEN "Miễn thuế toàn phần"
                WHEN 3 THEN "Miễn thuế một phần"
                ELSE "-"
            END AS TaxTypeName,

            CASE
                WHEN sc.tax_type <> 1 THEN "-"
                WHEN sc.is_tax_reduction = 1 THEN "Có"
                ELSE "Không"
            END AS IsTaxReductionName,

            CASE sc.value_type
                WHEN 1 THEN "Số"
                WHEN 2 THEN "Tiền tệ"
                WHEN 3 THEN "Phần trăm"
                WHEN 4 THEN "Chữ"
                WHEN 5 THEN "Ngày"
                ELSE "-"
            END AS ValueTypeName,

            CASE sc.payslip_display_type
                WHEN 1 THEN "Có"
                WHEN 2 THEN "Không"
                WHEN 3 THEN "Chỉ hiển thị nếu giá trị khác 0"
                ELSE "-"
            END AS PayslipDisplayTypeName,

            CASE
                WHEN sc.value_formula IS NULL OR sc.value_formula = "" THEN "-"
                WHEN JSON_VALID(sc.value_formula) = 1 THEN "-"
                ELSE sc.value_formula
            END AS ValueFormulaDisplay,

            CASE sc.created_source
                WHEN 1 THEN "Tự thêm"
                WHEN 2 THEN "Mặc định"
                ELSE "-"
            END AS CreatedSourceName,

            CASE sc.status
                WHEN 1 THEN "Đang theo dõi"
                WHEN 0 THEN "Ngừng theo dõi"
                ELSE "-"
            END AS StatusName

        FROM pa_salary_composition sc

        LEFT JOIN (
            SELECT
                sco.salary_composition_id,
                GROUP_CONCAT(o.organization_id ORDER BY o.sort_order ASC SEPARATOR ";") AS organization_ids,
                GROUP_CONCAT(o.organization_name ORDER BY o.sort_order ASC SEPARATOR "; ") AS organization_names
            FROM pa_salary_composition_organization sco
            INNER JOIN pa_organization o
                ON sco.organization_id = o.organization_id
            GROUP BY sco.salary_composition_id
        ) org
            ON sc.salary_composition_id = org.salary_composition_id ',

        v_where,
        v_orderBy,
        ' LIMIT ', v_offset, ',', v_pageSize
    );

    SET @v_sqlCount = CONCAT(
        'SELECT COUNT(*) AS Total
        FROM pa_salary_composition sc

        LEFT JOIN (
            SELECT
                sco.salary_composition_id,
                GROUP_CONCAT(o.organization_id ORDER BY o.sort_order ASC SEPARATOR ";") AS organization_ids,
                GROUP_CONCAT(o.organization_name ORDER BY o.sort_order ASC SEPARATOR "; ") AS organization_names
            FROM pa_salary_composition_organization sco
            INNER JOIN pa_organization o
                ON sco.organization_id = o.organization_id
            GROUP BY sco.salary_composition_id
        ) org
            ON sc.salary_composition_id = org.salary_composition_id ',

        v_where
    );

    PREPARE stmt1 FROM @v_sql;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;

    PREPARE stmt2 FROM @v_sqlCount;
    EXECUTE stmt2;
    DEALLOCATE PREPARE stmt2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_SalaryComposition_FilterPaging` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_SalaryComposition_FilterPaging`(
    IN v_pageIndex INT,
    IN v_pageSize INT,
    IN v_search VARCHAR(255),
    IN v_sort VARCHAR(200),
    IN v_searchFields JSON
)
BEGIN
    DECLARE v_offset INT;
    DECLARE v_where TEXT DEFAULT ' WHERE 1=1 ';
    DECLARE v_orderBy TEXT DEFAULT '';

    IF v_pageIndex < 1 THEN SET v_pageIndex = 1; END IF;
    IF v_pageSize < 1 THEN SET v_pageSize = 20; END IF;

    SET v_offset = (v_pageIndex - 1) * v_pageSize;

    IF v_search IS NOT NULL AND v_search <> '' THEN
        SET v_where = CONCAT(
            v_where,
            ' AND (
                sc.salary_composition_code LIKE ', QUOTE(CONCAT('%', v_search, '%')),
                ' OR sc.salary_composition_name LIKE ', QUOTE(CONCAT('%', v_search, '%')),
                ' OR IFNULL(org.organization_names, "") LIKE ', QUOTE(CONCAT('%', v_search, '%')),
                ' OR CAST(sc.salary_composition_type AS CHAR) LIKE ', QUOTE(CONCAT('%', v_search, '%')),
            ')'
        );
    END IF;

    IF v_sort IS NOT NULL AND v_sort <> '' THEN
        SELECT GROUP_CONCAT(
            CONCAT(
                CASE
                    WHEN IF(LEFT(item, 1) = '-', SUBSTRING(item, 2), item)
                        IN ('OrganizationNames', 'OrganizationName', 'organization_names', 'organization_name')
                    THEN 'org.organization_names'
                    ELSE CONCAT('sc.`', IF(LEFT(item, 1) = '-', SUBSTRING(item, 2), item), '`')
                END,
                ' ',
                IF(LEFT(item, 1) = '-', 'DESC', 'ASC')
            )
            SEPARATOR ', '
        ) INTO v_orderBy
        FROM (
            SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(v_sort, ',', n), ',', -1)) item
            FROM (
                SELECT 1 n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
            ) x
            WHERE n <= 1 + LENGTH(v_sort) - LENGTH(REPLACE(v_sort, ',', ''))
        ) y;

        IF v_orderBy IS NOT NULL THEN
            SET v_orderBy = CONCAT(' ORDER BY ', v_orderBy);
        END IF;
    END IF;

    IF v_orderBy IS NULL OR v_orderBy = '' THEN
        SET v_orderBy = ' ORDER BY sc.created_date DESC';
    END IF;

    SET @v_sql = CONCAT(
        'SELECT
            sc.salary_composition_id AS SalaryCompositionID,
            sc.salary_composition_code AS SalaryCompositionCode,
            sc.salary_composition_name AS SalaryCompositionName,
            sc.nature AS Nature,
            sc.tax_type AS TaxType,
            sc.is_tax_reduction AS IsTaxReduction,
            sc.norm_formula AS NormFormula,
            sc.allow_over_norm AS AllowOverNorm,
            sc.value_type AS ValueType,
            sc.value_formula AS ValueFormula,
            sc.description AS Description,
            sc.payslip_display_type AS PayslipDisplayType,
            sc.created_source AS CreatedSource,
            sc.status AS Status,
            sc.created_date AS CreatedDate,
            sc.salary_composition_type AS SalaryCompositionType,

            org.organization_ids AS OrganizationIDs,
            org.organization_names AS OrganizationNames,

            CASE sc.nature
                WHEN 1 THEN "Thu nhập"
                WHEN 2 THEN "Khấu trừ"
                WHEN 3 THEN "Khác"
                ELSE "-"
            END AS NatureName,

            CASE sc.tax_type
                WHEN 1 THEN "Chịu thuế"
                WHEN 2 THEN "Miễn thuế toàn phần"
                WHEN 3 THEN "Miễn thuế một phần"
                ELSE "-"
            END AS TaxTypeName,

            CASE
                WHEN sc.tax_type <> 1 THEN "-"
                WHEN sc.is_tax_reduction = 1 THEN "Có"
                ELSE "Không"
            END AS IsTaxReductionName,

            CASE sc.value_type
                WHEN 1 THEN "Số"
                WHEN 2 THEN "Tiền tệ"
                WHEN 3 THEN "Phần trăm"
                WHEN 4 THEN "Chữ"
                WHEN 5 THEN "Ngày"
                ELSE "-"
            END AS ValueTypeName,

            CASE sc.payslip_display_type
                WHEN 1 THEN "Có"
                WHEN 2 THEN "Không"
                WHEN 3 THEN "Chỉ hiển thị nếu giá trị khác 0"
                ELSE "-"
            END AS PayslipDisplayTypeName,

            CASE
                WHEN sc.value_formula IS NULL OR sc.value_formula = "" THEN "-"
                WHEN JSON_VALID(sc.value_formula) = 1 THEN "-"
                ELSE sc.value_formula
            END AS ValueFormulaDisplay,

            CASE sc.created_source
                WHEN 1 THEN "Tự thêm"
                WHEN 2 THEN "Mặc định"
                ELSE "-"
            END AS CreatedSourceName,

            CASE sc.status
                WHEN 1 THEN "Đang theo dõi"
                WHEN 0 THEN "Ngừng theo dõi"
                ELSE "-"
            END AS StatusName

        FROM pa_salary_composition sc

        LEFT JOIN (
            SELECT
                sco.salary_composition_id,
                GROUP_CONCAT(o.organization_id ORDER BY o.sort_order ASC SEPARATOR ";") AS organization_ids,
                GROUP_CONCAT(o.organization_name ORDER BY o.sort_order ASC SEPARATOR "; ") AS organization_names
            FROM pa_salary_composition_organization sco
            INNER JOIN pa_organization o
                ON sco.organization_id = o.organization_id
            GROUP BY sco.salary_composition_id
        ) org
            ON sc.salary_composition_id = org.salary_composition_id ',

        v_where,
        v_orderBy,
        ' LIMIT ', v_offset, ',', v_pageSize
    );

    SET @v_sqlCount = CONCAT(
        'SELECT COUNT(*) AS Total
        FROM pa_salary_composition sc

        LEFT JOIN (
            SELECT
                sco.salary_composition_id,
                GROUP_CONCAT(o.organization_id ORDER BY o.sort_order ASC SEPARATOR ";") AS organization_ids,
                GROUP_CONCAT(o.organization_name ORDER BY o.sort_order ASC SEPARATOR "; ") AS organization_names
            FROM pa_salary_composition_organization sco
            INNER JOIN pa_organization o
                ON sco.organization_id = o.organization_id
            GROUP BY sco.salary_composition_id
        ) org
            ON sc.salary_composition_id = org.salary_composition_id ',

        v_where
    );

    PREPARE stmt1 FROM @v_sql;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;

    PREPARE stmt2 FROM @v_sqlCount;
    EXECUTE stmt2;
    DEALLOCATE PREPARE stmt2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_SalaryComposition_GetDetailById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_SalaryComposition_GetDetailById`(
    IN v_SalaryCompositionID CHAR(36)
)
BEGIN
    SELECT
        sc.salary_composition_id AS SalaryCompositionID,
            sc.salary_composition_code AS SalaryCompositionCode,
            sc.salary_composition_name AS SalaryCompositionName,
            sc.nature AS Nature,
            sc.tax_type AS TaxType,
            sc.is_tax_reduction AS IsTaxReduction,
            sc.norm_formula AS NormFormula,
            sc.allow_over_norm AS AllowOverNorm,
            sc.value_type AS ValueType,
            sc.value_formula AS ValueFormula,
            sc.description AS Description,
            sc.payslip_display_type AS PayslipDisplayType,
            sc.created_source AS CreatedSource,
            sc.status AS Status,
            sc.created_date AS CreatedDate,
            sc.salary_composition_type AS SalaryCompositionType,

        org.organization_ids AS OrganizationIDs,
        org.organization_names AS OrganizationNames,

        CASE sc.nature
            WHEN 1 THEN "Thu nhập"
            WHEN 2 THEN "Khấu trừ"
            WHEN 3 THEN "Khác"
            ELSE "-"
        END AS NatureName,

        CASE sc.tax_type
            WHEN 1 THEN "Chịu thuế"
            WHEN 2 THEN "Miễn thuế toàn phần"
            WHEN 3 THEN "Miễn thuế một phần"
            ELSE "-"
        END AS TaxTypeName,

        CASE
            WHEN sc.tax_type <> 1 THEN "-"
            WHEN sc.is_tax_reduction = 1 THEN "Có"
            ELSE "Không"
        END AS IsTaxReductionName,

        CASE sc.value_type
            WHEN 1 THEN "Số"
            WHEN 2 THEN "Tiền tệ"
            WHEN 3 THEN "Phần trăm"
            WHEN 4 THEN "Chữ"
            WHEN 5 THEN "Ngày"
            ELSE "-"
        END AS ValueTypeName,

        CASE sc.payslip_display_type
            WHEN 1 THEN "Có"
            WHEN 2 THEN "Không"
            WHEN 3 THEN "Chỉ hiển thị nếu giá trị khác 0"
            ELSE "-"
        END AS PayslipDisplayTypeName,

        CASE sc.created_source
            WHEN 1 THEN "Tự thêm"
            WHEN 2 THEN "Mặc định"
            ELSE "-"
        END AS CreatedSourceName,

        CASE sc.status
            WHEN 1 THEN "Đang theo dõi"
            WHEN 0 THEN "Ngừng theo dõi"
            ELSE "-"
        END AS StatusName

    FROM pa_salary_composition sc

    LEFT JOIN (
        SELECT
            sco.salary_composition_id,
            GROUP_CONCAT(o.organization_id ORDER BY o.sort_order ASC SEPARATOR ";") AS organization_ids,
            GROUP_CONCAT(o.organization_name ORDER BY o.sort_order ASC SEPARATOR "; ") AS organization_names
        FROM pa_salary_composition_organization sco
        INNER JOIN pa_organization o
            ON sco.organization_id = o.organization_id
        GROUP BY sco.salary_composition_id
    ) org
        ON sc.salary_composition_id = org.salary_composition_id

    WHERE sc.salary_composition_id COLLATE utf8mb4_general_ci
        = v_SalaryCompositionID COLLATE utf8mb4_general_ci;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_SalaryComposition_Patch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_SalaryComposition_Patch`(
    IN v_SalaryCompositionID CHAR(36),
    IN v_SalaryCompositionName VARCHAR(255),
    IN v_OrganizationIDs TEXT,
    IN v_SalaryCompositionType INT,
    IN v_Nature INT,
    IN v_TaxType INT,
    IN v_IsTaxReduction TINYINT,
    IN v_NormFormula TEXT,
    IN v_AllowOverNorm TINYINT,
    IN v_ValueType INT,
    IN v_ValueFormula TEXT,
    IN v_Description TEXT,
    IN v_PayslipDisplayType INT,
    IN v_Status INT
)
BEGIN
    DECLARE v_exists INT DEFAULT 0;
    DECLARE v_item CHAR(36);
    DECLARE v_pos INT DEFAULT 0;
    DECLARE v_ids TEXT;

    SELECT COUNT(1)
    INTO v_exists
    FROM pa_salary_composition
    WHERE salary_composition_id = v_SalaryCompositionID;

    IF v_exists = 0 THEN
        SELECT 0 AS Updated;
    ELSE
        UPDATE pa_salary_composition
        SET
            salary_composition_name = IF(v_SalaryCompositionName IS NULL, salary_composition_name, v_SalaryCompositionName),
            salary_composition_type = IF(v_SalaryCompositionType IS NULL, salary_composition_type, v_SalaryCompositionType),
            nature = IF(v_Nature IS NULL, nature, v_Nature),
            tax_type = IF(v_TaxType IS NULL, tax_type, v_TaxType),
            is_tax_reduction = IF(v_IsTaxReduction IS NULL, is_tax_reduction, v_IsTaxReduction),
            norm_formula = IF(v_NormFormula IS NULL, norm_formula, v_NormFormula),
            allow_over_norm = IF(v_AllowOverNorm IS NULL, allow_over_norm, v_AllowOverNorm),
            value_type = IF(v_ValueType IS NULL, value_type, v_ValueType),
            value_formula = IF(v_ValueFormula IS NULL, value_formula, v_ValueFormula),
            description = IF(v_Description IS NULL, description, v_Description),
            payslip_display_type = IF(v_PayslipDisplayType IS NULL, payslip_display_type, v_PayslipDisplayType),
            status = IF(v_Status IS NULL, status, v_Status)
        WHERE salary_composition_id = v_SalaryCompositionID;

        IF v_OrganizationIDs IS NOT NULL THEN
            DELETE FROM pa_salary_composition_organization
            WHERE salary_composition_id = v_SalaryCompositionID;

            SET v_ids = v_OrganizationIDs;

            WHILE v_ids IS NOT NULL AND v_ids <> '' DO
                SET v_pos = LOCATE(';', v_ids);

                IF v_pos > 0 THEN
                    SET v_item = TRIM(SUBSTRING(v_ids, 1, v_pos - 1));
                    SET v_ids = SUBSTRING(v_ids, v_pos + 1);
                ELSE
                    SET v_item = TRIM(v_ids);
                    SET v_ids = '';
                END IF;

                IF v_item IS NOT NULL AND v_item <> '' THEN
                    INSERT IGNORE INTO pa_salary_composition_organization
                    (
                        salary_composition_organization_id,
                        salary_composition_id,
                        organization_id
                    )
                    VALUES
                    (
                        UUID(),
                        v_SalaryCompositionID,
                        v_item
                    );
                END IF;
            END WHILE;
        END IF;

        SELECT 1 AS Updated;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_UpdateGridConfig` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_UpdateGridConfig`(
    IN v_GridConfigID CHAR(36),
    IN v_GridKey VARCHAR(100),
    IN v_FieldName VARCHAR(100),
    IN v_Caption VARCHAR(255),

    IN v_Width INT,
    IN v_Visible TINYINT,
    IN v_IsFixed TINYINT,
    IN v_FixedPosition VARCHAR(10),

    IN v_AllowSorting TINYINT,

    IN v_SortOrder INT
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pa_grid_config
        WHERE grid_config_id COLLATE utf8mb4_general_ci = v_GridConfigID COLLATE utf8mb4_general_ci
         
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cấu hình cột không tồn tại';
    END IF;

    IF EXISTS (
        SELECT 1 FROM pa_grid_config
        WHERE grid_key COLLATE utf8mb4_general_ci = v_GridKey COLLATE utf8mb4_general_ci
          AND field_name COLLATE utf8mb4_general_ci = v_FieldName COLLATE utf8mb4_general_ci
          AND grid_config_id COLLATE utf8mb4_general_ci <> v_GridConfigID COLLATE utf8mb4_general_ci
         
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cấu hình cột đã tồn tại';
    END IF;

    UPDATE pa_grid_config
    SET grid_key = v_GridKey,
        field_name = v_FieldName,
        caption = v_Caption,

        width = IFNULL(v_Width, 150),
        visible = IFNULL(v_Visible, 1),
        is_fixed = IFNULL(v_IsFixed, 0),
        fixed_position = v_FixedPosition,

        allow_sorting = IFNULL(v_AllowSorting, 1),

        sort_order = IFNULL(v_SortOrder, 0)
    WHERE grid_config_id COLLATE utf8mb4_general_ci = v_GridConfigID COLLATE utf8mb4_general_ci;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_UpdateOrganization` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_UpdateOrganization`(
    IN v_OrganizationID CHAR(36),
    IN v_OrganizationCode VARCHAR(50),
    IN v_OrganizationName VARCHAR(255),
    IN v_ParentID CHAR(36),
    IN v_SortOrder INT
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pa_organization
        WHERE organization_id COLLATE utf8mb4_general_ci = v_OrganizationID COLLATE utf8mb4_general_ci
         
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Đơn vị không tồn tại';
    END IF;

    IF EXISTS (
        SELECT 1 FROM pa_organization
        WHERE organization_code COLLATE utf8mb4_general_ci = v_OrganizationCode COLLATE utf8mb4_general_ci
          AND organization_id COLLATE utf8mb4_general_ci <> v_OrganizationID COLLATE utf8mb4_general_ci
         
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mã đơn vị đã tồn tại';
    END IF;

    UPDATE pa_organization
    SET organization_code = v_OrganizationCode,
        organization_name = v_OrganizationName,
        parent_id = v_ParentID,
        sort_order = IFNULL(v_SortOrder, 0)
    WHERE organization_id COLLATE utf8mb4_general_ci = v_OrganizationID COLLATE utf8mb4_general_ci;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_UpdateSalaryComposition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_UpdateSalaryComposition`(
    IN v_SalaryCompositionID CHAR(36),
    IN v_SalaryCompositionCode VARCHAR(255),
    IN v_SalaryCompositionName VARCHAR(255),

    IN v_OrganizationIDs TEXT,
    IN v_SalaryCompositionType INT,
    IN v_Nature INT,
    IN v_TaxType INT,
    IN v_IsTaxReduction TINYINT,
    IN v_NormFormula TEXT,
    IN v_AllowOverNorm TINYINT,
    IN v_ValueType INT,
    IN v_ValueFormula TEXT,
    IN v_Description TEXT,
    IN v_PayslipDisplayType INT,
    IN v_CreatedSource INT,
    IN v_Status INT
)
BEGIN
    DECLARE v_item VARCHAR(50);
    DECLARE v_pos INT DEFAULT 0;
    DECLARE v_ids TEXT;

    IF NOT EXISTS (
        SELECT 1
        FROM pa_salary_composition
        WHERE salary_composition_id = v_SalaryCompositionID
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Thành phần lương không tồn tại';
    END IF;

    IF EXISTS (
        SELECT 1
        FROM pa_salary_composition
        WHERE salary_composition_code COLLATE utf8mb4_general_ci
            = v_SalaryCompositionCode COLLATE utf8mb4_general_ci
          AND salary_composition_id <> v_SalaryCompositionID
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Mã thành phần đã tồn tại';
    END IF;

    UPDATE pa_salary_composition
    SET
        salary_composition_code = v_SalaryCompositionCode,
        salary_composition_name = v_SalaryCompositionName,

        salary_composition_type = v_SalaryCompositionType,
        nature = v_Nature,
        tax_type = v_TaxType,
        is_tax_reduction = v_IsTaxReduction,
        norm_formula = v_NormFormula,
        allow_over_norm = IFNULL(v_AllowOverNorm, 0),
        value_type = IFNULL(v_ValueType, 1),
        value_formula = v_ValueFormula,
        description = v_Description,
        payslip_display_type = IFNULL(v_PayslipDisplayType, 1),
        created_source = IFNULL(v_CreatedSource, 1),
        status = IFNULL(v_Status, 1)
    WHERE salary_composition_id = v_SalaryCompositionID;

    DELETE FROM pa_salary_composition_organization
    WHERE salary_composition_id = v_SalaryCompositionID;

    SET v_ids = v_OrganizationIDs;

    IF v_ids IS NULL OR v_ids = '' THEN
        SET v_ids = '';
    END IF;

    WHILE v_ids IS NOT NULL AND v_ids <> '' DO
        SET v_pos = LOCATE(';', v_ids);

        IF v_pos > 0 THEN
            SET v_item = TRIM(SUBSTRING(v_ids, 1, v_pos - 1));
            SET v_ids = SUBSTRING(v_ids, v_pos + 1);
        ELSE
            SET v_item = TRIM(v_ids);
            SET v_ids = '';
        END IF;

        IF v_item IS NOT NULL AND v_item <> '' THEN
            INSERT IGNORE INTO pa_salary_composition_organization
            (
                salary_composition_organization_id,
                salary_composition_id,
                organization_id
            )
            VALUES
            (
                UUID(),
                v_SalaryCompositionID,
                v_item
            );
        END IF;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proc_UpdateSalaryCompositionSystem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_UpdateSalaryCompositionSystem`(
    IN v_SalaryCompositionSystemID CHAR(36),
    IN v_SalaryCompositionCode VARCHAR(255),
    IN v_SalaryCompositionName VARCHAR(255),
    IN v_SalaryCompositionType INT,
    IN v_Nature INT,
    IN v_TaxType INT,
    IN v_IsTaxReduction TINYINT,
    IN v_NormFormula TEXT,
    IN v_AllowOverNorm TINYINT,
    IN v_ValueType INT,
    IN v_ValueFormula TEXT,
    IN v_Description TEXT,
    IN v_PayslipDisplayType INT
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pa_salary_composition_system
        WHERE salary_composition_system_id COLLATE utf8mb4_general_ci = v_SalaryCompositionSystemID COLLATE utf8mb4_general_ci
         
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Thành phần hệ thống không tồn tại';
    END IF;

    IF EXISTS (
        SELECT 1 FROM pa_salary_composition_system
        WHERE salary_composition_code COLLATE utf8mb4_general_ci = v_SalaryCompositionCode COLLATE utf8mb4_general_ci
          AND salary_composition_system_id COLLATE utf8mb4_general_ci <> v_SalaryCompositionSystemID COLLATE utf8mb4_general_ci
         
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mã thành phần hệ thống đã tồn tại';
    END IF;

    UPDATE pa_salary_composition_system
    SET salary_composition_code = v_SalaryCompositionCode,
        salary_composition_name = v_SalaryCompositionName,
        salary_composition_type = v_SalaryCompositionType,
        nature = v_Nature,
        tax_type = IFNULL(v_TaxType, 1),
        is_tax_reduction = IFNULL(v_IsTaxReduction, 0),
        norm_formula = v_NormFormula,
        allow_over_norm = IFNULL(v_AllowOverNorm, 0),
        value_type = IFNULL(v_ValueType, 1),
        value_formula = v_ValueFormula,
        description = v_Description,
        payslip_display_type = IFNULL(v_PayslipDisplayType, 1)
    WHERE salary_composition_system_id COLLATE utf8mb4_general_ci = v_SalaryCompositionSystemID COLLATE utf8mb4_general_ci;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-11 23:07:30
