-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: db
-- 生成日時: 2025 年 1 月 18 日 08:49
-- サーバのバージョン： 11.6.2-MariaDB-ubu2404
-- PHP のバージョン: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `legacyDB`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `operators`
--

CREATE TABLE `operators` (
  `operator_id` varchar(5) NOT NULL COMMENT '担当者ID',
  `operator_name` varchar(30) NOT NULL COMMENT '担当者名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='担当者';

--
-- テーブルのデータのダンプ `operators`
--

INSERT INTO `operators` (`operator_id`, `operator_name`) VALUES
('U0001', '織田信長'),
('U0002', '豊臣秀吉'),
('U0003', '武田信玄'),
('U0004', '上杉謙信');

-- --------------------------------------------------------

--
-- テーブルの構造 `orders`
--

CREATE TABLE `orders` (
  `order_no` int(11) NOT NULL COMMENT '受注番号',
  `order_date` varchar(8) NOT NULL COMMENT '受注日',
  `order_pic` varchar(30) NOT NULL COMMENT '受注担当者名',
  `customer_name` varchar(50) NOT NULL COMMENT '得意先名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='受注';

--
-- テーブルのデータのダンプ `orders`
--

INSERT INTO `orders` (`order_no`, `order_date`, `order_pic`, `customer_name`) VALUES
(1, '20241225', '織田信長', '徳川物産株式会社'),
(2, '20230412', '豊臣秀吉', '徳川物産株式会社'),
(3, '20230802', '上杉謙信', '徳川物産株式会社'),
(4, '20241010', '織田信長', '徳川物産株式会社'),
(5, '20241202', '武田信玄', '徳川物産株式会社'),
(11, '20241325', '織田信長', '徳川物産株式会社'),
(12, '20241225', '坂本龍馬', '徳川物産株式会社'),
(13, '20241225', '織田信長', '徳川物産株式会社'),
(15, '20241225', '織田信長', '徳川物産株式会社');

-- --------------------------------------------------------

--
-- テーブルの構造 `order_details`
--

CREATE TABLE `order_details` (
  `order_no` int(11) NOT NULL COMMENT '受注番号',
  `order_detail_no` int(11) NOT NULL COMMENT '受注明細番号',
  `product_name` varchar(30) NOT NULL COMMENT '商品名',
  `receiving_quantity` int(11) NOT NULL COMMENT '受注数',
  `shipping_flag` tinyint(1) NOT NULL COMMENT '出荷済フラグ',
  `canceled_flag` tinyint(1) NOT NULL COMMENT 'キャンセルフラグ',
  `selling_price` int(11) NOT NULL COMMENT '販売単価',
  `cost_price` int(11) NOT NULL COMMENT '商品原価'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='受注明細';

--
-- テーブルのデータのダンプ `order_details`
--

INSERT INTO `order_details` (`order_no`, `order_detail_no`, `product_name`, `receiving_quantity`, `shipping_flag`, `canceled_flag`, `selling_price`, `cost_price`) VALUES
(1, 1, 'フリクションボールペン', 10, 0, 0, 300, 200),
(2, 1, 'Mont Blanc万年筆', 5, 1, 0, 110000, 90000),
(3, 1, 'フリクションボールペン', 5, 0, 0, 300, 200),
(3, 2, 'クルトガ', 20, 0, 0, 300, 200),
(4, 1, 'ジェットストリーム', 5, 0, 1, 440, 350),
(4, 2, 'クルトガ', 20, 1, 0, 550, 400),
(4, 3, 'フリクションボールペン', 10, 1, 0, 300, 200),
(5, 1, 'ジェットストリーム', 5, 0, 1, 440, 350),
(5, 2, 'ジェットストリーム', 15, 0, 0, 440, 350),
(5, 3, 'ジェットストリーム', 15, 0, 0, 440, 380),
(5, 4, 'クルトガ', 20, 1, 0, 550, 400),
(11, 1, 'フリクションボールペン', 10, 0, 0, 300, 200),
(12, 1, 'フリクションボールペン', 10, 0, 0, 300, 200),
(14, 1, 'フリクションボールペン', 10, 0, 0, 300, 200),
(15, 1, 'トンボ鉛筆1ダース', 10, 0, 0, 300, 200);

-- --------------------------------------------------------

--
-- テーブルの構造 `products`
--

CREATE TABLE `products` (
  `product_name` varchar(30) NOT NULL COMMENT '商品名称',
  `cost_price` int(11) NOT NULL COMMENT '商品原価'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci COMMENT='商品';

--
-- テーブルのデータのダンプ `products`
--

INSERT INTO `products` (`product_name`, `cost_price`) VALUES
('LAMY万年筆', 3000),
('Mont Blanc万年筆', 90000),
('クルトガ', 400),
('ジェットストリーム', 350),
('フリクションボールペン', 200);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `operators`
--
ALTER TABLE `operators`
  ADD UNIQUE KEY `operaters_pkey` (`operator_id`);

--
-- テーブルのインデックス `orders`
--
ALTER TABLE `orders`
  ADD UNIQUE KEY `orders_pkey` (`order_no`);

--
-- テーブルのインデックス `order_details`
--
ALTER TABLE `order_details`
  ADD UNIQUE KEY `order_details_pkey` (`order_no`,`order_detail_no`);

--
-- テーブルのインデックス `products`
--
ALTER TABLE `products`
  ADD UNIQUE KEY `products_pkey` (`product_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
