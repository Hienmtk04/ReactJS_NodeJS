-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2024 at 05:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sell_clothes_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `category_description` text DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_by` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_image`, `category_description`, `parent_id`, `slug`, `status`, `created_by`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'Quần', '1.png', 'Quần tuổi teen', 0, NULL, 1, 0, '2024-09-26 15:52:20', '2024-09-26 15:52:20', 0),
(2, 'Áo', '6.png', 'Áo thời trang', 0, NULL, 1, 0, '2024-09-26 15:52:20', '2024-09-26 15:52:20', 0),
(3, 'Đầm', '5.png', 'Đầm liền quý phái', 0, NULL, 1, 0, '2024-09-26 15:54:18', '2024-09-26 15:54:18', 0),
(4, 'Váy', '2.png', 'Váy xinh xắn', 0, NULL, 1, 0, '2024-09-26 15:54:18', '2024-09-26 15:54:18', 0),
(5, 'Giày', '4.png', 'Giày - Giày cao gót', 0, NULL, 1, 0, '2024-09-26 15:55:26', '2024-09-26 15:55:26', 0),
(6, 'Phụ kiện', '3.png', 'Phụ kiện', 0, NULL, 1, 0, '2024-09-26 15:55:26', '2024-09-26 15:55:26', 0),
(7, 'Áo sơ mi', NULL, 'Áo sơ mi', 2, NULL, 1, 0, '2024-09-26 15:57:55', NULL, 0),
(8, 'Áo thun', NULL, 'Áo thun', 2, NULL, 1, 0, '2024-09-26 15:57:55', NULL, 0),
(9, 'Áo kiểu babydoll', NULL, 'Áo kiểu babydoll', 2, NULL, 1, 0, '2024-09-26 15:58:43', NULL, 0),
(10, 'Áo khoác', NULL, 'Áo khoác', 2, NULL, 1, 0, '2024-09-26 15:58:43', NULL, 0),
(11, 'Quần short lửng', NULL, 'Quần short lửng', 1, NULL, 1, 0, '2024-09-26 16:01:20', NULL, 0),
(12, 'Quần ngắn', NULL, 'Quần ngắn', 1, NULL, 1, 0, '2024-09-26 16:01:20', NULL, 0),
(13, 'Quần dài', NULL, 'Quần dài', 1, NULL, 1, 0, '2024-09-26 16:01:52', NULL, 0),
(14, 'Giày bata', NULL, 'Giày bata', 5, NULL, 1, 0, '2024-09-26 16:03:31', NULL, 0),
(15, 'Giày cao gót', NULL, 'Giày cao gót', 5, NULL, 1, 0, '2024-09-26 16:03:31', NULL, 0),
(16, 'Mũ - nón - trang sức', NULL, 'Mũ - nón', 6, NULL, 1, 0, '2024-09-26 16:04:18', NULL, 0),
(17, 'Túi xách', NULL, 'Túi xách', 6, NULL, 1, 0, '2024-09-26 16:04:18', NULL, 0),
(18, 'Váy ngắn', NULL, 'Váy ngắn', 4, NULL, 1, 0, '2024-09-26 18:09:06', NULL, 0),
(19, 'Váy lửng', NULL, 'Váy lửng', 4, NULL, 1, 0, '2024-09-26 18:09:06', NULL, 0),
(20, 'Váy dài', NULL, 'Váy dài', 4, NULL, 1, 0, '2024-09-26 18:09:19', NULL, 0),
(21, 'Đầm ngắn', NULL, 'Đầm ngắn', 3, NULL, 1, 0, '2024-09-26 18:11:10', NULL, 0),
(22, 'Đầm lửng', NULL, 'Đầm lửng', 3, NULL, 1, 0, '2024-09-26 18:11:10', NULL, 0),
(23, 'Đầm dài', NULL, 'Đầm dài', 3, NULL, 1, 0, '2024-09-26 18:11:10', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `collection_id` int(11) NOT NULL,
  `collection_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`collection_id`, `collection_name`, `status`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'Xuân Hạ', 0, '2024-10-29 06:06:11', '2024-10-29 06:06:11', 0),
(2, 'Thu Đông', 0, '2024-10-29 06:06:11', '2024-10-29 06:06:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `color_id` int(11) NOT NULL,
  `color_name` varchar(255) NOT NULL,
  `color_info` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`color_id`, `color_name`, `color_info`) VALUES
(1, 'Trắng', '#fff'),
(2, 'Đen', '#000'),
(3, 'Xanh dương', '#46a3eb'),
(4, 'Xanh đen', '#053d69'),
(5, 'Be', '#ede0c5'),
(6, 'Đen - 1', '#000'),
(7, 'Đen - 2', '#000'),
(8, 'Quả mơ', '#e8dac5'),
(9, 'Màu xám', '#bab9b6'),
(10, 'Xám đậm', '#848785'),
(11, 'Xanh xám', '#7e9aa6'),
(12, 'Màu bạc', '#C0C0C0'),
(13, 'PC3 - hồng', '#f0add0'),
(14, 'PC2 - Xanh', '#7dcce8');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `reply_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT 1,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `user_id`, `user_name`, `email`, `phone`, `title`, `content`, `reply_id`, `created_at`, `updated_at`, `status`, `deleted`) VALUES
(1, 20, 'Mai Hiền', 'han@gmail.com', '0398754123', '', 'Chất lượng sản phẩm khỏi bàn', 0, '2024-11-11 16:22:16', '2024-11-11 16:22:16', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 2,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`, `link`, `type`, `parent_id`, `status`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'Trang chủ', '', 'Trang chủ', 0, 2, '2024-10-20 07:13:16', '2024-10-20 07:13:16', 0),
(2, 'Giới thiệu', 'about', 'Giới thiệu', 0, 2, '2024-10-20 07:13:16', '2024-10-20 07:13:16', 0),
(3, 'Sản phẩm', 'product', 'Sản phẩm', 0, 2, '2024-10-20 07:14:02', '2024-10-20 07:14:02', 0),
(4, 'Tin tức', 'news', 'Tin tức', 0, 2, '2024-10-20 07:14:02', '2024-10-20 07:14:02', 0),
(5, 'Câu hỏi thường gặp', 'question', 'Câu hỏi thường gặp', 0, 2, '2024-10-20 07:14:39', '2024-10-20 07:14:39', 0),
(6, 'Liên hệ', 'contact', 'Liên hệ', 0, 2, '2024-10-20 07:14:39', '2024-10-20 07:14:39', 0),
(7, 'Áo', 'product/category/2', 'Sản phẩm', 3, 2, '2024-10-20 07:15:45', '2024-10-20 07:15:45', 0),
(8, 'Quần', 'product/category/1', 'Sản phẩm', 3, 2, '2024-10-20 07:15:45', '2024-10-20 07:15:45', 0),
(9, 'Váy', 'product/category/4', 'Sản phẩm', 3, 2, '2024-10-20 07:16:20', '2024-10-20 07:16:20', 0),
(10, 'Đầm', 'product/category/3', 'Sản phẩm', 3, 2, '2024-10-20 07:16:20', '2024-10-20 07:16:20', 0),
(11, 'Sale đồng giá', 'sale-dong-gia', 'Sản phẩm', 3, 2, '2024-10-20 07:17:13', '2024-10-20 07:17:13', 0),
(12, 'Áo kiểu', 'sp-ao-kieu', 'Sản phẩm áo', 7, 2, '2024-10-20 07:19:31', '2024-10-20 07:19:31', 0),
(13, 'Áo sơ mi', 'ao-so-mi', 'Sản phẩm áo', 7, 2, '2024-10-20 16:13:25', '2024-10-20 16:13:25', 0),
(14, 'Áo thun', 'ao-thun', 'Sản phẩm áo', 7, 2, '2024-10-20 16:13:25', '2024-10-20 16:13:25', 0),
(15, 'Áo khoác', 'ao-khoac', 'Sản phẩm áo', 7, 2, '2024-10-20 16:13:46', '2024-10-20 16:13:46', 0),
(16, 'Sale đồng giá 199k', 'sale-199k', 'Sale đồng giá 99k', 11, 2, '2024-10-20 16:13:46', '2024-10-20 16:13:46', 0),
(17, 'Đầm ngắn', 'dam-ngan', 'Sản phẩm quần', 10, 2, '2024-10-20 16:27:08', '2024-10-20 16:27:08', 0),
(18, 'Đầm lửng', 'dam-lung', 'Sản phẩm đầm ', 10, 2, '2024-10-20 16:27:08', '2024-10-20 16:27:08', 0),
(19, 'Đầm dài', 'dam-dai', 'Sản phẩm đầm', 10, 2, '2024-10-20 16:28:01', '2024-10-20 16:28:01', 0),
(20, 'Váy ngắn', 'vay-ngan', 'Sản phẩm váy', 9, 2, '2024-10-20 16:28:01', '2024-10-20 16:28:01', 0),
(21, 'Váy lửng', 'vay-lung', 'Sản phẩm váy', 9, 2, '2024-10-20 16:29:12', '2024-10-20 16:29:12', 0),
(22, 'Quần ngắn', 'quan-ngan', 'Sản phẩm quần', 8, 2, '2024-10-20 16:29:12', '2024-10-20 16:29:12', 0),
(23, 'Quần dài', 'quan-dai', 'Sản phẩm quần', 8, 2, '2024-10-20 16:30:04', '2024-10-20 16:30:04', 0),
(24, 'Sale đồng giá 99k', 'sale-99k', 'Sale đồng giá 99k', 11, 2, '2024-10-20 16:30:04', '2024-10-20 16:30:04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `status_id` int(11) NOT NULL,
  `payment` varchar(255) NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_name`, `user_id`, `total_price`, `status_id`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Đơn hàng #780000', 20, 780000, 0, 'COD', 'Nhẹ tay giúp tôi', '2024-11-10 17:41:52', '2024-11-10 17:41:52'),
(2, 'Đơn hàng #290000', 20, 290000, 0, 'COD', 'Nhẹ tay', '2024-11-10 17:44:21', '2024-11-10 17:44:21'),
(3, 'Đơn hàng #329000', 20, 329000, 0, 'COD', 'Nhẹ tay', '2024-11-10 18:01:23', '2024-11-10 18:01:23'),
(4, 'Đơn hàng #694000', 21, 694000, 0, 'PayPal', 'Nhẹ tay', '2024-11-13 08:18:52', '2024-11-13 08:18:52'),
(5, 'Đơn hàng #1328000', 20, 1328000, 0, 'COD', 'Nhẹ tay', '2024-11-13 08:30:12', '2024-11-13 08:30:12'),
(6, 'Đơn hàng #165000', 20, 165000, 0, 'COD', '', '2024-11-13 08:33:32', '2024-11-13 08:33:32'),
(7, 'Đơn hàng #248000', 20, 248000, 0, 'COD', 'Nhẹ tay', '2024-11-13 08:38:42', '2024-11-13 08:38:42'),
(8, 'Đơn hàng #220000', 23, 220000, 0, 'COD', 'Nhẹ tay', '2024-11-13 09:10:37', '2024-11-13 09:10:37'),
(9, 'Đơn hàng #205000', 20, 205000, 0, 'PayPal', 'Nhẹ tay', '2024-11-14 06:07:16', '2024-11-14 06:07:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `orderDetail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size` varchar(255) NOT NULL,
  `cost_order` double NOT NULL DEFAULT 30000,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`orderDetail_id`, `order_id`, `price`, `quantity`, `product_id`, `color_id`, `size`, `cost_order`, `created_at`, `updated_at`) VALUES
(1, 1, 175000, 2, 3, 6, 'L', 30000, '2024-11-10 17:41:54', '2024-11-10 17:41:54'),
(2, 1, 200000, 2, 7, 10, 'S', 30000, '2024-11-10 17:41:54', '2024-11-10 17:41:54'),
(3, 2, 135000, 1, 4, 2, 'S', 30000, '2024-11-10 17:44:24', '2024-11-10 17:44:24'),
(4, 2, 125000, 1, 12, 2, 'S', 30000, '2024-11-10 17:44:24', '2024-11-10 17:44:24'),
(5, 3, 299000, 1, 8, 5, 'S', 30000, '2024-11-10 18:01:26', '2024-11-10 18:01:26'),
(6, 4, 125000, 1, 12, 2, 'L', 30000, '2024-11-13 08:18:55', '2024-11-13 08:18:55'),
(7, 4, 120000, 2, 9, 11, 'L', 30000, '2024-11-13 08:18:55', '2024-11-13 08:18:55'),
(8, 4, 299000, 1, 8, 5, 'L', 30000, '2024-11-13 08:18:55', '2024-11-13 08:18:55'),
(9, 5, 350000, 2, 11, 14, 'S', 30000, '2024-11-13 08:30:14', '2024-11-13 08:30:14'),
(10, 5, 299000, 2, 8, 5, 'S', 30000, '2024-11-13 08:30:14', '2024-11-13 08:30:14'),
(11, 6, 135000, 1, 4, 2, 'S', 30000, '2024-11-13 08:33:35', '2024-11-13 08:33:35'),
(12, 7, 109000, 2, 1, 5, 'S', 30000, '2024-11-13 08:38:45', '2024-11-13 08:38:45'),
(13, 8, 190000, 1, 2, 1, 'S', 30000, '2024-11-13 09:10:39', '2024-11-13 09:10:39'),
(14, 9, 175000, 1, 3, 7, 'S', 30000, '2024-11-14 06:07:20', '2024-11-14 06:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_detail` longtext NOT NULL,
  `post_description` longtext NOT NULL,
  `author` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `post_title`, `post_detail`, `post_description`, `author`, `image`, `created_at`, `updated_at`, `type`, `deleted`) VALUES
(1, 'Tủ quần áo con nhộng là gì? Chìa khóa mặc đẹp, tiết kiệm mà phụ nữ hiện đại nên biết', 'Những năm gần đây, lối sống hiện đại, tối giản được mọi người theo đuổi và tủ quần áo mới mang tên “con nhộng” cũng đi theo lối sống này.\n\nLà phái đẹp, chắc hẳn chị em đều có cho mình một tủ quần áo với rất nhiều món đồ từ trang phục đến phụ kiện. Tuy nhiên, có rất nhiều món đồ được dùng một vài lần rồi bị bỏ quên, số lượng tăng nhưng chất lượng thì giảm đáng kể. Vì vậy, tủ quần áo con nhộng ra đời để tạo thành lối sống tối giản, thói quen tiêu dùng hợp lý cho phụ nữ hiện đại.', 'Tủ quần áo con nhộng là gì?\nCó thể hiểu đơn giản, tủ quần áo con nhộng là một tủ quần áo tinh gọn với những món đồ chị em thích mặc, chúng phù hợp, linh hoạt có thể dùng cho nhiều trường hợp.\n\nVào những năm 1970, Susie Faux - chủ của một cửa hàng quần áo tại London đã đặt ra thuật ngữ “tủ quần áo con nhộng”. Cô định nghĩa tủ quần áo này bao gồm những món đồ thiết yếu mà phái đẹp có thể mặc trong nhiều mùa với số lượng hạn chế được sắp xếp một cách hợp lý. Đa phần là quần áo chất lượng tốt, có màu sắc đơn giản và có thể thay thế cho nhau. Sau đó, tủ quần áo con nhộng được một nhà thiết kế người Mỹ tên Donna Karan phổ biến nhờ bộ sưu tập “7 Easy Pieces” vào năm 1985.\n\n', ' Trần Tấn Phát', '1708314149-196-local.webp', '2024-10-21 07:56:40', '2024-10-21 07:56:40', 1, 0),
(2, '\"Nữ nhân viên mát-xa\" trong phim Trấn Thành ngoài đời xinh như hoa, không hở bạo vẫn đẹp hút hồn.', 'Vào vai \"Diễm mát-xa\", Anh Phạm ở đời thường được đánh giá xinh đẹp và rực rỡ hơn hẳn so với khi lên phim.\n\nPhim điện ảnh Mai của Trấn Thành hiện là chủ đề được dân tình bàn tán rôm rả. Ngoài hai nhân vật chính là Phương Anh Đào và Tuấn Trần thì những diễn viên còn lại cũng được quan tâm. Trong đó, Phạm Quỳnh Anh (1999, Hồ Chí Minh) - cô gái thủ vai Diễm mát-xa nơi Mai (Phương Anh Đào) làm việc gây sốt vì vẻ ngoài xinh đẹp.\nPhạm Quỳnh Anh hay còn được gọi Anh Phạm trong phim đảm nhiệm nhân vật có tính cách đáng ghét, thường gây rối cho Mai (Phương Anh Đào) tại nơi làm việc.', 'Tuy nhiên, xuất hiện trong những lần đi cine tour vừa qua cùng ekip, cô gái sinh năm 1999 khiến dân tình bất ngờ vì sở hữu nhan sắc đời thường xinh xuất sắc. \n\nAnh Phạm là một nhân tố khá mới của làng phim Việt. Cô từng góp mặt trong một số phim điện ảnh như Chuyện Ma Gần Nhà, Hoa Hậu Giang Hồ, Bình Minh Đỏ,... tuy nhiên không thực sự được chú ý. Trong phim Mai, dù chỉ là một vai diễn nhỏ, nhưng cái tên Anh Phạm vì vậy cũng được biết đến nhiều hơn. Chia sẻ với truyền thông, Anh Phạm bất ngờ trước sự quan tâm của mọi người dành cho nhan sắc cũng như vai diễn của mình trong phim. Cô nói: “Chắc vì trên phim tôi búi tóc gọn gàng, ăn diện đơn giản còn ở ngoài đời thì được điệu hơn một xíu\".\n\nQuả thật, nếu theo dõi trang cá nhân của Diễm mát-xa, hẳn ai cũng đều cảm thấy cô nàng này ngoài đời sở hữu vẻ đẹp đầy trong veo, ngọt ngào. Phong cách thời trang mà Anh Phạm theo đuổi cũng nhẹ nhàng và nữ tính. ', ' Trần Tấn Phát', 'nu-nhan-vien-mat-xa-trong-phim-tran-thanh-ngoai-doi-xinh-nhu-hoa-khong-ho-bao-van-dep-hut-hon-img_0240-1708273697-399-width780height572.jpg', '2024-10-21 07:56:40', '2024-10-21 07:56:40', 1, 0),
(3, 'Tuần này mặc gì: Học theo quý cô Anh Quốc công thức phối đồ đẹp kinh điển, không lỗi mốt', 'Sang trọng, thu hút mà không cần chạy theo bất kỳ trend nào - đây chính là những gì mà tủ đồ của các cô nàng Anh Quốc luôn chú trọng, xứng đáng để chị em học hỏi.\n\nThời trang ở xứ sở sương mù luôn nổi tiếng với sự thanh lịch pha chút gì đó cổ điển, đặc biệt ưu tiên cách phối đồ hơn là những item hot hit. Có thể những quý cô ở đây không nằm trong top ăn mặc sành điệu nhất, nhưng chắc chắn những công thức phối đồ của họ vẫn đẹp sau vài năm nữa, không bao giờ lo lỗi mốt.\n\nVới những ai đang theo đuổi phong cách tối giản nhưng hiệu quả, hay chỉ muốn tham khảo một \"làn gió mới\" thực sự kinh điển cho tủ đồ, thì hoàn toàn có thể học theo các quý cô Anh Quốc. Dưới đây là 7 công thức dễ bắt gặp nhất trên đường xá London, đủ cho nàng diện trọn vẹn trong 1 tuần:\n\nThứ Hai: Áo blazer + Quần jeans + Giày Loafer\n\nMột sự kết hợp ăn rơ đến từ 3 item luôn đẹp mãi với thời gian này sẽ giúp cho nàng bắt đầu một tuần mới dễ thở hơn rất nhiều. Sự lựa chọn của quý cô Anh Quốc thường là những chiếc áo blazer form rộng, chất liệu dày dặn và không phải màu đen, đi cùng quần jeans ống đứng để tạo cảm giác gọn gàng. Giày Loafer cũng là đôi giày yêu thích ở đây khi vào mùa Xuân, vì ấm áp, dễ chịu mà vẫn hack chiều cao.\n', 'Với những ai đang theo đuổi phong cách tối giản nhưng hiệu quả, hay chỉ muốn tham khảo một \"làn gió mới\" thực sự kinh điển cho tủ đồ, thì hoàn toàn có thể học theo các quý cô Anh Quốc. Dưới đây là 7 công thức dễ bắt gặp nhất trên đường xá London, đủ cho nàng diện trọn vẹn trong 1 tuần:\n\nThứ Hai: Áo blazer + Quần jeans + Giày Loafer\n\nMột sự kết hợp ăn rơ đến từ 3 item luôn đẹp mãi với thời gian này sẽ giúp cho nàng bắt đầu một tuần mới dễ thở hơn rất nhiều. Sự lựa chọn của quý cô Anh Quốc thường là những chiếc áo blazer form rộng, chất liệu dày dặn và không phải màu đen, đi cùng quần jeans ống đứng để tạo cảm giác gọn gàng. Giày Loafer cũng là đôi giày yêu thích ở đây khi vào mùa Xuân, vì ấm áp, dễ chịu mà vẫn hack chiều cao.', 'Trần Tấn Phát', '1708270020-489-local.webp', '2024-10-21 08:40:21', '2024-10-21 08:40:21', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_id_name` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image1` varchar(255) NOT NULL,
  `product_image2` varchar(255) NOT NULL,
  `product_description` text DEFAULT NULL,
  `product_sale` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `product_price_sale` double NOT NULL,
  `product_quantity` bigint(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `product_slug` varchar(255) DEFAULT NULL,
  `product_detail` text DEFAULT NULL,
  `product_status` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_id_name`, `product_name`, `product_image1`, `product_image2`, `product_description`, `product_sale`, `product_price`, `product_price_sale`, `product_quantity`, `category_id`, `subcategory_id`, `product_slug`, `product_detail`, `product_status`, `collection_id`, `created_by`, `created_at`, `updated_at`, `deleted`) VALUES
(1, 'HELIAS01', 'Chân váy jean ngắn KABICO dáng chữ a', 'helias01_1.webp', 'helias01_2.webp', 'Miêu tả: CHÂN VÁY CHIFFON PHỐI CHÂN REN\n\nĐặc tính: Cổ điển - Thanh lịch.\n\nThể loại: Trang phục dạo phố, công sở.\n\nSize: S/M/L.\n\nChất liệu: Vải chiffon.\n\nMàu sắc: Kem/Xanh.\n\nLưu ý: Không tẩy, ngâm. Giặt tay. Ủi hơi nước. Không giặt chung với những sản phẩm dễ gây xước khác.\n\nSố đo mẫu nữ: Chiều cao: 168 cm. Số đo 3 vòng: 83 - 59 - 86 (Mặc size S).', 0, 149000, 109000, 100, 4, 18, 'chan-vay-jean-ngan-kabico-dang-chu-a', 'Chân váy jean ngắn KABICO dáng chữ a, chân váy ngắn nữ bò kaki cạp cao kèm quần trong ôm eo phong cách ulzzang V01', 1, 2, 0, '2024-09-27 16:31:37', NULL, 0),
(2, 'HELIAS02', 'Váy Vest không tay mỏng thanh lịch', 'helias02_1.webp', 'helias02_2.webp', 'Miêu tả: Váy Vest không tay mỏng thanh lịch\r\n\r\nĐặc tính: Cổ điển - Thanh lịch.\r\n\r\nThể loại: Trang phục dạo phố, công sở.\r\n\r\nSize: S/M/L.\r\n\r\nChất liệu: Vải chiffon.\r\n\r\nMàu sắc: Trắng/Đen.\r\n\r\nLưu ý: Không tẩy, ngâm. Giặt tay. Ủi hơi nước. Không giặt chung với những sản phẩm dễ gây xước khác.\r\n\r\nSố đo mẫu nữ: Chiều cao: 168 cm. Số đo 3 vòng: 83 - 59 - 86 (Mặc size S).', 0, 308000, 190000, 200, 3, 21, 'vay-vest-khong-tay-mong-thanh-lich', 'Váy Vest không tay mỏng thanh lịch dành cho nữ Váy ngắn đa năng eo Váy chữ A', 1, 2, 0, '2024-09-27 16:31:37', NULL, 0),
(3, 'HELIAS03', 'Váy nữ thiên nga đen Hàn Quốc tương phản màu sắc', 'helias-dam-02_1.webp', 'helias-dam-02_2.webp', 'Miêu tả: Váy nữ thiên nga đen Hàn Quốc tương phản màu sắc\r\n\r\nĐặc tính: Cổ điển - Thanh lịch.\r\n\r\nThể loại: Trang phục dạo phố, công sở.\r\n\r\nSize: S/M/L.\r\n\r\nChất liệu: Vải chiffon.\r\n\r\nMàu sắc: Đen dáng ngắn/Đen dáng dài.\r\n\r\nLưu ý: Không tẩy, ngâm. Giặt tay. Ủi hơi nước. Không giặt chung với những sản phẩm dễ gây xước khác.\r\n\r\nSố đo mẫu nữ: Chiều cao: 168 cm. Số đo 3 vòng: 83 - 59 - 86 (Mặc size S).', 0, 309000, 175000, 200, 3, 22, 'vay-nu-thien-nga-den-han-quoc', 'Duohanzi Váy nữ thiên nga đen Hàn Quốc tương phản màu sắc ngắn tay váy đen nhỏ phong cách Hepburn eo thon gọn Váy co giãn chữ A', 1, 2, 0, '2024-10-06 08:37:07', NULL, 0),
(4, 'HELIAS04', 'PINXIANG Áo Croptop Tay Dài Trễ Vai Kiểu Dáng Quyến Rũ', 'helias-ao-01_1.webp', 'helias-ao-01_2.webp', 'Miêu tả: PINXIANG Áo Croptop Tay Dài Trễ Vai Kiểu Dáng Quyến Rũ\r\n\r\nĐặc tính: Quyến rũ - Thanh lịch.\r\n\r\nThể loại: Trang phục dạo phố.\r\n\r\nSize: S/M/L.\r\n\r\nChất liệu: Khác\r\n\r\nMàu sắc: Kem/Xanh.\r\n\r\nLưu ý: Không tẩy, ngâm. Giặt tay. Ủi hơi nước. Không giặt chung với những sản phẩm dễ gây xước khác.\r\n\r\nSố đo mẫu nữ: Chiều cao: 168 cm. Số đo 3 vòng: 83 - 59 - 86 (Mặc size S).', 0, 232000, 135000, 200, 2, 9, 'ao-croptop-tay-dai-cho-nu', 'PINXIANG Áo Croptop Tay Dài Trễ Vai Kiểu Dáng Quyến Rũ', 1, 2, 0, '2024-10-29 06:50:35', NULL, 0),
(5, 'HELIAS05', 'Áo sơ mi kiểu nữ, Áo sơ mi babydoll xếp ly dọc khuy gỗ \"Sandy\" Hàn Quốc xinh xắn', 'helias-ao-02_1.webp', 'helias-ao-02_2.webp', 'ÁO SƠ MI KIỂU NỮ, ÁO SƠ MI BABYDOLL XẾP LY DỌC KHUY GỖ \"SANDY\" HÀN QUỐC XINH XẮN\r\n\r\nÁo sơ mi babydoll xếp ly dọc khuy gỗ \"Sandy\" Hàn Quốc xinh xắn chất đũi thô QC dày dặn, thoáng mát, lên form cực kỳ xinh, dễ mặc, dễ phối đồ\r\nÁo sơ mi babydoll xếp ly dọc khuy gỗ \"Sandy\" Hàn Quốc xinh xắn có 3 màu y ảnh: Trắng/ Be/ Xanh than\r\n\r\nKích thước Áo sơ mi babydoll xếp ly dọc khuy gỗ \"Sandy\" Hàn Quốc xinh xắn\r\n\r\n                   - Dài áo: 65cm\r\n\r\n                   - Dài tay áo: 60cm\r\n\r\n                   - Vai áo: 45cm\r\n\r\n                   - Ngực < 100cm\r\n\r\nÁo sơ mi babydoll xếp ly dọc khuy gỗ \"Sandy\" Hàn Quốc xinh xắn Freesize < 58kg mặc thoải mái\r\n\r\nVintagevibes. cam kết??\r\n\r\n\r\n\r\n?Sản phẩm y hình. Hàng Quảng Châu loại đẹp. Shop nói không với đồ lởm đồ xấu\r\n\r\n?Màu sắc sản phẩm trên thực tế có thể sẽ chênh một chút do vị trí ánh sáng khi chụp.\r\n\r\n- Cảm nhận chất vải, độ dày/ mỏng của sản phẩm có thể khác nhau ở từng khách hàng nên Vintagevibes. luôn kèm theo ảnh chụp gần vải để bạn dễ cân nhắc.', 1, 159000, 0, 200, 2, 9, 'ao-so-mi-babydoll-kieu-nu', 'Áo sơ mi kiểu nữ, Áo sơ mi babydoll xếp ly dọc khuy gỗ \"Sandy\" Hàn Quốc xinh xắn', 1, 1, 0, '2024-10-29 14:57:24', NULL, 0),
(6, 'HELIAS06', 'Áo Babydoll Cổ Tròn Hoa Thêu BERI', 'helias-ao-03_1.webp', 'helias-ao-03_2.webp', 'THÔNG TIN SẢN PHẨM:\r\n• Size: S,M\r\n• Màu sắc: Trắng, Be vàng\r\n• Chất liệu: Vải thêu hoa và lót lụa mềm thoải mái\r\n-------------------------------------------\r\nCHÍNH SÁCH ĐỔI TRẢ:\r\n• Liên hệ đổi trả trong vòng 3 ngày kể từ khi nhận được hàng\r\n• Còn nguyên tag, mac.\r\n• Sản phẩm chưa qua sử dụng, giặt là, chỉnh sửa.\r\nCảm ơn bạn đã quan tâm sản phẩm và hi vọng bạn hài lòng khi mua sắm tại Doxi.', 1, 280000, 0, 200, 2, 9, 'ao-co-tron-babydoll', 'Áo Babydoll Cổ Tròn Hoa Thêu BERI', 1, 1, 0, '2024-10-29 15:11:59', NULL, 0),
(7, 'HELIAS07', 'Áo Khoác Cardigan Len Vặn Thừng Khuy To Thêu Họa Tiết Con Ngựa Thời Trang Cho Nữ', 'helias-ao-04_1.webp', 'helias-ao-04_2.webp', 'Áo Khoác Cardigan Len Vặn Thừng Khuy To Thêu Họa Tiết Con Ngựa\r\n\r\n1. Thông tin sản phẩm:\r\n\r\n- Thông tin sản phẩm:Áo Khoác Cardigan Len Vặn Thừng Khuy To Thêu Họa Tiết Con Ngựa\r\n- Tên shop: Hoàng Dương Shopp\r\n\r\n- Xuất xứ: Quảng Châu\r\n\r\n- Giới tính: Nữ\r\n\r\n- Màu sắc: Xanh, Hồng\r\n\r\n- Bảng size tham khảo: (đo eo trên rốn 5-7cm)\r\n\r\n- Mô tả chi tiết: Áo Khoác Cardigan Len Vặn Thừng Khuy To Thêu Họa Tiết Con Ngựa\r\n- Chất Liệu:Áo Khoác Len Thừng Khuy To Thêu Họa Tiết chât liệu cotton thoáng mát thấm hút mồ hôi thích hợp cho mùa hè theo kiểu dáng hàn quốc khoác ngoài năng động, đa phần các mẫu sẽ có kèm cúc\r\n- Thiết kế: trẻ trung, năng động, màu sắc bắt mắt cùng các họa tiết nổi bật cá tính\r\nCách phối đồ với : Áo Thun Polo Giả Hai Lớp Tay Dài Dáng Ôm Ngắn Phong Cách Hàn Quốc Có Khuy là item không thể thiếu trong tủ đồ của mỗi chàng trai hay mỗi cô gái. Bạn hãy phối  cùng các phụ kiện như túi, mũ sẽ tăng thêm phần trẻ trung, năng động. \r\n\r\n- Đặc Điểm Nổi Bật: Áo Khoác Len Thừng Khuy To Thêu Họa Tiết\r\n-Áo Khoác Len Thừng Khuy To Thêu Họa Tiết là thiết kế kinh điển không thể thiếu trong tủ đồ của mỗi người nhất là những cô gái mê phong cách thanh lịch và nữ tính. \r\n- Với thiết kế hiện đại, trẻ trung đang dần trở thành những món đồ không thể thiếu cho các bạn nam,nữ hiện nay vì cực kì dễ mix đồ, với nhiều phong cách khác nhau\r\n- Ngoài ra còn có không chỉ là một chiếc váy thanh lịch mà còn là item giúp bạn định hình phong cách và thể hiện cá tính riêng của mình.\r\n\r\n- NHỮNG CAM KẾT KHI MUA Áo Khoác Len Thừng Khuy To Thêu Họa Tiết\r\n  + Đổi/ trả nếu  sản phẩm không đúng với hình ảnh và video đã đăng\r\n  + Đổi/trả nếu sản phẩm bị lỗi, hỏng do bất cứ lý do gì trước khi đến tay khách hàng \r\n  + Tất cả các đơn hàng của shop đều được kiểm tra cả về số lượng và chất lượng trước khi gửi đi.', 0, 260000, 200000, 200, 2, 10, 'ao-khoac-cardigan-1', 'Áo Khoác Cardigan Len Vặn Thừng Khuy To Thêu Họa Tiết Con Ngựa Thời Trang Cho Nữ', 1, 1, 0, '2024-10-29 15:29:36', NULL, 0),
(8, 'HELIAS08', 'BEIGE YELLOW DRESS- VÁY CÚP NGỰC NƠ CỔ VUÔNG TAY PHỒNG KÈM CHÂN VÁY TAFTA', 'helias-dam-03_1.webp', 'helias-dam-03_2.webp', 'SẢN PHẨM CÓ LƯNG CHUN CO DÃN, KHOÁ KÉO, VÀ QUẦN BẢO HỘ\r\n\r\nQUY ĐỊNH ĐỔI HÀNG CỦA Helias\r\n\r\n1. Shop CHỈ NHẬN đổi sản phẩm bị lỗi sản xuất , lỗi đường may, lỗi sản phẩm do shop gửi sai hàng. ( KHÔNG NHẬN ĐỔI SIZE, ĐỔI MẪU KHÁC)\r\n\r\n2.Thời gian đổi sản phẩm: Trong vòng 2 ngày kể từ ngày nhận.\r\n\r\n\r\n\r\n- Helias rất hân hạnh được phục vụ quý khách!\r\n\r\n\r\n\r\n(KHÁCH HÀNG LƯU Ý : SHOP KHÔNG GIẢI QUYẾT CÁC ĐƠN HÀNG ĐÃ ẤN NHẬN HÀNG, HOÀN THÀNH ĐƠN)', 1, 299000, 0, 200, 4, 18, 'vay-cup-nguc-no-co', 'BEIGE YELLOW DRESS- VÁY CÚP NGỰC NƠ CỔ VUÔNG TAY PHỒNG KÈM CHÂN VÁY TAFTA', 1, 1, 0, '2024-10-29 15:42:26', NULL, 0),
(9, 'HELIAS09', 'Váy Jeans Xếp Ly Có Lót Trong Cho Nữ, Váy Bò Dáng Chữ A', 'helias-vay-02_1.webp', 'helias-vay-02_2.webp', 'Xin chào các bạn, shop lại mới về Chân Váy Cạp Cao Phong Cách Đơn Giản \r\n\r\n+ Tên sản phẩm: Váy Jeans Xếp Ly Có Lót Trong Cho Nữ, Váy Bò Dáng Chữ A Hàng QC L1\r\n\r\n+ Bộ này có màu: xám và xanh\r\n\r\n+ Thông số sản phầm:\r\n\r\n  -Size S: nặng 43 - 45 kg\r\n\r\n  -Size M: nặng 46 - 50 kg\r\n\r\n  -Size L: nặng 51 - 55 kg\r\n\r\n+ Thông tin cảnh báo/Hướng dẫn sử dụng\r\n\r\n-  Nên giặt máy ở chế độ máy nhẹ nhàng hoặc giặt tay\r\n\r\n- GIÁ TẬN GỐC, MIỄN TRUNG GIAN, NÓI KHÔNG VỚI HÀNG KÉM CHẤT LƯỢNG\r\n\r\n- Chất lượng bền đẹp, luôn đặt uy tín lên hàng đầu\r\n\r\n- Khách được kiểm tra hàng trước khi thanh toán\r\n\r\n- Giải quyết mọi thắc mắc của khách hàng\r\n\r\n* Vui lòng cho phép sai số 1-3cm do đo lường thủ công.\r\n\r\n* Màu sắc thực có thể hơi khác so với hình ảnh do độ phân giải, độ sáng, độ tương phản của màn hình máy tính, vv. Mong quý khách hàng thông cảm.\r\n\r\n* Nếu bạn hài lòng với các sản phẩm và dịch vụ của chúng tôi, vui lòng để lại đánh giá 5 sao kèm theo ảnh. Trong trường hợp bạn không hài lòng với sản phẩm, vui lòng liên hệ ngay với chúng tôi, cảm ơn bạn!', 0, 155000, 120000, 200, 4, 18, 'vay-jean-xep-ly-ngan', 'Váy Jeans Xếp Ly Có Lót Trong Cho Nữ, Váy Bò Dáng Chữ A', 1, 1, 0, '2024-10-29 15:53:44', NULL, 0),
(10, 'HELIAS010', 'Lovito Giày đế bằng màu trơn thông thường Giày thể thao đế dày cho nữ LFA41333', 'helias-giay-01_1.webp', 'helias-giay-01_2.webp', '- ĐIỂM NỔI BẬT \r\n + Giày mây \r\n + Giày bảng \r\n + Đế dày\r\n\r\n- MÔ TẢ\r\n + Mô hình: trơn\r\n + Phong cách: Giản dị\r\n + Chất liệu: Khác\r\n + Thành phần: 100% Khác\r\n + Xuất xứ: Trung Quốc đại lục \r\n\r\n- GÓI BAO GỒM : 1x giày thể thao\r\n\r\n- GIỚI THIỆU LOVITO\r\n + Lovito là một thương hiệu mới nổi tin tưởng vào sức mạnh của các cô gái, cam kết cung cấp các lựa chọn quần áo thời trang và giá cả phải chăng cho các kiểu dáng, nhu cầu và bản sắc khác nhau. \r\nChúng tôi tin rằng thời trang phải vui vẻ, giải phóng và khiến bạn cảm thấy tuyệt vời. Rốt cuộc, phụ kiện tốt nhất cho mọi diện mạo là sự tự tin.\r\n\r\n- GHI CHÚ MUA HÀNG \r\n + Xin vui lòng tham khảo biểu đồ kích thước trước khi mua. Có thể có sự khác biệt nhỏ do đo lường thủ công. \r\nTất cả các hình ảnh sản phẩm trong cửa hàng này là chụp ảnh thực tế. Do sự khác biệt về ánh sáng và màn hình, sự thay đổi nhỏ về màu sắc và sản phẩm có thể bình thường.\r\n + Theo dõi cửa hàng của chúng tôi và khám phá các mặt hàng mới và ưu đãi tốt nhất cho bạn!! \r\n\r\nNếu bạn có bất kỳ câu hỏi hoặc vấn đề, xin vui lòng nhắn tin cho chúng tôi.?', 0, 259000, 200000, 200, 5, 14, 'giay-de-nu-tron', 'Lovito Giày đế bằng màu trơn thông thường Giày thể thao đế dày cho nữ LFA41333', 1, 0, 0, '2024-10-29 16:06:45', NULL, 0),
(11, 'HELIAS011', 'Vòng tay Lovito kiểu mặt trăng nơ hoa đính đá zircon phong cách lãng mạn cho nữ LFA12539', 'helias-phukien-01_1.webp', 'helias-phukien-01_1.webp', '- ĐIỂM NỔI BẬT\r\n\r\n  + Nơ\r\n\r\n  + Hoa\r\n\r\n  + Đính đá\r\n\r\n  + Zircon\r\n\r\n  + Hoa anh đào\r\n\r\n  + Cặp đôi bạn thân\r\n\r\n\r\n\r\n- MÔ TẢ\r\n\r\n  + Hoa văn: Mặt trăng\r\n\r\n  + Phong cách: Lãng mạn\r\n\r\n  + Chất liệu: Khác\r\n\r\n  + Thành phần: 100%Khác\r\n\r\n  + Xuất xứ: Trung Quốc đại lục\r\n\r\n\r\n\r\n- GÓI HÀNG BAO GỒM: 1 Vòng đeo tay', 1, 350000, 0, 200, 6, 16, 'vong-tay-lovito-kieu-mat-trang', 'Vòng tay Lovito kiểu mặt trăng nơ hoa đính đá zircon phong cách lãng mạn cho nữ LFA12539', 1, 0, 0, '2024-10-29 16:16:09', NULL, 0),
(12, 'HELIAS012', 'ĐẦM BODY CÚP NGỰC ÔM VIỀN LƯỢN SÓNG TUA RUA', 'helias-dam-04_1.webp', 'helias-dam-04_2.webp', 'Cổ áo:  Cổ tròn\r\nChiều dài tay áo:  Không tay\r\nPhong cách:  Hàn Quốc, sexy\r\nDịp:  Buổi tiệc\r\nChất liệu:  voan\r\nKiểu váy:  Váy đuôi cá dài\r\nRất lớn:  Không\r\n\r\n** Khách cần là hơi phẳng trước khi giao ib shop trước nha.\r\n\r\n\r\n^^ Nhà mk chỉ bán hàng LOẠI 1, KHÔNG bán hàng lởm hàng chợ nên các bạn cực kì yêm tâm nha\r\n\r\n\r\n** Mỗi đơn hàng bên shop đều kiểm tra kĩ trước khi đóng giao cho khách, đóng gói cẩn thận, tránh sai sót. \r\n\r\n** ĐỔI TRẢ THOẢI MÁI NẾU SẢN PHẨM BỊ LỖI \r\n\r\n** KHÁCH CẦN TƯ VẤN IB SHOP NHA', 0, 180000, 125000, 200, 3, 22, 'dam-body-om-cup-nguc', 'ĐẦM BODY CÚP NGỰC ÔM VIỀN LƯỢN SÓNG TUA RUA', 1, 0, 0, '2024-10-29 16:29:24', NULL, 0),
(13, 'HELIAS013', 'JIONGLI quần ống rộng quần nữ jean Cute Fashion Casual ', 'helias-quan-01_1.webp', 'helias-quan-01_2.webp', 'Chào mừng đến với cửa hàng của chúng tôi.\r\n  - Theo dõi cửa hàng để nhận phiếu giảm giá ”◕‿◕｡\r\n\r\n  - Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi Lời khen ngợi năm sao\r\n\r\n  - Sản phẩm đến từ Trung Quốc và mất một thời gian để vận chuyển\r\n\r\n  - Phải mặc! Phổ biến vào năm 2023!\r\n\r\n  - Được làm bằng chất liệu cao cấp, đủ bền để bạn mặc hàng ngày!\r\n\r\n  - Thật thoải mái Chất liệu vải mềm mại, hình dáng đẹp, chất lượng tốt.❣️\r\n\r\n  - Thiết kế đẹp, sang trọng, độc đáo.❣️\r\n\r\n  - Nó là một món quà tốt cho người yêu của bạn hoặc chính bạn.❣️\r\n\r\n  - Chất lượng và giá cả như thế này không thể tìm thấy ở bất kỳ nơi nào khác, rất đáng đồng tiền. ️❣️\r\n\r\n  - Do các thiết bị hiển thị và chiếu sáng khác nhau, hình ảnh có thể không phản ánh màu sắc thực tế của tất cả các sản phẩm. Cảm ơn bạn đã thông cảm ❣️\r\n\r\n  - Đánh giá 1 hoặc 2 sao không có lý do / hình minh họa. hoặc đặt điều gì đó không đúng sự thật làm hỏng danh tiếng của shop shop sẽ không giúp gì cả vì bạn được coi là đang vào vì lợi ích của Shop, đặc biệt cảm ơn quý khách hàng đã có nhu cầu vui lòng đặt hàng hoặc yêu cầu thêm thông tin tin tin nhé ️', 1, 230000, 0, 200, 1, 13, 'quan-dai-y2k-1', 'JIONGLI quần ống rộng quần nữ jean Cute Fashion Casual Thời trang WNK23C0NE4 52Z231227', 1, 0, 0, '2024-10-29 16:35:51', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE `product_color` (
  `ID` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `color_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_color`
--

INSERT INTO `product_color` (`ID`, `product_id`, `color_id`, `color_image`) VALUES
(1, 1, 3, 'helias01_3.webp'),
(2, 1, 4, 'helias01_1.webp'),
(3, 1, 5, 'helias01_2.webp'),
(4, 2, 1, 'helias02_1.webp'),
(5, 2, 2, 'helias02_2.webp'),
(6, 3, 6, 'helias-dam-02_1.webp'),
(7, 3, 7, 'helias-dam-02_2.webp'),
(8, 4, 2, 'helias-ao-01_1.webp'),
(9, 4, 8, 'helias-ao-01_3.webp'),
(10, 4, 9, 'helias-ao-01_2.webp'),
(11, 5, 4, 'helias-ao-02_2.webp'),
(12, 5, 1, 'helias-ao-02_1.webp'),
(13, 5, 5, 'helias-ao-02_3.webp'),
(14, 6, 1, 'helias-ao-03_1.webp'),
(15, 6, 5, 'helias-ao-03_2.webp'),
(16, 7, 10, 'helias-ao-04_1.webp'),
(17, 7, 4, 'helias-ao-04_3.webp'),
(18, 7, 5, 'helias-ao-04_2.webp'),
(19, 8, 5, 'helias-dam-03_1.webp'),
(20, 9, 11, 'helias-vay-02_1.webp'),
(21, 10, 12, 'helias-giay-01_2.webp'),
(22, 10, 5, 'helias-giay-01_1.webp'),
(23, 11, 13, 'helias-phukien-01_1.webp'),
(24, 11, 14, 'helias-phukien-01_2.webp'),
(25, 12, 2, 'helias-dam-04_1.webp'),
(26, 13, 11, 'helias-quan-01_1.webp');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_link` varchar(255) NOT NULL,
  `image_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`image_id`, `product_id`, `image_link`, `image_name`) VALUES
(1, 1, 'helias01_1.webp', 'helias Sản phẩm 1'),
(2, 1, 'helias01_2.webp', 'helias sản phẩm 1'),
(3, 1, 'helias01_3.webp', 'helias sản phẩm 1'),
(4, 1, 'helias01_4.webp', 'helias sản phẩm 1'),
(5, 2, 'helias02_1.webp', 'helias sản phẩm 2'),
(6, 2, 'helias02_2.webp', 'helias sản phẩm 2'),
(7, 3, 'helias-dam-02_1.webp', 'helias sản phẩm 3'),
(8, 3, 'helias-dam-02_2.webp', 'helias sản phẩm 3'),
(9, 4, 'helias-ao-01_1.webp', 'Sản phẩm áo 1'),
(10, 4, 'helias-ao-01_2.webp', 'Sản phẩm áo 2'),
(11, 4, 'helias-ao-01_3.webp', 'Sản phẩm áo 3'),
(12, 5, 'helias-ao-02_1.webp', 'Sản phẩm áo 2'),
(13, 5, 'helias-ao-02_2.webp', 'Sản phẩm áo 2'),
(14, 5, 'helias-ao-02_3.webp', 'Sản phẩm áo 3'),
(15, 6, 'helias-ao-03_1.webp', 'Sản phẩm áo 3'),
(16, 6, 'helias-ao-03_2.webp', 'Sản phẩm áo 3'),
(17, 7, 'helias-ao-04_1.webp', 'Sản phẩm áo 4'),
(18, 7, 'helias-ao-04_2.webp', 'Sản phẩm áo 4'),
(19, 7, 'helias-ao-04_3.webp', 'Sản phẩm áo 4'),
(20, 8, 'helias-dam-03_1.webp', 'Sản phẩm đầm 3'),
(21, 8, 'helias-dam-03_2.webp', 'Sản phẩm đầm 3'),
(22, 9, 'helias-vay-02_1.webp', 'Sản phẩm váy 2'),
(23, 9, 'helias-vay-02_2.webp', 'Sản phẩm váy 2'),
(26, 10, 'helias-giay-01_1.webp', 'Sản phẩm giày 1'),
(27, 10, 'helias-giay-01_2.webp', 'Sản phẩm giày 1'),
(28, 11, 'helias-phukien-01_1.webp', 'sản phẩm phụ kiện 1'),
(29, 11, 'helias-phukien-01_2.webp', 'sản phẩm phụ kiện 1'),
(30, 12, 'helias-dam-04_1.webp', 'Sản phẩm đầm 4'),
(31, 12, 'helias-dam-04_2.webp', 'Sản phẩm đầm 4'),
(32, 13, 'helias-quan-01_1.webp', 'Sản phẩm quần 1'),
(33, 13, 'helias-quan-01_2.webp', 'Sản phẩm quần 1');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status_name`) VALUES
(1, 'Chờ xác nhận'),
(2, 'Chờ đóng gói'),
(3, 'Đang giao'),
(4, 'Đã giao'),
(5, 'Đã hủy');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `sub` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `sub`, `user_name`, `phone`, `address`, `email`, `password`, `gender`, `created_at`, `updated_at`, `deleted`) VALUES
(4, NULL, 'Đặng Quốc Huy', '0367048004', '123 đs 2, Tân Bình, TP Hồ Chí Minh', 'huy2@gmail.com', '$2b$10$Je/P3yyju6qO/OjrZTnNjOnWAV6S6ie631/ZvJ8BWGFYf73hl7Ina', 0, '2024-10-02 15:55:00', NULL, 0),
(5, NULL, 'Kim Hiền', '', '123, Tân Phú, TP Hồ Chí Minh', 'kimhien@gmail.com', '$2b$10$tlU6CcpCDSKXk4uOY5AjturDAy4vu8eSrK4wdMkJLjksWmHNLDqgK', 0, '2024-10-02 16:03:08', NULL, 0),
(7, NULL, 'Kim Hân', '0354781002', '0', 'kimhan@gmail.com', '$2b$10$nWAQ0bjSo.5NPrEoDnvYZ.joPZ4oTl4/Zmu0E4wsRo02H5uGI8Zku', 0, '2024-10-02 16:20:43', NULL, 0),
(18, NULL, 'Thanh Hải', '0367048004', NULL, 'hai@gmail.com', '$2b$10$lpdAeo1M0BouIT2aweEtceBZDQCslp1B553ql9MZnKslzlWalnu9G', 0, '2024-10-20 17:03:35', NULL, 0),
(20, '108875056811190901715', 'Hiền Mai Thị Kim', '', '123 đs 2, Phú Nhuận, TP Hồ Chí Minh', 'hienmtk.info2023@gmail.com', '', 0, '2024-10-25 05:28:59', NULL, 0),
(21, '102569980545678107646', 'Mai Thị Kim Hiền', '', '123 Phường 23, Cẩm Lệ, Đà Nẵng', 'hienmtk.info2022@gmail.com', '', 0, '2024-10-25 17:06:10', NULL, 0),
(23, NULL, 'Thanh Hải', '', '123 Đs2, Phú Nhuận, TP Hồ Chí Minh', 'hai123@gmail.com', '$2b$10$Wr7txHHzaazSDXf9jcgw4O0BGKRlvBHoyaX5et.4zz1CdmvRP8S.a', 0, '2024-11-13 09:07:38', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`collection_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`orderDetail_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `collection`
--
ALTER TABLE `collection`
  MODIFY `collection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `orderDetail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
