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
INSERT INTO `pa_grid_config` VALUES ('eba8c59c-55c6-11f1-bd41-088fc372284f','salary_composition','SalaryCompositionCode','Mã thành phần',200,1,0,NULL,1,1,'2026-05-22 22:11:31'),('eba8ce2b-55c6-11f1-bd41-088fc372284f','salary_composition','SalaryCompositionName','Tên thành phần',200,1,0,NULL,1,2,'2026-05-22 22:11:31'),('eba8cf84-55c6-11f1-bd41-088fc372284f','salary_composition','OrganizationNames','Đơn vị áp dụng',200,1,0,NULL,1,4,'2026-05-22 22:11:31'),('eba8d044-55c6-11f1-bd41-088fc372284f','salary_composition','salaryCompositionType','Loại thành phần',200,1,0,NULL,1,3,'2026-05-22 22:11:31'),('eba8d0d9-55c6-11f1-bd41-088fc372284f','salary_composition','Nature','Tính chất',200,1,0,NULL,1,5,'2026-05-22 22:11:31'),('eba8d15e-55c6-11f1-bd41-088fc372284f','salary_composition','TaxType','Chịu thuế',200,1,0,NULL,1,6,'2026-05-22 22:11:31'),('eba8d1ed-55c6-11f1-bd41-088fc372284f','salary_composition','IsTaxReduction','Giảm trừ khi tính thuế',200,1,0,NULL,1,7,'2026-05-22 22:11:31'),('eba8d274-55c6-11f1-bd41-088fc372284f','salary_composition','NormFormula','Định mức',200,1,0,NULL,1,8,'2026-05-22 22:11:31'),('eba8d3b0-55c6-11f1-bd41-088fc372284f','salary_composition','ValueType','Kiểu giá trị',200,1,0,NULL,1,9,'2026-05-22 22:11:31'),('eba8d4a4-55c6-11f1-bd41-088fc372284f','salary_composition','ValueFormula','Giá trị',200,1,0,NULL,1,10,'2026-05-22 22:11:31'),('eba8d564-55c6-11f1-bd41-088fc372284f','salary_composition','Description','Mô tả',200,1,0,NULL,1,11,'2026-05-22 22:11:31'),('eba8d6f8-55c6-11f1-bd41-088fc372284f','salary_composition','PayslipDisplayType','Hiển thị trên phiếu lương',200,1,0,NULL,1,12,'2026-05-22 22:11:31'),('eba8d79e-55c6-11f1-bd41-088fc372284f','salary_composition','CreatedSource','Nguồn tạo',200,1,0,NULL,1,13,'2026-05-22 22:11:31'),('eba8d82d-55c6-11f1-bd41-088fc372284f','salary_composition','Status','Trạng thái',200,1,0,NULL,1,14,'2026-05-22 22:11:31'),('fb69357c-5a4f-11f1-bd41-088fc372284f','salary_composition_system','SalaryCompositionCode','Mã thành phần',200,1,0,NULL,1,1,'2026-05-28 11:44:59'),('fb6966f6-5a4f-11f1-bd41-088fc372284f','salary_composition_system','SalaryCompositionName','Tên thành phần',200,1,0,NULL,1,2,'2026-05-28 11:44:59'),('fb6970c7-5a4f-11f1-bd41-088fc372284f','salary_composition_system','salaryCompositionType','Loại thành phần',200,1,0,NULL,1,3,'2026-05-28 11:44:59'),('fb697bba-5a4f-11f1-bd41-088fc372284f','salary_composition_system','Nature','Tính chất',200,1,0,NULL,1,4,'2026-05-28 11:44:59'),('fb6993c8-5a4f-11f1-bd41-088fc372284f','salary_composition_system','TaxType','Chịu thuế',200,1,0,NULL,1,5,'2026-05-28 11:44:59'),('fb699565-5a4f-11f1-bd41-088fc372284f','salary_composition_system','IsTaxReduction','Giảm trừ khi tính thuế',200,1,0,NULL,1,6,'2026-05-28 11:44:59'),('fb699646-5a4f-11f1-bd41-088fc372284f','salary_composition_system','NormFormula','Định mức',200,1,0,NULL,1,7,'2026-05-28 11:44:59'),('fb699725-5a4f-11f1-bd41-088fc372284f','salary_composition_system','AllowOverNorm','Cho phép vượt định mức',200,1,0,NULL,1,8,'2026-05-28 11:44:59'),('fb699821-5a4f-11f1-bd41-088fc372284f','salary_composition_system','ValueType','Kiểu giá trị',200,1,0,NULL,1,9,'2026-05-28 11:44:59'),('fb699f54-5a4f-11f1-bd41-088fc372284f','salary_composition_system','ValueFormula','Giá trị/Công thức',200,1,0,NULL,1,10,'2026-05-28 11:44:59'),('fb69a104-5a4f-11f1-bd41-088fc372284f','salary_composition_system','Description','Mô tả',200,1,0,NULL,1,11,'2026-05-28 11:44:59'),('fb69ae26-5a4f-11f1-bd41-088fc372284f','salary_composition_system','PayslipDisplayType','Hiển thị trên phiếu lương',200,1,0,NULL,1,12,'2026-05-28 11:44:59');
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
INSERT INTO `pa_salary_composition` VALUES ('526f372b-5e55-11f1-bd41-088fc372284f','LUONG_CO_BAN)','Lương cơ bản',2,2,1,0,'',0,1,NULL,NULL,1,2,1,'2026-06-02 14:33:17'),('599d4136-598e-11f1-bd41-088fc372284f','LUONG_CB_01','Lương cơ bản miền Bắc',4,1,1,0,NULL,0,1,NULL,'Lương cơ bản CN miền Bắc',1,1,0,'2026-05-27 12:38:54'),('599d7709-598e-11f1-bd41-088fc372284f','LUONG_CB_02','Lương cơ bản miền Nam',5,1,1,0,NULL,0,1,NULL,'Lương cơ bản CN miền Nam',1,1,0,'2026-05-27 12:38:54'),('599d8ad7-598e-11f1-bd41-088fc372284f','LUONG_KD_BAC','Lương kinh doanh Bắc',6,1,1,0,NULL,0,1,NULL,'Lương TTKD Bắc',1,1,1,'2026-05-27 12:38:54'),('599d8c56-598e-11f1-bd41-088fc372284f','LUONG_KD_NAM','Lương kinh doanh Nam',8,1,1,0,NULL,0,1,NULL,'Lương TTKD Nam',1,1,0,'2026-05-27 12:38:54'),('599d8d63-598e-11f1-bd41-088fc372284f','KPI_BAC_01','KPI miền Bắc',5,1,1,0,NULL,0,3,NULL,'KPI chi nhánh Bắc',1,1,0,'2026-05-27 12:38:54'),('599d9783-598e-11f1-bd41-088fc372284f','KPI_NAM_01','KPI miền Nam',2,1,1,0,NULL,0,3,NULL,'KPI chi nhánh Nam',1,1,1,'2026-05-27 12:38:54'),('599d994f-598e-11f1-bd41-088fc372284f','KPI_KD_BAC','KPI trung tâm KD Bắc',9,1,1,NULL,'',0,3,'=SUM(1111111A,2312A)','KPI kinh doanh',1,1,1,'2026-05-27 12:38:54'),('599d9a31-598e-11f1-bd41-088fc372284f','KPI_KD_NAM','KPI trung tâm KD Nam',2,1,1,0,NULL,0,3,NULL,'KPI kinh doanh',1,1,0,'2026-05-27 12:38:54'),('599d9b05-598e-11f1-bd41-088fc372284f','SALE_BAC_01','Doanh số miền Bắc',3,1,1,0,NULL,0,2,NULL,'Doanh số CN Bắc',1,1,1,'2026-05-27 12:38:54'),('599d9bd2-598e-11f1-bd41-088fc372284f','SALE_NAM_01','Doanh số miền Nam',5,1,1,0,NULL,0,2,NULL,'Doanh số CN Nam',1,1,1,'2026-05-27 12:38:54'),('599d9cbd-598e-11f1-bd41-088fc372284f','SALE_KD_BAC','Doanh số KD Bắc',9,1,1,0,NULL,0,2,NULL,'Doanh số trung tâm KD Bắc',1,1,1,'2026-05-27 12:38:54'),('599da0ac-598e-11f1-bd41-088fc372284f','PIT_BAC','Thuế TNCN Bắc',4,2,1,0,NULL,0,4,'=LUONG*0.1','Thuế TNCN CN Bắc',1,2,1,'2026-05-27 12:38:54'),('599da2e1-598e-11f1-bd41-088fc372284f','PIT_NAM','Thuế TNCN Nam',1,2,NULL,0,'',0,2,'=LUONG*0.1','Thuế TNCN CN Nam',1,2,1,'2026-05-27 12:38:54'),('599da3de-598e-11f1-bd41-088fc372284f','BHXH_BAC','BHXH miền Bắc',3,2,NULL,0,'',0,4,'=LUONG*0.08','BHXH CN Bắc',1,2,1,'2026-05-27 12:38:54'),('599da4b5-598e-11f1-bd41-088fc372284f','BHXH_NAM','BHXH miền Nam',6,2,2,0,NULL,0,4,'=LUONG*0.08','BHXH CN Nam',1,2,1,'2026-05-27 12:38:54'),('599da594-598e-11f1-bd41-088fc372284f','BHYT_BAC','BHYT miền Bắc1',4,2,NULL,0,'',0,2,'=LUONG*0.015','BHYT CN Bắc',1,2,1,'2026-05-27 12:38:54'),('599da658-598e-11f1-bd41-088fc372284f','BHYT_NAM','BHYT miền Nam',4,2,2,0,NULL,0,4,'=LUONG*0.015','BHYT CN Nam',1,2,1,'2026-05-27 12:38:54'),('599da715-598e-11f1-bd41-088fc372284f','CC_BAC','Chấm công Bắc',4,1,1,0,NULL,0,2,NULL,'Chấm công CN Bắc',1,1,1,'2026-05-27 12:38:54'),('599db555-598e-11f1-bd41-088fc372284f','CC_NAM','Chấm công Nam',4,1,1,0,NULL,0,2,NULL,'Chấm công CN Nam',1,1,1,'2026-05-27 12:38:54'),('599db6ab-598e-11f1-bd41-088fc372284f','EMP_INFO_01','Thông tin nhân viên Bắc',6,1,1,0,NULL,0,1,NULL,'Thông tin nhân viên CN Bắc',1,1,1,'2026-05-27 12:38:54'),('599dbeeb-598e-11f1-bd41-088fc372284f','EMP_INFO_02','Thông tin nhân viên Nam',5,1,1,0,NULL,0,1,NULL,'Thông tin nhân viên CN Nam',1,1,1,'2026-05-27 12:38:54'),('599dbffa-598e-11f1-bd41-088fc372284f','OTHER_01','Khác 01',4,1,1,0,NULL,0,1,NULL,'Khác hệ thống',1,1,1,'2026-05-27 12:38:54'),('599dc164-598e-11f1-bd41-088fc372284f','OTHER_02','Khác 02',2,1,1,0,NULL,0,1,NULL,'Khác sản xuất',1,1,1,'2026-05-27 12:38:54'),('602232f6-99fa-4a98-ac4f-5537fecc9b8b','LUONG_CO_BAN_4','Lương cơ bản3',5,2,1,0,NULL,0,1,NULL,NULL,1,1,1,'2026-05-23 14:30:29'),('68f24820-0fcb-49f4-8a64-d66524c0cab6','LUONG_CO_BAN_2','Lương cơ bản',5,0,1,0,NULL,0,1,NULL,NULL,1,1,1,'2026-05-23 13:42:26'),('6b42e7ab-4130-45ca-a829-3eaac0b0e1e9','LUONG_CO_BAN_13','Lương cơ bản5',3,1,3,0,NULL,0,1,NULL,NULL,1,1,1,'2026-05-28 16:03:03'),('7d0fb59b-5e92-11f1-bd41-088fc372284f','CC_DI_LAM','Số ngày đi làm',5,3,NULL,0,'',0,1,'','Chấm công',1,2,1,'2026-06-02 21:51:08'),('7f7a84eb-5e60-11f1-bd41-088fc372284f','BHYT','Bảo hiểm y tế',5,2,2,0,'',0,4,'=LUONG_DONG_BH*0.015',NULL,1,2,1,'2026-06-02 15:53:17'),('880e8400-e29b-41d4-a716-446655440001','LUONG_CO_BAN','Lương cơ bản',9,1,1,0,NULL,0,1,NULL,NULL,1,2,1,'2026-05-23 01:02:03'),('880e8400-e29b-41d4-a716-446655440002','BHXH','Bảo hiểm xã hội',3,2,2,0,NULL,0,4,'=LUONG_DONG_BH*0.08',NULL,1,2,0,'2026-05-23 01:02:03'),('880e8400-e29b-41d4-a716-446655440003','THUE_TNCN','Thuế TNCN',3,2,2,0,NULL,0,4,'=THUE_TNCN',NULL,1,2,1,'2026-05-23 01:02:03'),('880e8400-e29b-41d4-a716-446655440004','DOANH_THU','Doanh thu',8,1,1,0,NULL,0,1,NULL,NULL,1,1,1,'2026-05-23 01:02:03'),('880e8400-e29b-41d4-a716-446655440005','KPI_THANG','KPI tháng',7,1,1,0,NULL,0,3,NULL,NULL,1,1,0,'2026-05-23 01:02:03'),('af08f96c-1d5b-4162-a217-8124932e97aa','BHNT','Bảo hiểm nhân thọ',1,2,NULL,NULL,'',0,2,'=Sum(Lương,BHXH)','Bảo hiểm nhân thọ',1,1,1,'2026-06-04 08:46:21'),('b5770a94-e014-4294-bf0b-0fa665cf2a89','BHXH_3','Bảo hiểm xã hội',1,2,NULL,NULL,'',0,2,'{\"mode\":\"auto_sum\",\"scope\":\"organization_level\",\"level\":3,\"salaryCode\":\"LUONG_CO_BAN\"}','Bảo hiểm xã hội',1,1,0,'2026-06-03 18:19:40'),('bc6dbc10-13c9-493b-87f2-b8e561b84f3d','1111A','1111a',4,3,NULL,NULL,'',0,2,'','',1,1,1,'2026-06-02 21:47:01'),('c0dda887-c80b-4680-b07e-1a510f9d7924','BHXH_1','Bảo hiểm xã hội',4,2,2,0,'',0,2,'{\"mode\":\"auto_sum\",\"scope\":\"organization_level\",\"level\":3,\"salaryCode\":\"LUONG_CO_BAN\"}','Bảo hiểm xã hội',1,1,0,'2026-06-01 16:18:19'),('c1b96cd9-9f53-4b69-83a9-0046776eb8f3','LUONG_CO_BAN_9','Lương',3,1,1,0,NULL,0,1,NULL,NULL,1,1,1,'2026-05-28 11:13:41'),('e050a6bd-5f43-11f1-bd41-088fc372284f','PRODUCT_01','Sản lượng sản phẩm A',4,1,NULL,0,'',0,1,'','Sản phẩm',1,2,1,'2026-06-03 19:00:55'),('ee96a78a-5e57-11f1-bd41-088fc372284f','BHYT_2','Bảo hiểm y tế',2,2,2,0,'',0,2,'','Bảo hiểm',1,2,0,'2026-06-02 14:51:58');
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
INSERT INTO `pa_salary_composition_organization` VALUES ('08caf0a4-5a74-11f1-bd41-088fc372284f','6b42e7ab-4130-45ca-a829-3eaac0b0e1e9','550e8400-e29b-41d4-a716-446655440001','2026-05-28 16:03:03'),('1ce92ece-5f3e-11f1-bd41-088fc372284f','b5770a94-e014-4294-bf0b-0fa665cf2a89','550e8400-e29b-41d4-a716-446655440001','2026-06-03 18:19:40'),('1ce96438-5f3e-11f1-bd41-088fc372284f','b5770a94-e014-4294-bf0b-0fa665cf2a89','550e8400-e29b-41d4-a716-446655440003','2026-06-03 18:19:40'),('2fe1e6ed-5fb7-11f1-bd41-088fc372284f','af08f96c-1d5b-4162-a217-8124932e97aa','550e8400-e29b-41d4-a716-446655440001','2026-06-04 08:46:21'),('5270aa9c-5e55-11f1-bd41-088fc372284f','526f372b-5e55-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-06-02 14:33:17'),('59e17fa8-5dcd-11f1-bd41-088fc372284f','599da2e1-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-06-01 22:19:58'),('63572fe1-5dcd-11f1-bd41-088fc372284f','599da594-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-06-01 22:20:14'),('7d10ce29-5e92-11f1-bd41-088fc372284f','7d0fb59b-5e92-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-06-02 21:51:08'),('7f7b170c-5e60-11f1-bd41-088fc372284f','7f7a84eb-5e60-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-06-02 15:53:17'),('c4a9492e-5de0-11f1-bd41-088fc372284f','599d994f-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440004','2026-06-02 00:38:57'),('cc218728-5a70-11f1-bd41-088fc372284f','599dbffa-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-05-28 15:39:53'),('cc2188d9-5a70-11f1-bd41-088fc372284f','880e8400-e29b-41d4-a716-446655440003','550e8400-e29b-41d4-a716-446655440001','2026-05-28 15:39:53'),('cc218978-5a70-11f1-bd41-088fc372284f','c1b96cd9-9f53-4b69-83a9-0046776eb8f3','550e8400-e29b-41d4-a716-446655440001','2026-05-28 15:39:53'),('cc218afc-5a70-11f1-bd41-088fc372284f','599d9b05-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-05-28 15:39:53'),('cc218b6c-5a70-11f1-bd41-088fc372284f','599da0ac-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-05-28 15:39:53'),('cc218e08-5a70-11f1-bd41-088fc372284f','599da715-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-05-28 15:39:53'),('cc218f07-5a70-11f1-bd41-088fc372284f','599db6ab-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-05-28 15:39:53'),('cc218f89-5a70-11f1-bd41-088fc372284f','602232f6-99fa-4a98-ac4f-5537fecc9b8b','550e8400-e29b-41d4-a716-446655440002','2026-05-28 15:39:53'),('cc218ffd-5a70-11f1-bd41-088fc372284f','880e8400-e29b-41d4-a716-446655440005','550e8400-e29b-41d4-a716-446655440002','2026-05-28 15:39:53'),('cc219074-5a70-11f1-bd41-088fc372284f','599dc164-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440003','2026-05-28 15:39:53'),('cc2190e7-5a70-11f1-bd41-088fc372284f','68f24820-0fcb-49f4-8a64-d66524c0cab6','550e8400-e29b-41d4-a716-446655440003','2026-05-28 15:39:53'),('cc219263-5a70-11f1-bd41-088fc372284f','599d9cbd-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440004','2026-05-28 15:39:53'),('cc2192d6-5a70-11f1-bd41-088fc372284f','880e8400-e29b-41d4-a716-446655440004','550e8400-e29b-41d4-a716-446655440004','2026-05-28 15:39:53'),('cc2194e9-5a70-11f1-bd41-088fc372284f','599d9bd2-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-05-28 15:39:53'),('cc2196e9-5a70-11f1-bd41-088fc372284f','599da4b5-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-05-28 15:39:53'),('cc21977d-5a70-11f1-bd41-088fc372284f','599da658-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-05-28 15:39:53'),('cc2197ef-5a70-11f1-bd41-088fc372284f','599db555-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-05-28 15:39:53'),('cc219891-5a70-11f1-bd41-088fc372284f','599dbeeb-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-05-28 15:39:53'),('cc219944-5a70-11f1-bd41-088fc372284f','880e8400-e29b-41d4-a716-446655440002','550e8400-e29b-41d4-a716-446655440006','2026-05-28 15:39:53'),('cc219b52-5a70-11f1-bd41-088fc372284f','880e8400-e29b-41d4-a716-446655440001','550e8400-e29b-41d4-a716-446655440007','2026-05-28 15:39:53'),('d4813c90-5d9a-11f1-bd41-088fc372284f','c0dda887-c80b-4680-b07e-1a510f9d7924','550e8400-e29b-41d4-a716-446655440001','2026-06-01 16:18:19'),('d48172f6-5d9a-11f1-bd41-088fc372284f','c0dda887-c80b-4680-b07e-1a510f9d7924','550e8400-e29b-41d4-a716-446655440003','2026-06-01 16:18:19'),('e0513b9f-5f43-11f1-bd41-088fc372284f','e050a6bd-5f43-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-06-03 19:00:55'),('e8567357-5a73-11f1-bd41-088fc372284f','599d4136-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-05-28 16:02:09'),('e85674eb-5a73-11f1-bd41-088fc372284f','599d4136-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440003','2026-05-28 16:02:09'),('e8567666-5a73-11f1-bd41-088fc372284f','599d4136-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440005','2026-05-28 16:02:09'),('e8567843-5a73-11f1-bd41-088fc372284f','599d7709-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-05-28 16:02:09'),('e85679b0-5a73-11f1-bd41-088fc372284f','599d7709-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440007','2026-05-28 16:02:09'),('e8567b38-5a73-11f1-bd41-088fc372284f','599d8ad7-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440004','2026-05-28 16:02:09'),('e8567c9b-5a73-11f1-bd41-088fc372284f','599d8ad7-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-05-28 16:02:09'),('e8567fda-5a73-11f1-bd41-088fc372284f','599d8c56-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440007','2026-05-28 16:02:09'),('e85681df-5a73-11f1-bd41-088fc372284f','599d8c56-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-05-28 16:02:09'),('e8568358-5a73-11f1-bd41-088fc372284f','599d8d63-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-05-28 16:02:09'),('e856849b-5a73-11f1-bd41-088fc372284f','599d8d63-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440003','2026-05-28 16:02:09'),('e8568646-5a73-11f1-bd41-088fc372284f','599d8d63-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440004','2026-05-28 16:02:09'),('e8568872-5a73-11f1-bd41-088fc372284f','599d9783-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440006','2026-05-28 16:02:09'),('e8568b92-5a73-11f1-bd41-088fc372284f','599d9783-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440007','2026-05-28 16:02:09'),('e8568ee2-5a73-11f1-bd41-088fc372284f','599d9a31-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440007','2026-05-28 16:02:09'),('e9dbc894-5e91-11f1-bd41-088fc372284f','bc6dbc10-13c9-493b-87f2-b8e561b84f3d','550e8400-e29b-41d4-a716-446655440001','2026-06-02 21:47:01'),('ea7f067e-5dcc-11f1-bd41-088fc372284f','599da3de-598e-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440002','2026-06-01 22:16:51'),('ee973fc8-5e57-11f1-bd41-088fc372284f','ee96a78a-5e57-11f1-bd41-088fc372284f','550e8400-e29b-41d4-a716-446655440001','2026-06-02 14:51:58');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-04 11:11:38
