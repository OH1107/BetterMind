-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 13.124.26.183    Database: ssafy_web_db
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

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
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` tinyblob,
  `count` int NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isactive` bit(1) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` int NOT NULL,
  `report` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKda0cnp1fv0puba3w22or6xkpo` (`user_id`),
  CONSTRAINT `FKda0cnp1fv0puba3w22or6xkpo` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (3,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0중독',0,'2021-08-20/2021-10-20','위대한 가능성과 실현의 과정을 함께하는 \'위드코치\' 입니다.',_binary '\0','내 안에 있는 변화의 가능성',35000,'#중독 #변화 #적응 #자조모임도움 #일상생활복귀','월,수,금/10:00~12:00','0',13),(4,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0중독',10,'2021-08-20/2021-09-20','표현하는 것 만으로도 마음은 가벼워집니다. 함께하며 경청하겠습니다.',_binary '\0','같은 경험의 그룹 표현',10000,'지금 무엇보다도 필요한 것은 표현입니다. 마음 속에 담아둔 고민들을 털어 보세요. 한껏 가벼워질 수 있습니다.','화,목/19:30~21:00','1',13),(6,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0취업진로',8,'2021-08-23/2021-08-27','아츠에듀 대표이사, 한국생산본부 취업분야 강사, 피플인HR 전략사업본부 대학사업팀, 아이스넛 커리어 인재개발사업부 컨설팅팀 팀장',_binary '','면접전형의 이해',139000,'면접전형 진행 절차, 면접  유형별 실무면접, 임원면접, PT, 토론, AI 등','월,수,금/19:00~20:00','1',15),(7,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0일반고민',0,'2021-08-17/2021-09-17','당신의 힘든 순간을 따뜻하고 진솔한 마음으로 힘껏 돕겠습니다.',_binary '\0','어려움을 해결하는 과정을 함께하는 동반자',27000,' 가족관계 및 성장과정 탐색을 통해 스스로에 대한 이해를 돕고, 3세대 인지행동치료를 기반으로 한 여러 가지 기법들을 활용합니다.','화,수/18:00~20:00','0',16),(8,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0대인관계',0,'2021-09-01/2021-10-01',' 진실한 마음으로 온(溫)택트 하고 싶은 상담사입니다.',_binary '\0','당신만을 위한 “맞춤” 시간',20000,'운동을 할 때 제일 힘든 점은, 바로 집 밖으로 나서는 일이죠. 이곳까지 찾아오신 여러분은 이미 변화를 위한 가장 힘겨운 첫발을 내디디셨습니다. ','수,목/10:00~12:00','0',16),(9,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0취업진로',4,'2021-08-01/2021-11-01','상담에서 깨닫고 배운 것을 실생활에 적용해 보기도 하고 수정,보완하며 스스로 자생력을 키울수 있도록 지지하고 돕습니다.',_binary '','함께 걸어가는 취업 준비 터널',50000,'어떤 문제로 고민하세요? 함께 해요 ! 용기가 생겨요! 미래가 보여요!','토/13:30:~15:00','1',16),(16,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0육아',4,'2021-07-10/2021-12-10','육아와 직장 생활을 병행하시는 분들',_binary '\0','용기와새로운시작',0,'소개','화,목/19:00~21:00','2',11),(17,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0육아',5,'2021-09-01/2021-12-31','중장년층 중 오랜 회사생활로 대인관계에 두려움이 있는 분들의 수다 자조모임입니다.',_binary '\0','청춘 수다방',0,'소개','월,수,금/15:00~17:00','2',11),(18,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0건강',6,'2021-08-01/2021-12-31','여성장애인들의 자조적으로 한지공예품을 제작하며 사회 자립심을 기를 수 있습니다.',_binary '\0','한지자조힐링 어울림',0,'소개','토/14:00~18:00','2',11),(19,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0건강',7,'2021-08-11/2021-11-11','코로나블루로 인한 우울감을 다함께 이야기하며 이겨내보아요!',_binary '\0','코로나블루 이기기',0,'소개','월,수/18:30~19:30','2',11),(21,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0연애',4,'2021-08-15/2021-09-15','오랜 연애와 그 후의 다른 터닝포인트인 결혼 고민을 함께 이야기합니다.',_binary '\0','연애끝결혼시작',0,'소개','화,목/18:40~20:00','2',11),(22,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0취업진로',5,'2021-08-15/2021-10-15','장기 취업 준비기간으로 지치고 슬럼프를 겪고 있는 취준생들, 함께 응원합시다',_binary '\0','취업슬럼프 이겨내기',0,'소개','화,목/9:30~12:00','2',11),(23,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0취업진로',5,'2021-08-01/2021-09-01','관심사와 소통으로 나만의 진로 찾기',_binary '\0','타인이 보는 나',0,'소개','토,일/12:00~14:00','2',11),(24,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0직장',5,'2021-07-15/2021-09-15','직장내 왕따에서 벗어나기',_binary '\0','직장트러블, It\'s okay.',0,'소개','토/10:00~11:30','2',11),(25,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0직장',6,'2021-08-20/2021-12-20','직장에서의 즐거움을 찾지못해 월요병을 겪는 사람들의 소통 공간입니다.',_binary '\0','월요병',0,'소개','일/19:00~21:00','2',11),(26,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0대인관계',4,'2021-08-25/2021-09-30','대인관계에서의 자신감을 찾고 타인과의 대화를 위한 연습의 공간입니다.',_binary '\0','미움받을 용기',0,'소개','월,목/14:00~16:00','2',11),(27,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0대인관계',6,'2021-08-12/2021-10-12','절친한 친구와 싸우고 난 후, 화해의 방법과 싸움을 이해하는 과정을 경험 공유를 통해 해결합니다.',_binary '\0','관계, 열두발자국',0,'소개','수,금/18:00~19:30','2',11),(28,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0외모',3,'2021-08-08/2021-12-12','외모에 대한 자신감을 타인과의 대화를 통해 찾아보며 성장합니다.',_binary '\0','외면과 내면',0,'소개','월/19:00~20:30','2',11),(29,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0외모',6,'2021-09-01/2021-10-01','발달장애인을 위한 자신의 자존감 향상을 위한 자조모임',_binary '\0','주인공은 나야나',0,'소개','수,목/11:00~14:00','2',11),(30,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0가족',6,'2021-08-01/2021-10-01','가정폭력에서 벗어나고자 하는 용기를 가진 사람들의 모임',_binary '\0','토닥토닥',0,'소개','월,화/10:00~13:00','2',11),(31,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0가족',8,'2021-08-17/2021-11-17','사랑하는 사람들에게 희망을 주는 치매가족들의 아픔과 경험을 공유하는 공간',_binary '\0','파란장미',0,'소개','월,화/16:00~18:00','2',11),(32,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0학업',10,'2021-08-17/2021-11-17','다문화 가족이 학업의 차별을 겪지않고 성장할 수 있도록 서로를 돕고 의지합니다.',_binary '\0','위풍당당',0,'소개','월,수,금/15:00~17:00','2',11),(33,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0학업',8,'2021-08-09/2021-12-06','독거노인들의 한글 공부 학업을 통해 서로 돕고 성장할 수 있습니다.',_binary '\0','드림스타트',0,'소개','월,수,금/15:00~17:00','2',11),(34,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0금전',4,'2021-08-09/2021-10-09','비트코인의 아픈 금전 경험을 통해 성장하고 생활 복귀를 돕는 자조모임',_binary '\0','세상과 발맞추기',0,'소개','토,일/13:30~16:00','2',11),(35,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0금전',5,'2021-08-06/2021-11-09','빚과 부도로 인한 금전적 어려움을 겪은 사람들의 아픔 극복',_binary '\0','올바른 금전 경험 모임',0,'소개','월,화/16:30~18:00','2',11),(36,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0육아',5,'2021-07-05/2021-10-09','한부모로 인한 육아의 어려움과 경험을 공유하고 발걸음을 함께 합니다.',_binary '\0','한부모 공감',0,'소개','화,수/19:30~21:00','2',11),(37,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0성격',6,'2021-08-05/2021-09-09','다혈질과 예민한 성격으로 의사소통에 어려움을 겪고있는 사람들의 성장스토리',_binary '\0','다양한 의사소통',0,'소개','금/19:30~21:00','2',11),(38,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0성격',6,'2021-07-16/2021-10-15','소심한 성격으로 발표에 두려움을 가지고 있는 사람들의 소심하지만 적극적인 모임입니다.',_binary '\0','앞장서기',0,'소개','토/13:30~15:30','2',11),(39,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0중독',7,'2021-08-16/2021-12-31','알코올 의존 상태의 사람들이 모여 서로의 경험을 공유하고 중독에서 회복할 자신감을 얻습니다.',_binary '\0','알코올 멈추면 시작',0,'소개','월,수/18:30~20:30','2',11),(40,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0중독',7,'2021-08-10/2021-12-31','당신의 생활, 중독에서 안전하십니까? 내가 생각하는 나만의 중독 이야기하기',_binary '\0','다양한 중독과 해결',0,'소개','월,수,금/20:30~21:30','2',11),(41,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0	성추행',3,'2021-08-20/2021-12-31','말하지 못했던 어린 시절의 성추행을 이야기하고 함께 이겨내는 방법을 공유합니다.',_binary '\0','비밀의방',0,'소개','금/20:00~21:30','2',11),(42,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0	성추행',3,'2021-08-20/2021-12-31','성폭력 피해 경험 말하기를 통해 누구도 해줄 수 없는 치유를 드립니다.',_binary '\0','세상에 말한다',0,'소개','토/19:00~21:00','2',11),(43,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0이별이혼',5,'2021-08-23/2021-11-31','갑작스런 이별, 흔들림 속에서 우리의 색과 향이 깊어짐을 믿습니다.',_binary '\0','아픈손가락',0,'소개','수,목/19:00~21:00','2',11),(44,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0이별이혼',8,'2021-09-01/2021-10-31','이혼으로 인한 어려움과 두려움을 함께 이야기하며 다시 일어설 준비를 합니다.',_binary '\0','당신의 힘든 순간과 그 이후',0,'소개','목,금/20:00~22:00','2',11),(47,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0연애',0,'2021-08-17/2021-09-17','상황에 따라 질문을 드리기도 하고 이야기를 정리하기도 합니다. 그 입장에 직접 처해있다는 가정으로 경청하고, 감정을 함께 느끼며, 여러가지 각도에서 바라보려고 노력합니다.',_binary '\0','연애고민 즉문즉답',40000,'고구마같은 내 연애, 사이다처럼 뻥- 뚫어줄 즉문즉답','목/20:00~22:00','0',18),(49,_binary '�\�\0~r\0 com.ssafy.db.entity.CategoryEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0연애',5,'2021-08-17/2021-10-10','든든하고 따뜻한 그룹원들 사이에서 나의 진짜 감정을 알아차리는 방법을 연습하도록 돕습니다.',_binary '\0',' 나의 이성관계 패턴 알아보기',40000,'나는 왜 다른 이성을 만나도 항상 같은 결말일까? ','화,수/16:00~17:00','1',18);
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-20  7:23:45
