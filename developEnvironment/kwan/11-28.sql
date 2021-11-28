-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.13-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- webdb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `webdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webdb`;

-- 테이블 webdb.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `boardID` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `boardDate` datetime NOT NULL,
  `boardContent` varchar(2050) NOT NULL,
  `rentalDate1` datetime DEFAULT NULL,
  `rentalDate2` datetime DEFAULT NULL,
  `rentalCount` int(11) DEFAULT NULL,
  `userNickname` varchar(20) NOT NULL,
  `boardCategory` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`boardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 webdb.comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment` (
  `boardID` varchar(20) NOT NULL,
  `commentUser` varchar(20) NOT NULL,
  `commentDate` datetime NOT NULL DEFAULT current_timestamp(),
  `CommentContent` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 webdb.image 구조 내보내기
CREATE TABLE IF NOT EXISTS `image` (
  `boardID` varchar(20) NOT NULL,
  `fileName` varchar(255) NOT NULL,
  KEY `boardID` (`boardID`),
  CONSTRAINT `boardID` FOREIGN KEY (`boardID`) REFERENCES `board` (`boardID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 webdb.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `userID` varchar(20) NOT NULL,
  `userPassword` varchar(20) DEFAULT NULL,
  `userEmail` varchar(20) NOT NULL,
  `userGender` varchar(20) DEFAULT NULL,
  `userNickname` varchar(20) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userEmail` (`userEmail`),
  UNIQUE KEY `userNickname` (`userNickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
