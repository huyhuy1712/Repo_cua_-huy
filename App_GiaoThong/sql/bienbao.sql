-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2025 at 08:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bienbao`
--

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id_user` int(11) NOT NULL,
  `id_sign` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sign`
--

CREATE TABLE `sign` (
  `id_sign` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `sign` (`id_sign`, `name`, `image`, `type`, `description`) VALUES
	(1, 'Biển báo đường cấm', 'bien-bao-cam-101-1590224675-width234height234.jpg', 1, 'Biển báo đường cấm là biển báo cấm tất cả các phương tiện tham gia giao thông đi lại cả hai hướng, trừ xe ưu tiên theo luật quy định.'),
	(2, 'Biển báo cấm đi ngược chiều', 'bien-bao-cam-102-1590225023-width234height234.jpg', 1, 'cấm tất cả các phương tiện tham gia giao thông đi vào theo chiều đặt biển.'),
	(3, 'Biển báo cấm ô tô ( Cấm cả xe mô tô 3 bánh)', 'bien-bao-cam-103a-1590225067-width232height232.jpg', 1, 'biển báo đường cấm tất cả các loại xe cơ giới kể cả mô tô 3 bánh có thùng đi qua, trừ xe mô tô 2 bánh, xe gắn máy ( kể cả xe máy điện) và các xe được ưu tiên theo luật giao thông đường bộ.'),
	(4, 'Biển cấm ô tô rẽ phải', 'bien-bao-cam-103b-1590225119-width232height232.jpg', 1, 'biển báo đường cấm xe ô tô rẽ phải ( Kể cả xe mô tô ba bánh ) trừ các xe được ưu tiên theo luật giao thông đường bộ.'),
	(5, 'Biển cấm ô tô rẽ trái', 'bien-bao-cam-103c-1590225178-width232height232.jpg', 1, 'biển báo đường cấm xe ô tô rẽ trái và được phép quay đầu xe,  trừ các xe được ưu tiên theo luật giao thông đường bộ.'),
	(6, 'Biển Cấm xe máy ( Cấm mô tô 2 và 3 bánh)', 'bien-bao-cam-104-1590225230-width236height235.jpg', 1, 'biển báo đường cấm tất cả các loại xe máy và mô tô đi qua, trừ các loại xe được ưu tiên theo luật giao thông đường bộ.'),
	(7, 'Biển Cấm mô tô và ô tô', 'bien-bao-cam-105-1590225270-width233height233.jpg', 1, 'biển báo đường cấm tất cả các loại xe cơ giới và xe mô tô đi qua trừ xe gắn máy và xe được ưu tiên theo luật giao thông đường bộ.'),
	(8, 'Biển báo cấm ô tô tải', 'bien-bao-cam-106a-1590225309-width220height220.jpg', 1, ' biển báo đường cấm tất cả các loại xe ô tô tải trừ các xe được ưu tiên theo luật giao thông đường bộ, hiệu lực cấm với kẻ xe máy kéo và xe máy chuyên dùng.'),
	(9, 'Biển Cấm ô tô tải theo trọng lượng', 'bien-bao-cam-106b-1590225342-width220height220.jpg', 1, 'biển đường cấm trọng lượng của xe ô tô tải được tính theo tấn ghi trên biển đi vào.'),
	(10, 'Biển Cấm ô tô tải chở hàng nguy hiểm', 'bien-bao-cam-106c-1590225446-width220height220.jpg', 1, 'Biển báo  cấm tất cả các loại xe ô tô tải chở hàng nguy hiểm.'),
	(11, 'Biển Cấm ô tô khách và ô tô tải', 'bien-bao-cam-107-1590225491-width220height220.jpg', 1, 'biển báo đường cấm ô tô khách và các loại xe ô tô tải kể cả máy kéo và xe máy chuyên dùng đi qua, trừ các loại xe được ưu tiên theo luật giao thông đường bộ.'),
	(12, 'Biển cấm ô tô khách', 'com.waterfall.trafficlaws2_Screenshot_2021.10.13_11.58-768x283-1.jpg', 1, ' biển báo đường cấm ô tô chở khách đi qua trừ các xe ưu tiên theo quy định. Biển này không cấm xe buýt.'),
	(13, 'Biển Cấm xe Taxi', 'com.waterfall.trafficlaws2_Screenshot_2021.10.13_11.58-1.jpg', 1, 'biển báo đường cấm ô tô taxi đi lại. Trường hợp cấm xe ô tô taxi theo giờ thì đặt biển phụ ghi cấm giờ.'),
	(14, 'Biển Cấm ô tô kéo rơ moóc', 'bien-bao-cam-108-1590225526-width233height233.jpg', 1, 'biển báo đường cấm tất cả các loại xe cơ giới kéo theo rơ moóc kể cả xe mô tô, máy kéo, xe ô tô khách kéo theo rơ moóc đi qua, trừ các loại xe ô tô sơ mi rơ moóc và các xe được ưu tiên theo luật giao thông đường bộ ( có kéo theo rơ moóc ).'),
	(15, 'Cấm xe sơ- mi- rơ- moóc', 'com.waterfall.trafficlaws2_Screenshot_2021.10.13_11.59.jpg', 1, 'biển báo đường cấm các loại xe sơ- mi- rơ- moóc và các xe kéo rơ- moóc trừ các xe được ưu tiên ( có dạng xe sơ- mi- rơ- moóc hoặc có kéo theo rơ- moóc) theo quy định'),
	(16, ' Cấm máy kéo', 'bien-bao-cam-109-1590225560-width224height224.jpg', 1, 'biển báo đường cấm tất cả các loại máy kéo, kể cả máy kéo bánh hơi và bánh xích đi qua.'),
	(17, 'Biển cấm xe đạp', 'bien-bao-cam-110a-1590225588-width224height224.jpg', 1, 'biến báo đường cấm xe đạp đi qua. Biết này không có giá trị cấm tất cả những người dắt xe đạp đi qua.'),
	(18, 'Biển  Cấm xe đạp thồ', 'bien-bao-cam-110b-1590225637-width224height224.jpg', 1, 'biển báo đường cấm xe đạp thồ đi qua. Biển này không có giá trị cấm người dắt loại xe này.'),
	(19, 'Biển Cấm xe gắn máy', 'bien-bao-cam-111a-1590225675-width224height224.jpg', 1, 'biển báo đường cấm xe gắn máy dưới 50 cm3 đi qua. Biển không có giá trị cấm đối với xe đạp, xe máy, moto và các xe ô tô cùng với các xe ưu tiên.'),
	(20, 'Biển Cấm xe ba bánh loại có động cơ', 'bien-bao-cam-111b-1590225713-width220height220.jpg', 1, 'biển báo đường cấm xe ba bánh loại có động cơ như xe lam, xích lô máy v.v… đi vào.'),
	(21, ' Biển cấm các loại xe kéo', 'bien-bao-cam-111c-1590225766-width224height224.jpg', 1, 'biển báo đường cấm tất cả các xe gắn máy hai bánh kéo thêm bất cứ thứ gì ở đằng sau và có hiệu lực cấm cả xe ba bánh có động cơ đi vào.'),
	(22, 'Cấm xe ba bánh loại không có động cơ', 'bien-bao-cam-111d-1590225801-width224height224.jpg', 1, 'biển báo đường cấm các loại  xe ba bánh, kể cả xe tự chế thô sơ loại không có động cơ như xích lô, xe lôi đạp v.v… không được phép đi vào.'),
	(23, 'Biển  Cấm người đi bộ', 'bien-bao-cam-112-1590225867-width224height224.jpg', 1, 'biển báo đường cấm người đi bộ đi qua lại.'),
	(24, 'Cấm xe người kéo, đẩy', 'bien-bao-cam-113-1590225894-width231height231.jpg', 1, 'biển báo đường cấm xe người kéo đẩy đi qua. Biển không có giá trị cấm những xe nôi của trẻ em và phương tiện chuyên dùng để đi lại của những người khuyết tật ( Xe lăn)'),
	(25, 'Cấm xe súc vật kéo', 'bien-bao-cam-114-1590225925-width231height231.jpg', 1, ' biển báo đường cấm xe súc vật vận tải hàng hóa hoặc hành khách dù kéo hay trở trên lưng đi qua.'),
	(26, 'Hạn chế trọng lượng xe', 'bien-bao-cam-115-1590225956-width220height220.jpg', 1, 'biển báo đường cấm tất cả các loại phương tiện giao thông đường bộ kể cả các xe được ưu tiên theo luật giao thông đường bộ có trọng lượng toàn bộ ( cả xe và hàng) vượt quá chỉ số ghi trên biển tính bằng tấn đi qua.'),
	(27, 'Hạn chế trọng lượng trên trục xe', 'bien-bao-cam-116-1590225990-width220height220.jpg', 1, 'biển báo đường cấm tất cả các loại phương tiện giao thông đường bộ, kể cả các xe được ưu tiên theo luật giao thông đường bộ có trọng lượng toàn bộ( cả xe và hàng) phân bố trên 1 trục bất kỳ của xe vượt quá trị số ghi trên biển tính bằng tấn đi qua.'),
	(28, ' Hạn chế chiều cao', 'bien-bao-cam-117-1590226025-width224height224.jpg', 1, 'Biển này có hiệu lực cấm tất cả các loại phương tiện giao thông đường bộ đi qua, kể cả các xe được ưu tiên theo luật giao thông đường bộ có chiều cao ( tính đến điểm cao nhất cả xe và hàng hóa) vượt quá chỉ số ghi trên biển tính bằng mét đi qua.'),
	(29, 'Hạn chế chiều ngang', 'bien-bao-cam-118-1590226063-width222height222.jpg', 1, 'Biển này có hiệu lực cấm tất cả các loại phương tiện giao thông đường bộ đi qua, kể cả các xe được ưu tiên theo luật giao thông đường bộ có chiều ngang ( cả xe và hàng hóa) vượt quá chỉ số ghi trên biển tính bằng mét đi qua.'),
	(30, ' Hạn chế chiều dài của ô tô', 'bien-bao-cam-119-1590226099-width232height232.jpg', 1, 'biển báo đường cấm tất cả các loại xe ( cơ giới và thô sơ), kể cả các loại xe được ư tiên theo luật giao thông đường bộ, có độ dài toàn bộ ( cả xe và hàng ) vượt quá trị số ghi trên biển tính bằng mét đi qua.'),
	(31, 'Hạn chế chiều dài ô tô kéo moóc', 'bien-bao-cam-120-1590226133-width232height232.jpg', 1, 'biển báo đường cấm các loại phương tiện giao thông đường bộ kéo theo rơ moóc kể cả ô tô sơ mi rơ moóc và các xe được ưu tiên theo luật giao thông đường bộ kéo theo rơ moóc có độ dài toàn bộ ( cả xe, rơ moóc và hàng ) vượt quá trị số ghi trên biển đi qua.'),
	(32, '. Cự ly tối thiểu giữa hai xe', 'bien-bao-cam-121-1590227001-width232height232.jpg', 1, ' biển báo xe ô tô phải đi cách nhau 1 khoảng tối thiểu. Biển này có hiệu lực cấm các xe ô tô không được đi cách nhau với cự ly nhỏ hơn trị số ghi trên biển tính bằng mét, kể cả các xe được ưu tiên theo luật giao thông đường bộ.'),
	(33, 'Dừng lại', 'bien-bao-cam-122-1590227036-width227height227.jpg', 1, 'biển báo đường buộc các loại xe cơ giới và thô sơ kể cả xe được ưu tiên theo quy định dừng lại trước biển hoặc trước vạch ngang đường và chỉ được phép đi khi thấy các tín hiệu (do người điều khiển giao thông hoặc đèn cờ) cho phép đi. Trong trường hợp trên đường không đặt tín hiệu đèn cờ, không có người  điều khiển giao thông hoặc các tín hiệu đèn không bật sáng thì người lái xe chỉ được phép đi khi trên đường không còn nguy cơ mất an toàn giao thông.'),
	(34, 'Cấm rẽ trái', 'bien-bao-cam-123a-1590227077-width231height231.jpg', 1, ' biển báo đường cấm các loại xe (cơ giới và thô sơ) rẽ sang phía trái ở những vị trí đường giao nhau trừ các xe được ưu tiên theo quy định. '),
	(35, 'Cấm rẽ phải', 'bien-bao-cam-123b-1590227121-width231height231.jpg', 1, ' biển báo đường cấm các loại xe (cơ giới và thô sơ) rẽ sang phía trái ở những vị trí đường giao nhau trừ các xe được ưu tiên theo quy định.'),
	(36, 'Cấm quay xe đầu xe', 'bien-bao-cam-124a-1590227155-width231height231.jpg', 1, 'Có tác dụng cấm các loại xe cơ giới và thô sơ quay đầu (theo kiểu chữ U) trừ các xe được ưu tiên theo quy định. Biển này không cấm các phương tiện rẽ trái.'),
	(37, ' Cấm rẽ trái và quay đầu xe', 'com.waterfall.trafficlaws2_Screenshot_2021.10.14_11.33-300x286-1.jpg', 1, 'biển báo đường cấm các loại xe rẽ trái và đồng thời cấm quay đầu, trừ các loại xe được ưu tiên theo luật giao thông đường bộ.'),
	(38, 'Cấm rẽ phải và quay đầu xe', 'com.waterfall.trafficlaws2_Screenshot_2021.10.14_11.33-1-300x263-1.jpg', 1, 'biển báo đường cấm các loại xe rẽ phải và đồng thời cấm quay đầu, trừ các loại xe được ưu tiên theo luật giao thông đường bộ.'),
	(39, ' Cấm ô tô quay đầu xe', 'bien-bao-cam-124b-1590227193-width231height231.jpg', 1, ' biển báo đường cấm xe ô tô và mô tô 3 bánh quay đầu (theo kiểu chữ U), trừ các xe được ưu tiên theo quy định. Biển này không cấm rẽ trái.'),
	(40, 'Cấm ô tô rẽ trái và quay đầu xe', 'com.waterfall.trafficlaws2_Screenshot_2021.10.14_11.23.jpg', 1, ' biển báo cấm ô tô rẽ trái và đồng thời cấm quay đầu sang phải, trừ các xe được ưu tiên theo luật giao thông đường bộ.'),
	(41, 'Cấm ô tô rẽ phải và quay đầu xe', 'com.waterfall.trafficlaws2_Screenshot_2021.10.14_11.23-1.jpg', 1, 'biển báo cấm ô tô rẽ trái và đồng thời cấm quay đầu sang trái, trừ các xe được ưu tiên theo luật giao thông đường bộ.'),
	(42, 'Cấm vượt', 'bien-bao-cam-125-1590227234-width233height233.jpg', 1, 'biển cấm đường có hiệu lực cấm tất cả các xe cơ giới vượt nhau, kể cả các xe được ưu tiên theo luật giao thông đường bộ. Biển này cho phép vượt các xe mô tô 2 bánh, xe gắn máy.'),
	(43, 'Cấm ô tô tải vượt', 'bien-bao-cam-126-1590227267-width233height233.jpg', 1, 'biển báo đường có hiệu lực cấm các loại ô tô tải có khối lượng chuyên chở ( theo giấy chứng nhận kiểm định an toàn kỹ thuật và bảo vệ môi trường phương tiện giao thông cơ giới đường bộ ) lớn hơn 3.500kg ( 3,5 tấn) kể cả các xe được ưu tiên theo quy định vượt xe cơ giới khác. Biển này cho phép vượt xe máy 2 bánh và xe gắn máy. Biển này không có giá trị cấm các loại xe cơ giới khác vượt nhau và vượt xe ô tô tải.'),
	(44, ' Tốc độ tối đa cho phép', 'bien-bao-cam-127-1590227300-width233height233.jpg', 1, 'biển báo đường có hiệu lực cấm tất cả các loại xe cơ giới đường bộ chạy với tốc độ tối đa vượt quá trị số ghi trên biển ( tính bằng km/h) trừ các xe được ưu tiên theo luật giao thông đường bộ.'),
	(45, 'Tốc độ tối đa cho phép vào ban đêm', 'com.waterfall.trafficlaws2_Screenshot_2021.10.14_15.26.jpg', 1, 'biển cấm đường có hiệu lực cấm tất cả các xe cơ giới đường bộ chạy vào ban đêm với tốc đa và không vượt quá giá trị trên biển ( tính bằng km/h), trừ một số trường hợp ưu tiên được quy định. biển này chỉ áp dụng cấm theo thời gian bắt đầu và kết thúc ghi trên biển.'),
	(46, 'Tốc độ tối đa trên từng làn đường', 'com.waterfall.trafficlaws2_Screenshot_2021.10.14_15.26-1.jpg', 1, 'Đây là biển ghép quy định tốc độ tối đa cho phép trên từng làn đường và không vượt quá tốc độ ghi trên biển.'),
	(47, 'Biển hết hạn chế tốc độ tối đa', 'com.waterfall.trafficlaws2_Screenshot_2021.10.14_15.26-2.jpg', 1, ' Đây là biển hết hạn chế tốc độ tối đa theo biển.'),
	(48, ' Cấm bóp còi', 'bien-bao-cam-128-1590227331-width233height233.jpg', 1, 'đây là biển báo đường cấm các loại xe cơ giới sử dụng còi khi di chuyển'),
	(49, 'Kiểm Tra', 'bien-bao-cam-129-1590227360-width233height233.jpeg', 1, 'Biển báo này giúp thông báo cho người điều khiển phương tiện tham gia giao thông biết nơi có đặt trạm kiểm tra, các loại phương tiện vận tải qua đó phải dừng lại để làm thủ tục kiểm tra, kiểm soát theo quy định.'),
	(50, ' Cấm dừng và đỗ xe', 'bien-bao-cam-130-1590227395-width233height233.jpeg', 1, ' biển cấm có hiệu lực cấm tất cả các xe cơ giới đừng bộ dừng lại và đỗ lại ở đường nơi đặt biển.'),
	(51, 'Cấm đỗ xe', 'bien-bao-cam-131a-1590227429-width233height233.jpeg', 1, 'Cấm các loại xe cơ giới đỗ ở đường nơi có đặt biển bất kể ngày nào.'),
	(52, 'Cấm đỗ xe ngày lẻ', 'bien-bao-cam-131b-1590227458-width233height233.jpg', 1, 'Cấm các loại xe cơ giới đỗ ở đường nơi có đặt biển vào những ngày lẻ.'),
	(53, 'Cấm đỗ xe ngày chẵn', 'bien-bao-cam-131c-1590227488-width231height231.jpg', 1, 'Cấm các loại xe cơ giới đỗ ở đường nơi có đặt biển vào những ngày chẵn.'),
	(54, 'Nhường đường cho xe ngược chiều đi qua đường hẹp', 'bien-bao-cam-132-1590227521-width232height232.jpg', 1, 'biển báo cho các loại phương tiện giao thông đường bộ ( cơ giới và thô sơ ), kể cả các xe được ưu tiên theo luật giao thông đường bộ đi theo chiều nhìn thấy biển phải nhường đường cho các loại xe cơ giới đi theo chiều ngược lại khi đi qua các đoạn đường và cầu hẹp.'),
	(55, 'Hết cấm vượt', 'bien-bao-cam-133-1590227557-width233height233.jpg', 1, 'Đây là biển thông báo cho người lái xe hết hiệu lực cấm vượt nhau ở biển 42 và 43, dành cho cả ô tô, xe tải và các xe ưu tiên đều có thể vượt.'),
	(56, 'Hết hạn chế tốc độ tối đa', 'bien-bao-cam-134-1590227586-width233height233.jpg', 1, 'Biết này thông báo cho người lái xe biết hết hiểu lực của biển (44) tốc độ tối đa cho phép đã hết tác dụng. Người lái xe có thể lái xe tốc độ tối đa cho phép theo quy định của luật giao thông đường bộ.'),
	(57, 'Hết toàn bộ lệnh cấm', 'bien-bao-cam-135-1590227615-width233height233.jpg', 1, 'Thông báo hết hiệu lực đối với các biển ( cự ly tối thiểu giữa hai xe) và từ biển 42 đến biển 52 đặt trước đó cũng hết tác dụng.'),
	(58, 'Cấm đi thẳng', 'bien-bao-cam-136-1590227643-width231height231.jpg', 1, 'đây là biển báo đường đặt trước nơi giao nhau và có hiệu lực cấm tất cả các loại phương tiện giao thông đường bộ ( cơ giới và thô sơ ) đi thẳng ở nơi đường giao nhau.'),
	(59, 'Cấm rẽ trái và phải', 'bien-bao-cam-137-1590227673-width231height231.jpg', 1, 'đây là biển báo đường đặt trước nơi giao nhau và có hiệu lực cấm tất cả các loại phương tiện giao thông đường bộ ( cơ giới và thô sơ ) rẽ trái và phải ở nơi đường giao nhau.'),
	(60, 'Cấm đi thẳng và rẽ trái', 'bien-bao-cam-138-1590227704-width231height231.jpg', 1, 'Có tác dụng khi đặt trước nơi giao nhau và có hiệu lực cấm tất cả các loại phương tiện giao thông đường bộ ( cơ giới và thô sơ ) đi thẳng và rẽ trái ở nơi đường giao nhau.'),
	(61, 'Cấm đi thẳng và rẽ Phải', 'bien-bao-cam-139-1590227736-width231height231-1.jpg', 1, 'Có tác dụng khi đặt trước nơi giao nhau và có hiệu lực cấm tất cả các loại phương tiện giao thông đường bộ ( cơ giới và thô sơ ) đi thẳng và rẽ phải ở nơi đường giao nhau.'),
	(62, 'Biển cấm xe công nông và các loại xe tương tự', 'bien-bao-cam-140-1590227767-width235height235.jpg', 1, 'Có tác dụng cấm tất cả các loại xe công nông và các loại xe tương tự đi qua.'),
	(63, 'Biển cấm theo giờ', 'com.waterfall.trafficlaws2_Screenshot_2021.10.14_16.32-768x297-1.jpg', 1, 'Có tác dụng cấm tất cả các loại phương tiện giao thông đường bộ theo giờ trong thành phố, thị xã thì phải đặt biển phụ 63 và 64 dưới biển cấm, và có chú thích bằng tiếng việt, phụ đề tiếng anh trong biển này nếu cần.'),
	(64, 'Cấm theo giờ', 'com.waterfall.trafficlaws2_Screenshot_2021.10.14_16.38.jpg', 1, 'Khi cần báo hiệu cấm tất cả các loại phương tiện giao thông đường bộ theo giờ trong thành phố, thị xã thì phải đặt biển phụ 63 và 64 dưới biển cấm, và có chú thích bằng tiếng việt, phụ đề tiếng anh trong biển này nếu cần.'),
	(65, 'Biển số 201a ', '201a_1809093946.jpg', 2, '“Chỗ ngoặt nguy hiểm vòng bên trái”, báo trước sắp đến một chỗ ngoặt nguy hiểm phía bên trái.'),
	(66, 'Biển số 201b', '201b_1809100952.jpg', 2, '“chỗ ngoặt nguy hiểm vòng bên phải”, báo trước sắp đến một chỗ ngoặt nguy hiểm phía bên phải.'),
	(67, 'Biển số W.201c', '201c_1809101644.jpg', 2, 'chỗ ngoặt nguy hiểm có nguy cơ lật xe bên phải khi đường cong vòng sang trái.'),
	(68, 'Biển số W.201d', '201d_1809101644.jpg', 2, 'chỗ ngoặt nguy hiểm có nguy cơ lật xe bên trái khi đường cong vòng bên phải.'),
	(69, 'Biển số 202a ', '202a_1809100953.jpg', 2, '“Nhiều chỗ ngoặt nguy hiểm liên tiếp”, báo trước sắp đến nhiều chỗ ngoặt nguy hiểm liên tiếp trong đó chỗ ngoặt đầu tiên hướng vòng bên trái.'),
	(70, 'Biển số 202b', '202b_1809100953.jpg', 2, '“Nhiều chỗ ngoặt nguy hiểm liên tiếp”, báo trước sắp đến nhiều chỗ ngoặt nguy hiểm liên tiếp trong đó chỗ ngoặt đầu tiên hướng vòng bên phải.'),
	(71, 'Biển số 203a', '203a_1809100953.jpg', 2, '“Đường bị hẹp cả hai bên”, báo trước sắp đến một đoạn đường bị hẹp đột ngột cả hai bên.'),
	(72, 'Biển số 203b', '203b_1809100953.jpg', 2, '“Đường bị hẹp về phía trái”, báo trước sắp đến một đoạn đường bị hẹp đột ngột phía bên trái.'),
	(73, 'Biển số 203c', '203c_1809100953.jpg', 2, '“Đường bị hẹp về phía phải”, báo trước sắp đến một đoạn đường bị hẹp đột ngột phía bên phải.'),
	(74, 'Biển số 204 ', '204_1809100953.jpg', 2, '“Đường hai chiều”, báo trước sắp đến đoạn đường do sửa chữa hoặc có trở ngại ở một phía đường mà phải tổ chức đi lại cho phương tiện cả hai chiều trên phía đường còn lại hoặc để báo trước đoạn đường đôi tạm thời hoặc đoạn đường có chiều xe đi và về đi chung.'),
	(75, 'Biển số 205a', '205a_1809100953.jpg', 2, '“Đường giao nhau cùng cấp”, báo trước sắp đến nơi giao nhau cùng mức của các tuyến đường cùng cấp (không có đường nào ưu tiên)  trên cùng một mặt bằng.'),
	(76, 'Biển số 205b', '205b_1809100953.jpg', 2, '“Đường giao nhau cùng cấp”, báo trước sắp đến nơi giao nhau cùng mức của các tuyến đường cùng cấp (không có đường nào ưu tiên)  trên cùng một mặt bằng.'),
	(77, 'Biển số 205c', '205c_1809100953.jpg', 2, '“Đường giao nhau cùng cấp”, báo trước sắp đến nơi giao nhau cùng mức của các tuyến đường cùng cấp (không có đường nào ưu tiên)  trên cùng một mặt bằng.'),
	(78, 'Biển số 205d', '205d_1809100953.jpg', 2, ' “Đường giao nhau cùng cấp”, báo trước sắp đến nơi giao nhau cùng mức của các tuyến đường cùng cấp (không có đường nào ưu tiên)  trên cùng một mặt bằng.'),
	(79, 'Biển số 205e', '205e_1809100953.jpg', 2, 'Đường giao nhau cùng cấp”, báo trước sắp đến nơi giao nhau cùng mức của các tuyến đường cùng cấp (không có đường nào ưu tiên)  trên cùng một mặt bằng.'),
	(80, 'Biển số 206 ', '206_1809100953.jpg', 2, 'Giao nhau chạy theo vòng xuyến”, báo trước nơi giao nhau có bố trí đảo an toàn ở giữa nút giao, các loại xe qua nút giao phải đi vòng xuyến quanh đảo an toàn theo chiều mũi tên.'),
	(81, 'Biển số 207a', '207a_1809100953.jpg', 2, '“Giao nhau với đường không ưu tiên”, báo trước sắp đến nơi giao nhau với đường không ưu tiên.'),
	(82, 'Biển số 207b ', '207b_1809100953.jpg', 2, '“Giao nhau với đường không ưu tiên”, báo trước sắp đến nơi giao nhau với đường không ưu tiên.'),
	(83, 'Biển số 207c', '207c_1809100953.jpg', 2, '“Giao nhau với đường không ưu tiên”, báo trước sắp đến nơi giao nhau với đường không ưu tiên.'),
	(84, 'Biển số 207d', '207d_1809100954.jpg', 2, '“Giao nhau với đường không ưu tiên”, báo trước sắp đến nơi giao nhau với đường không ưu tiên.'),
	(85, 'Biển số 207e', '207e_1809100954.jpg', 2, '“Giao nhau với đường không ưu tiên”, báo trước sắp đến nơi giao nhau với đường không ưu tiên.'),
	(86, 'Biển số 207f', '207f_1809100954.jpg', 2, '“Giao nhau với đường không ưu tiên”, báo trước sắp đến nơi giao nhau với đường không ưu tiên.'),
	(87, 'Biển số 207g', '207g_1809100954.jpg', 2, '“Giao nhau với đường không ưu tiên”, báo trước sắp đến nơi giao nhau với đường không ưu tiên.'),
	(88, 'Biển số 207h', '207h_1809100954.jpg', 2, '“Giao nhau với đường không ưu tiên”, báo trước sắp đến nơi giao nhau với đường không ưu tiên.'),
	(89, 'Biển số 207i', '207i_1809100954.jpg', 2, 'Giao nhau với đường không ưu tiên”, báo trước sắp đến nơi giao nhau với đường không ưu tiên.'),
	(90, 'Biển số 207k', '207k_1809100954.jpg', 2, '“Giao nhau với đường không ưu tiên”, báo trước sắp đến nơi giao nhau với đường không ưu tiên.'),
	(91, 'Biển số 208', '208_1809100954.jpg', 2, '“Giao nhau với đường ưu tiên”, để báo trước sắp đến nơi giao nhau với đường ưu tiên.'),
	(92, 'Biển số 209', '209_1809100954.jpg', 2, '“Giao nhau có tín hiệu đèn”, báo trước nơi giao nhau có điều khiển giao thông bằng tín hiệu đèn trong trường hợp người lái xe khó quan sát để kịp thời xử lý.'),
	(93, 'Biển số 210', '210_1809100954.jpg', 2, '” Giao nhau với đường sắt có rào chắn”, báo trước sắp đến chỗ giao nhau giữa đường bộ và đường sắt có rào chắn kín hay rào chắn nửa kín và có nhân viên ngành đường sắt điều khiển giao thông.'),
	(94, 'Biển số 211a', '211a_1809100954.jpg', 2, '“Giao nhau với đường sắt không có rào chắn”, báo trước sắp đến chỗ giao nhau giữa đường bộ và đường sắt không có rào chắn, không có người điều khiển giao thông.'),
	(95, 'Biển số 211b', '211b_1809100954.jpg', 2, '“Giao nhau với đường tàu điện”, chỉ nơi đường bộ giao nhau cùng mức với đường tàu điện.'),
	(96, 'Biển số 212', '212_1809100954.jpg', 2, '″Cầu hẹp”, báo trước sắp đến cầu hẹp là loại cầu có chiều rộng phần xe chạy nhỏ hơn hoặc bằng 4,5m.'),
	(97, 'Biển số 213', '213_1809100954.jpg', 2, '“Cầu tạm”, báo trước sắp đến cầu tạm là loại cầu được làm để sử dụng tạm thời cho xe cộ qua lại.'),
	(98, 'Biển số 214', '214_1809100954.jpg', 2, '“Cầu quay-cầu cất”, báo phía trước gặp cầu xoay, cầu cất là loại cầu trong từng thời gian có cắt giao thông đường bộ bằng cách quay hoặc nâng nhịp thông thuyền để cho tàu thuyền qua lại. Các phương tiện đi trên đường bộ phải dừng lại chờ đợi.'),
	(99, 'Biển số 215a ', '215_1809100954.jpg', 2, '“Kè, vực sâu phía trước”, báo trước sắp tới những vị trí có kè chắn vực sâu, hoặc sông suối đi sát đường, cần đề phòng tình huống nguy hiểm rơi xuống vực sâu hoặc sông suối (thường có ở những chỗ ngoặt nguy hiểm).'),
	(100, 'Biển số 215b', 'Screenshot-2022-01-10-113455.png', 2, '“Kè, vực sâu phía bên trái”, báo trước sắp tới những vị trí có kè chắn vực sâu, hoặc sông suối đi sát đường, cần đề phòng tình huống nguy hiểm rơi xuống vực sâu hoặc sông suối (thường có ở những chỗ ngoặt nguy hiểm).'),
	(101, 'Biển số 215c', 'Screenshot-2022-01-10-113425.png', 2, '“Kè, vực sâu phía bên phải”, báo trước sắp tới những vị trí có kè chắn vực sâu, hoặc sông suối đi sát đường, cần đề phòng tình huống nguy hiểm rơi xuống vực sâu hoặc sông suối (thường có ở những chỗ ngoặt nguy hiểm).'),
	(102, 'Biển số 216a', '216_1809100954.jpg', 2, '“Đường ngầm”, báo trước những vị trí có đường ngầm (đường tràn), oàn đường thường qua sông suối và khe cạn mà có nước có thể tràn qua thường xuyên khi có lũ.'),
	(103, 'Biển số 216b', 'Screenshot-2022-01-10-113347.png', 2, '“Đường ngầm có nguy cơ lũ quét”, báo trước những vị trí có đường ngầm (đường tràn), đoàn đường thường qua sông suối và khe cạn thường xuyên có lũ quét.'),
	(104, 'Biển số 217', '217_1809100955.jpg', 2, '“Bến phà”, báo trước sắp đến bến phà'),
	(105, 'Biển số 218', '218_1809100955.jpg', 2, '“Cửa chui”, để báo trước sắp đến đường có cổng chắn ngang, kiểu cổng như đường hầm, cổng thành, cầu vượt đường bộ dạng cầu vòm…'),
	(106, 'Biển số 219', '219_1809100955.jpg', 2, '“Dốc xuống nguy hiểm”, báo trước sắp tới đoạn đường xuống dốc nguy hiểm.'),
	(107, 'Biển số 220', 'Screenshot-2022-01-13-114845.png', 2, '“Dốc lên nguy hiểm”, báo trước sắp tới đoạn đường lên dốc nguy hiểm.'),
	(108, 'Biển số W.221a', '221a_1809100955.jpg', 2, '“Đường không bằng phẳng” để báo trước sắp tới đoạn đường có mặt đường không bằng phẳng, lồi lõm, v.v… xe chạy với tốc độ cao sẽ nguy hiểm.'),
	(109, 'Biển số W.221b', '221b_1809100955.jpg', 2, '“Đường không bằng phẳng” để báo trước sắp tới đoạn đường có mặt đường không bằng phẳng, có gờ giảm tốc  v.v… xe chạy với tốc độ cao sẽ nguy hiểm.'),
	(110, 'Biển số W.222a', '222a_1809100955.jpg', 2, '“Đường trơn” để báo trước sắp tới đoạn đường có thể xảy ra trơn trượt đặc biệt là khi thời tiết xấu, mưa phùn.'),
	(111, 'Biển số W.222b', '222b_1809100955.jpg', 2, '“Lề đường nguy hiểm” để báo những nơi lề đường không ổn định, khi xe đi vào dễ gây văng đất đá hoặc bánh xe quay tại chỗ.'),
	(112, 'Biển số W.223 (a) ', '223b_1809100955.jpg', 2, ' “Vách núi nguy hiểm bên trái” để báo hiệu đường đi sát vách núi bên trái .'),
	(113, 'Biển số W.223 (b)', '223a_1809100955.jpg', 2, '“Vách núi nguy hiểm bên phải” để báo hiệu đường đi sát vách núi bên phải.'),
	(114, 'Biển số W.224', '224_1809100955.jpg', 2, '“Đường người đi bộ cắt ngang” để báo trước sắp tới phần đường dành cho người đi bộ sang qua đường.'),
	(115, 'Biển số W.225', '225_1809100955.jpg', 2, '“Trẻ em” để báo trước là gần đến đoạn đường thường có trẻ em đi ngang qua hoặc tụ tập trên đường như ở vườn trẻ, trường học, câu lạc bộ.'),
	(116, 'Biển số W.226', '226_1809100955.jpg', 2, '“Đường người đi xe đạp cắt ngang” để báo trước là gần tới vị trí thường có người đi xe đạp từ những đường nhỏ cắt ngang qua hoặc từ đường dành cho xe đạp đi nhập vào đường ô tô.'),
	(117, 'Biển số W.227', '227_1809100955.jpg', 2, '“Công trường” để báo trước gần tới đoạn đường đang tiến hành thi công sửa chữa, cải tạo, nâng cấp có người và máy móc đang làm việc trên mặt đường.'),
	(118, 'Biển số W.228 (a)', '228b_1809100955.jpg', 2, '“Đá lở” để báo trước gần tới đoạn đường có hiện tượng đất đá từ trên ta luy dương trái sụt lở bất ngờ gây nguy hiểm cho xe cộ và người đi đường, đặc biệt là ở những đoạn đường miền núi.'),
	(119, 'Biển số W.228 (b)', '228a_1809100955.jpg', 2, '“Đá lở” để báo trước gần tới đoạn đường có hiện tượng đất đá từ trên ta luy dương phải sụt lở bất ngờ gây nguy hiểm cho xe cộ và người đi đường, đặc biệt là ở những đoạn đường miền núi.'),
	(120, 'Biển số W.228c', '228c_1809100956.jpg', 2, '“Sỏi đá bắn lên” để báo trước nơi có kết cấu mặt đường rời rạc, khi phương tiện đi qua, làm cho các viên đá, sỏi băng lên gây nguy hiểm và mất an toàn cho người và phương tiện tham gia giao thông.'),
	(121, 'Biển số W.228d', '228d_1809110941.jpg', 2, '“Nền đường yếu” để cảnh báo những đoạn nền đường yếu, đoạn đường đang theo dõi lún mà việc vận hành xe ở tốc độ cao có thể gây nguy hiểm.'),
	(122, 'Biển số W.229', '229_1809100956.jpg', 2, '“Dải máy bay lên xuống” để báo trước đoạn đường ở vùng sát đường băng sân bay và cắt ngang qua hướng máy bay lên xuống ở độ cao không lớn.'),
	(123, 'Biển số W.230', '230_1809100956.jpg', 2, '“Gia súc” để báo trước gần tới đoạn đường thường có gia súc thả rông hoặc lùa qua ngang đường, đường ở vùng đồng cỏ của nông trường chăn nuôi, vùng thảo nguyên.'),
	(124, 'Biển số W.231', '231_1809100956.jpg', 2, '“Thú rừng vượt qua đường” để báo trước gần tới đoạn đường thường có thú rừng qua đường như đường đi qua rừng hay khu vực bảo tồn thiên nhiên cấm săn bắn.'),
	(125, 'Biển số W.232', '232_1809100956.jpg', 2, '“Gió ngang” để báo trước gần tới đoạn đường thường có gió ngang thổi mạnh gây nguy hiểm.'),
	(126, 'Biển số W.233', '233_1809100956.jpg', 2, '“Nguy hiểm khác” được đặt nếu trên đường có những nguy hiểm mà không thể vận dụng được các kiểu biển từ biển số W.201a đến biển số W.232.'),
	(127, 'Biển số W.234', '234_1809100956.jpg', 2, '“Giao nhau với đường hai chiều”: Trên đường một chiều, để báo trước sắp đến vị trí giao nhau với đường hai chiều.'),
	(128, 'Biển số W.235', '235_1809100956.jpg', 2, '“Đường đôi” để báo trước sắp đến đoạn đường có chiều đi và chiều về phân biệt bằng dải phân cách cứng.'),
	(129, 'Biển số W.236', '236_1809100956.jpg', 2, '“Kết thúc đường đôi” để báo trước sắp kết thúc đoạn đường có chiều đi và chiều về phân biệt bằng dải phân cách cứng.'),
	(130, 'Biển số W.237', '237_1809100956.jpg', 2, '“Cầu vồng” dùng để nhắc nhở lái xe phải thận trọng. Biển đặt ở trên đoạn đường sắp đến công trình có độ vồng lớn ảnh hưởng tới tầm nhìn.'),
	(131, 'Biển số W.238', '238_1809100956.jpg', 2, 'được đặt trên đường nhánh nhập vào đường cao tốc để báo cho các phương tiện đi trên đường này biết có “Đường cao tốc phía trước”.'),
	(132, 'Biển số W.239', '239_1809100956.jpg', 2, '“Đường cáp điện ở phía trên” đặt  ở những nơi có đường dây điện cắt ngang phía trên tuyến đường.'),
	(133, 'Biển báo W.240', '240_1809100956.jpg', 2, '“Đường hầm” để nhắc lái xe chú ý chuẩn bị đi vào hầm đường bộ.'),
	(134, 'Biển số W.241', '241_1809100956.jpg', 2, '“Ùn tắc giao thông” để báo đoạn đường hay xảy ra ùn tắc giao thông.'),
	(135, 'Biển số W.242 (a)', '242a_1809100956.jpg', 2, '“Nơi đường sắt giao vuông góc với đường bộ” để bổ sung cho biển số W.211 “Giao nhau với đường sắt không có rào chắn”, đặt biển số W.242 (a) để chỉ chỗ đường sắt giao vuông góc đường bộ. Biển đặt trên đường bộ cách ray gần nhất của đường sắt 10 m.'),
	(136, 'Biển số W.242 (b)', '242b_1809100957.jpg', 2, '“Nơi 2 đường sắt giao vuông góc với đường bộ” để bổ sung cho biển số W.211 “Giao nhau với đường sắt không có rào chắn”, đặt biển số W.242 (b) để chỉ chỗ đường sắt giao vuông góc đường bộ. Biển đặt trên đường bộ cách ray gần nhất của đường sắt 10 m.'),
	(137, 'Biển báo số W.243 (a)', '243a_1809100957.jpg', 2, '“Nơi đường sắt giao không vuông góc với đường bộ” để báo trước sắp đến vị trí giao cắt đường bộ với đường sắt cùng mức, không vuông góc và không có người gác, không có rào chắn Đặt cách ray gần nhất 50m.'),
	(138, 'Biển báo số W.243 (b)', '243b_1809100957.jpg', 2, '“Nơi đường sắt giao không vuông góc với đường bộ” để báo trước sắp đến vị trí giao cắt đường bộ với đường sắt cùng mức, không vuông góc và không có người gác, không có rào chắn Đặt cách ray gần nhất 100m.'),
	(139, 'Biển báo số W.243 (c)', 'Screenshot-2022-01-13-120432.png', 2, '“Nơi đường sắt giao không vuông góc với đường bộ” để báo trước sắp đến vị trí giao cắt đường bộ với đường sắt cùng mức, không vuông góc và không có người gác, không có rào chắn Đặt cách ray gần nhất 150m.'),
	(140, 'Biển số W.244', '244_1809100957.jpg', 2, '“Đoạn đường hay xảy ra tai nạn” dùng để cảnh báo nguy hiểm đoạn đường phía trước thường xảy ra tai nạn để lái xe cần đặc biệt chú ý.'),
	(141, 'Biển số W.245 (a)', '245a_1809100957.jpg', 2, '“Đi chậm” dùng để nhắc lái xe giảm tốc độ đi chậm khi đến đoạn đường yêu cầu đi chậm.'),
	(142, 'Biển số W.245 (b)', '245b_1809100957.jpg', 2, '“Đi chậm” dùng để nhắc lái xe giảm tốc độ đi chậm khi đến đoạn đường yêu cầu đi chậm.'),
	(143, 'Biển số W.246 (a)', '246a_1809100957.jpg', 2, '“Chú ý chướng ngại vật ở giữa” dùng để báo trước cho lái xe biết phía trước có chướng ngại vật, xe cần giảm tốc độ và đi vòng sang hai bên trái và phải.'),
	(144, 'Biển số W.246 (b)', '246c_1809100957.jpg', 2, '“Chú ý chướng ngại vật” dùng để báo trước cho lái xe biết phía trước có chướng ngại vật, xe cần giảm tốc độ và đi vòng theo bên phải.'),
	(145, 'Biển số W.246 (c)', '246b_1809100957.jpg', 2, '“Chú ý chướng ngại vật” dùng để báo trước cho lái xe biết phía trước có chướng ngại vật, xe cần giảm tốc độ và đi vòng theo bên trái.'),
	(146, 'Biển số W.247', '247_1809100957.jpg', 2, '“Chú ý xe đỗ” để cảnh báo có các loại xe ôtô, máy kéo, rơ-moóc hoặc sơ-mi rơ-moóc được kéo bởi xe ôtô hoặc ôtô đầu kéo, xe máy chuyên dùng đang đỗ chiếm một phần đường xe chạy.'),
	(147, 'Biển số R.122', 'r122_0308144935.jpg', 3, 'Biển có hiệu lực buộc các loại xe cơ giới và thô sơ kể cả xe được ưu tiên theo quy định dừng lại trước biển hoặc trước vạch ngang đường và chỉ được phép đi khi thấy các tín hiệu (do người điều khiển giao thông hoặc đèn cờ) cho phép đi.'),
	(148, 'Biển số R.301a', 'r301_0308144935a.jpg', 3, ' Được đặt trước ngã ba, ngã tư. Các xe chỉ được đi thẳng;'),
	(149, 'Biển số R.301b', 'r301_0308144935b.jpg', 3, 'Được đặt sau ngã ba, ngã tư. Các xe chỉ được rẽ phải;'),
	(150, 'Biển số R.301c', 'r301_0308144935c.jpg', 3, ' Được đặt sau ngã ba, ngã tư. Các xe chỉ được rẽ trái ở khu vực trước mặt biển;'),
	(151, 'Biển số R.301d', 'r301_0308144935d.jpg', 3, ' Được đặt trước ngã ba, ngã tư. Các xe chỉ được rẽ phải ở đằng sau mặt biển;'),
	(152, 'Biển số R.301e', 'r301efgh_0308144935e.jpg', 3, 'Được đặt trước ngã ba, ngã tư. Các xe chỉ được rẽ trái ở đằng sau mặt biển;'),
	(153, ' Biển số R.301f', 'r301efgh_0308144935f.jpg', 3, 'Được đặt trước ngã ba, ngã tư. Các xe chỉ được đi thẳng và rẽ phải sau mặt biển và được phép quay đầu xe để đi theo hướng ngược lại;;'),
	(154, 'Biển số R.301g', 'r301efgh_0308144935g.jpg', 3, 'Được đặt trước ngã ba, ngã tư. Các xe chỉ được đi thẳng và rẽ trái sau mặt biển và được phép quay đầu xe để đi theo hướng ngược lại;'),
	(155, 'Biển số R.301h', 'r301efgh_0308144935h.jpg', 3, 'Được đặt sau ngã ba, ngã tư. Các xe chỉ được rẽ trái và rẽ phải hoặc quay đầu trước mặt biển.'),
	(156, 'Biển số R.302a', 'r302_0308144935a.png', 3, 'Hướng phải đi vòng chướng ngại vật'),
	(157, 'Biển số R.302b', 'r302_0308144935b.png', 3, 'Hướng phải đi vòng chướng ngại vật'),
	(158, 'Biển số R.302c', 'r302_0308144935c.png', 3, 'Hướng phải đi vòng chướng ngại vật'),
	(159, 'Biển số R.303', 'com.waterfall.trafficlaws2_Screenshot_2021.10.26_11.04.jpg', 3, 'Nơi giao nhau chạy theo vòng xuyến'),
	(160, 'Biển số R.304', 'r304_0308144936.jpg', 3, 'Đường dành cho xe thô sơ'),
	(161, 'Biển số R.305', 'r305_0308144936.jpg', 3, 'Đường dành cho người đi bộ'),
	(162, 'Biển số R.306', 'r306_0308144936.jpg', 3, 'Tốc độ tối thiểu cho phép'),
	(163, 'Biển số R.307', 'r307_0308144936.jpg', 3, 'Hết tốc độ tối thiểu'),
	(164, 'Biển số R.308a', 'r308_0308144936a.jpg', 3, 'Biểu thị phía trước có cầu vượt, xe có thể đi thẳng hoặc theo chỉ dẫn trên hình vẽ để rẽ trái (hay rẽ phải), đặt biển số R.308 (a,b) “Tuyến đường cầu vượt cắt ngang”.'),
	(165, 'Biển số R.308b', 'r308_0308144936.jpg', 3, 'Biểu thị phía trước có cầu vượt, xe có thể đi thẳng hoặc theo chỉ dẫn trên hình vẽ để rẽ trái (hay rẽ phải), đặt biển số R.308 (a,b) “Tuyến đường cầu vượt cắt ngang”.'),
	(166, 'Biển số R.309', 'r309_0308144936.jpg', 3, 'Biểu thị xe cộ đi đến vị trí đặt biển đó thì phải ấn còi.'),
	(167, 'Biển số R.310a', 'r310_0308144936a.png', 3, 'Để báo cho các loại xe chở hàng nguy hiểm phải đi theo hướng quy định, đặt một trong những kiểu biển số R.310(a,b,c) “Hướng đi phải theo cho các xe chở hàng nguy hiểm “.'),
	(168, 'Biển số R.310b', 'r310_0308144936b.png', 3, 'Để báo cho các loại xe chở hàng nguy hiểm phải đi theo hướng quy định, đặt một trong những kiểu biển số R.310(a,b,c) “Hướng đi phải theo cho các xe chở hàng nguy hiểm “.'),
	(169, 'Biển số R.310c', 'r310_0308144936c.png', 3, 'Để báo cho các loại xe chở hàng nguy hiểm phải đi theo hướng quy định, đặt một trong những kiểu biển số R.310(a,b,c) “Hướng đi phải theo cho các xe chở hàng nguy hiểm “.'),
	(170, ' Biển số R.403a', 'r403_0308144936a.png', 3, 'Đường dành cho xe ô tô'),
	(171, ' Biển số R.403b', 'r403_0308144936b.png', 3, 'Đường dành cho xe ô tô, xe máy'),
	(172, ' Biển số R.403c', 'r403_0308144936c.png', 3, 'Đường dành cho xe buýt'),
	(173, ' Biển số R.403d', 'r403_0308144936d.png', 3, 'Đường dành cho xe ô tô con'),
	(174, ' Biển số R.403e', 'r403_0308144936e.png', 3, 'Đường dành cho xe máy'),
	(175, ' Biển số R.403f', 'r403_0308144936f.png', 3, 'Đường dành cho xe máy và xe đạp '),
	(176, 'Biển số R.404a', 'r404_0308144936a.png', 3, 'Hết đoạn đường dành cho xe ô tô'),
	(177, 'Biển số R.404b', 'r404_0308144936b.png', 3, 'Hết đoạn đường dành cho xe ô tô, xe máy'),
	(178, 'Biển số R.404c', 'r404_0308144936c.png', 3, 'Hết đoạn đường dành cho xe buýt'),
	(179, 'Biển số R.404d', 'r404_0308144936d.png', 3, 'Hết đoạn đường dành cho xe ô tô con'),
	(180, 'Biển số R.404e', 'r404_0308144936e.png', 3, 'Hết đoạn đường dành cho xe máy'),
	(181, 'Biển số R.404f', 'r404_0308144936f.png', 3, 'Hết đoạn đường dành cho xe máy và xe đạp'),
	(182, 'Biển số R.411', 'r411_0308144937.png', 3, 'Để báo hiệu cho người tham gia giao thông biết số lượng làn đường trên mặt đường và hướng đi trên mỗi làn đường theo vạch kẻ đường, đặt biển số R.411 “Hướng đi trên mỗi làn đường theo vạch kẻ đường”. Biển sử dụng phối hợp với vạch kẻ đường (loại vạch 9.3: vạch mũi tên chỉ hướng trên mặt đường).'),
	(183, 'Biển số R.412a', 'r412_0308144937a.jpg', 3, '“Làn đường dành cho xe ô tô khách”: làn đường dành riêng cho ô tô khách (kể cả ô tô buýt). Trong trường hợp cần phân làn các loại xe khách theo số chỗ ngồi thì ghi số chỗ ngồi cho phép của xe khách lên thân xe trong hình vẽ của biển (Ví dụ: “< 16c”. Khi báo hiệu làn đường dành riêng cho xe buýt nhanh, bổ sung thêm cụm từ “BRT” trên biển R.412a.'),
	(184, 'Biển số R.412b', 'r412_0308144937b.jpg', 3, '“Làn đường dành cho xe ô tô con”.'),
	(185, 'Biển số R.412c', 'r412_0308144937c.jpg', 3, '“Làn đường dành cho xe ôtô tải”. Trong trường hợp cần phân làn các loại xe tải theo khối lượng chuyên chở cho phép thì ghi trị số khối lượng chuyên chở cho phép của xe tải lên thân xe trong hình vẽ của biển (Ví dụ: “<3,5t”).'),
	(186, 'Biển số R.412d', 'r412_0308144937d.jpg', 3, '“Làn đường dành cho xe máy”: làn đường dành riêng cho xe máy và xe gắn máy.'),
	(187, 'Biển số R.412e', 'r412_0308144937e.jpg', 3, '“Làn đường dành cho xe buýt”.'),
	(188, 'Biển số R.412f', 'r412_0308144937f.jpg', 3, '“Làn đường dành cho ô tô”: làn đường dành cho các loại xe ô tô.'),
	(189, 'Biển số R.412g', 'r412_0308144937g.jpg', 3, ' “Làn đường dành cho xe máy và xe đạp”: làn đường dành riêng cho xe máy (kể cả xe gắn máy) và xe đạp (kể cả các loại xe thô sơ khác).'),
	(190, 'Biển số R.412h', 'r412_0308144937h.jpg', 3, '“Làn đường dành cho xe đạp”: làn đường dành riêng cho xe đạp (kể cả các loại xe thô sơ khác).'),
	(191, 'Biển số R.415', 'r415_0308144937.png', 3, '“Biển gộp làn đường theo phương tiện” và “Kết thúc làn đường theo phương tiện”'),
	(192, 'Biển số R.420', 'r420_0308144937a.jpg', 3, 'Để báo hiệu bắt đầu đoạn đường vào phạm vi khu đông dân cư'),
	(193, 'Biển số R.421', 'r420_0308144937b.jpg', 3, 'Để báo hiệu hết đoạn đường qua phạm vi khu đông dân cư'),
	(194, 'Biển R.E,11a', 'ham_0308144935a.png', 3, 'Để chỉ dẫn đoạn đường qua hầm có áp dụng quy định giao thông riêng'),
	(195, 'Biển R.E,11b', 'ham_0308144935b.png', 3, 'Để chỉ dẫn hết đoạn đường qua hầm, các quy định giao thông riêng không còn áp dụng'),
	(196, 'Biển số I.401', '401_1708165258a.jpg', 4, 'Bắt đầu đường ưu tiên'),
	(197, 'Biển số  I.402', '401_1708165258b.jpg', 4, 'Hết đoạn đường ưu tiên'),
	(198, 'Biển số I.405a', '405_1708165258a.png', 4, 'để chỉ lối rẽ vào đường cụt'),
	(199, 'Biển số I.405b', '405_1708165258b.png', 4, 'để chỉ lối rẽ vào đường cụt'),
	(200, 'Biển số I.405c', '405_1708165258c.png', 4, 'để chỉ dẫn phía trước là đường cụt'),
	(201, 'Biển số I.406', '406_1708165258.jpg', 4, 'Biển báo chỉ dẫn được ưu tiên qua đường hẹp dùng để chỉ dẫn cho người tham gia giao thông cơ giới biết mình được quyền ưu tiên đi trước trên đoạn đường hẹp.'),
	(202, 'Biển số I.407a', '407_1708165259a.png', 4, 'chỉ cho phép các loại phương tiện giao thông đi theo chiều vào theo mũi tên chỉ, cấm quay đầu ngược lại (trừ các xe được quyền ưu tiên theo quy định).'),
	(203, 'Biển số I.407b', '407_1708165259b.png', 4, 'chỉ cho phép các loại phương tiện giao thông đi theo chiều vào theo mũi tên chỉ, cấm quay đầu ngược lại (trừ các xe được quyền ưu tiên theo quy định).'),
	(204, 'Biển số I.407c', '407_1708165259c.png', 4, 'chỉ cho phép các loại phương tiện giao thông đi theo chiều vào theo mũi tên chỉ, cấm quay đầu ngược lại (trừ các xe được quyền ưu tiên theo quy định).'),
	(205, 'Biển số I.408', '408_1708165259.jpg', 4, 'Biển này để chỉ dẫn những nơi được phép đỗ xe, những bãi đỗ xe, bến xe…'),
	(206, 'Biển số 408a', '408a_1708165259.png', 4, 'Nơi đỗ xe một phần trên hè phố'),
	(207, 'Biển số I.409', '409_1708165259.jpg', 4, 'Báo hiệu đến chỗ được phép quay xe.'),
	(208, 'Biển số I.410', '410_1708165259.jpg', 4, 'Để chỉ dẫn khu vực được phép quay đầu xe, đặt biển số I.410 “Khu vực quay xe”. Trên biển mô tả cách thức tiến hành quay xe.'),
	(209, 'Biển số I.413a', '413_1708165259a.jpg', 4, 'Đường phía trước có làn đường dành cho ô tô khách'),
	(210, 'Biển số I.413b', '413_1708165259b.jpg', 4, 'Rẽ ra đường có làn đường dành cho ô tô khách'),
	(211, 'Biển số I.413c', '413_1708165259c.jpg', 4, 'Rẽ ra đường có làn đường dành cho ô tô khách'),
	(212, 'Biển số I.423a', '423_1708165300a.png', 4, 'Để chỉ dẫn người đi bộ và người tham gia giao thông biết vị trí dành cho người đi bộ sang ngang'),
	(213, 'Biển số I.423b', '423_1708165300b.png', 4, 'Để chỉ dẫn người đi bộ và người tham gia giao thông biết vị trí dành cho người đi bộ sang ngang'),
	(214, 'Biển số I.424a', '424_1708165300a.png', 4, 'Để chỉ dẫn cho người đi bộ sử dụng cầu vượt qua đường'),
	(215, 'Biển số I.424b', '424_1708165300b.png', 4, 'Để chỉ dẫn cho người đi bộ sử dụng cầu vượt qua đường'),
	(216, 'Biển số I.425', 'Screenshot-2022-01-15-112958.jpg', 4, 'Để chỉ dẫn sắp đến cơ sở điều trị bệnh ở gần đường như bệnh viện, bệnh xá, trạm xá, vv. Gặp biển này người lái xe đi chậm chú ý quan sát không sử dụng còi.'),
	(217, 'Biển số I.426', 'Screenshot-2022-01-15-113035.jpg', 4, 'Để chỉ nơi có trạm cấp cứu y tế ở gần đường.'),
	(218, 'Biển số I.427a', 'Screenshot-2022-01-15-113114.jpg', 4, 'Để chỉ dẫn nơi đặt xưởng, trạm chuyên phục vụ sửa chữa ôtô, xe máy hỏng trên đường, phải đặt biển số I.427a “Trạm sửa chữa”.'),
	(219, 'Biển số I.427b', '427b_1708165300.jpg', 4, 'Trạm kiểm tra tải trọng xe'),
	(220, 'Biển số I.428', 'Screenshot-2022-01-15-113217.jpg', 4, 'ể chỉ dẫn những nơi có đặt cửa hàng xăng, dầu hoặc nạp điện phục vụ cho phương tiện giao thông đi trên đường'),
	(221, 'Biển số I.429', 'Screenshot-2022-01-15-113236.jpg', 4, 'Để chỉ dẫn những nơi có bố trí rửa xe'),
	(222, 'Biển số I.430', 'Screenshot-2022-01-15-113319.jpg', 4, 'Để chỉ dẫn những nơi có đặt trạm điện thoại công cộng chuyên phục vụ khách đi đường'),
	(223, 'Biển số I.431', 'Screenshot-2022-01-15-113341.jpg', 4, 'Để chỉ dẫn những nơi có các dịch vụ phục vụ khách đi đường (ăn uống nghỉ ngơi, cung cấp nhiên liệu…)'),
	(224, 'Biển số I.432', 'Screenshot-2022-01-15-113453.jpg', 4, 'Để chỉ dẫn nơi có khách sạn phục vụ khách đi đường'),
	(225, 'Biển số I.433a', 'Screenshot-2022-01-15-113431.jpg', 4, 'Để chỉ dẫn nơi nghỉ mát'),
	(226, 'Biển số I.433b', 'Screenshot-2022-01-20-120923b.png', 4, 'Trên các tuyến đường đối ngoại và các tuyến đường có nhiều người nước ngoài đi lại, để chỉ dẫn sắp đến nơi có vị trí cắm trại'),
	(227, 'Biển số I.433c', 'Screenshot-2022-01-20-120923c.png', 4, 'Nơi dành cho nhà lưu động'),
	(228, 'Biển số I.433d', 'Screenshot-2022-01-20-120923d.png', 4, 'Nơi cắm trại và nhà lưu động'),
	(229, ' Biển số I.433e', 'Screenshot-2022-01-20-120947.png', 4, 'rên các tuyến đường đối ngoại và các tuyến đường có nhiều người nước ngoài đi lại, để chỉ dẫn sắp đến nơi có nhà trọ'),
	(230, ' Biển số I.434a', 'Screenshot-2022-01-15-113521.jpg', 4, 'Bến xe buýt'),
	(231, 'Biển số I.434b', 'Screenshot-2022-01-20-120858.png', 4, 'Bến xe tải'),
	(232, 'Biển số I.435', 'Screenshot-2022-01-15-113542.jpg', 4, 'Bến xe điện'),
	(233, 'Biển số I.436', 'Screenshot-2022-01-15-113601.jpg', 4, 'Trạm cảnh sát giao thông'),
	(234, 'Biển số I.437', '437_1708165300.png', 4, 'Đường cao tốc'),
	(235, 'Biển số I.443', '443_1708165300.jpg', 4, 'Để báo hiệu xe có kéo moóc hoặc xe kéo xe,'),
	(236, 'Biển 1.446', 'com.waterfall.trafficlaws2_Screenshot_2021.10.27_14.25.jpg', 4, 'Nơi đỗ xe dành cho người khuyết tật'),
	(237, 'Biển 1.449', 'com.waterfall.trafficlaws2_Screenshot_2021.10.27_14.33-300x161-1.jpg', 4, 'Là biển báo tên đường cho các tuyến đường đối ngoại.'),
	(238, 'Biển số 1.448', 'com.waterfall.trafficlaws2_Screenshot_2021.10.27_14.25-1.jpg', 4, 'Làn đường cứu nạn hay làn thoát xe khẩn cấp.'),
	(239, 'Biển số S.501', 's501_2406151146-300x195.jpg', 5, 'Biển số S.501 để thông báo chiều dài đoạn đường nguy hiểm hoặc cấm hoặc hiệu lệnh hoặc hạn chế bên dưới một số biển báo chính.'),
	(240, ' Biển số S.502', 's502_2406151146.jpg', 5, 'Bên dưới các loại biển báo nguy hiểm, biển báo cấm, biển hiệu lệnh và chỉ dẫn đặt biển số S.502 “Khoảng cách đến đối tượng báo hiệu” để thông báo khoảng cách thực tế từ vị trí đặt biển đến đối tượng báo hiệu ở phía trước.'),
	(241, 'Biển số S.503a', 's503_2406151146a.jpg', 5, 'đặt bên dưới các biển báo cấm, biển hiệu lệnh để chỉ hướng tác dụng của biển là hướng vuông góc với chiều đi.'),
	(242, 'Biển số S.503b', 's503_2406151146b.jpg', 5, 'đặt bên dưới các biển báo cấm, biển hiệu lệnh để chỉ hướng tác dụng của biển là hướng vuông góc với chiều đi.'),
	(243, 'Biển số S.503c', 's503_2406151146c.jpg', 5, 'đặt bên dưới các biển báo cấm, biển hiệu lệnh để chỉ hướng tác dụng của biển là hướng vuông góc với chiều đi.'),
	(244, 'Biển số S.503d', 's503_2406151146d.jpg', 5, 'đặt bên dưới biển số P.124 (a,b,c,d,e,f), biển số P.130 “Cấm dừng xe và đỗ xe”, biển số P.131 (a,b,c) “Cấm đỗ xe” để chỉ hướng tác dụng của biển là hướng song song với chiều đi.'),
	(245, 'Biển số S.503e', 's503_2406151146e.jpg', 5, 'đặt bên dưới biển số P.124 (a,b,c,d,e,f), biển số P.130 “Cấm dừng xe và đỗ xe”, biển số P.131 (a,b,c) “Cấm đỗ xe” để chỉ hướng tác dụng của biển là hướng song song với chiều đi.\r\nBiển số S.503e để chỉ đồng thời hai hướng tác dụng (trước và sau) nơi đặt biển báo nhắc lại lệnh cấm dừng và cấm đỗ xe.'),
	(246, 'Biển số S.503f', 's503_2406151146f.jpg', 5, 'đặt bên dưới biển số P.124 (a,b,c,d,e,f), biển số P.130 “Cấm dừng xe và đỗ xe”, biển số P.131 (a,b,c) “Cấm đỗ xe” để chỉ hướng tác dụng của biển là hướng song song với chiều đi.'),
	(247, 'Biển số S.504', 's504_2406151146.jpg', 5, 'Biển số S.504 được đặt bên trên làn đường và dưới các biển báo cấm và biển hiệu lệnh hay bên dưới đèn tín hiệu để chỉ làn đường chịu hiệu lực của biển báo hay đèn tín hiệu (khi kết hợp trên cùng một mặt biển, chỉ cần vẽ mũi tên chỉ làn đường).'),
	(248, ' Biển số S.505 a', 's505_2406151147.jpg', 5, 'Biển được đặt bên dưới các biển báo cấm và biển hiệu lệnh hay biển chỉ dẫn để chỉ loại xe chịu hiệu lực của biển báo cấm, biển hiệu lệnh hay biển chỉ dẫn đối với riêng loại xe đó.'),
	(249, 'Biển số S.505b', 'Screenshot-2022-01-21-114219.png', 5, 'Biển số S.505b được đặt bên dưới biển báo số P.106a “Cấm xe ôtô tải” để chỉ các loại xe tải chịu hiệu lực của biển báo và tải trọng toàn bộ xe cho phép (bao gồm tải trọng bản thân xe và khối lượng chuyên chở cho phép) tương ứng với mỗi loại xe không phụ thuộc vào số lượng trục.'),
	(250, 'Biển số S.505c', 'Screenshot-2022-01-21-114237.png', 5, 'a) Biển số S.505c được đặt bên dưới biển báo số P.106a “Cấm ôtô xe tải” để chỉ các loại xe tải có tải trọng trục lớn nhất cho phép tương ứng với mỗi loại trục (trục đơn, trục kép, trục ba).\r\nb) Biển S.505c được đặt cùng với biển số S.505b bên dưới biển số P.106 và các xe qua cầu phải thỏa mãn điều kiện của cả hai biển (biển số S.505b và S.505c);'),
	(251, ' Biển số S.506a', 's506_2406151147a.png', 5, ' Biển số S.506a được đặt bên dưới biển chỉ dẫn số I.401 trên đường ưu tiên để chỉ dẫn cho người tham gia giao thông trên đường này biết hướng đường ưu tiên ở ngã tư.'),
	(252, ' Biển số S.506b', 's506_2406151147b.png', 5, 'Biển số S.506b được đặt bên dưới biển số W.208 và biển số R.122 trên đường không ưu tiên để chỉ dẫn cho người tham gia giao thông trên đường này biết hướng đường ưu tiên ở ngã tư.'),
	(253, ' Biển số S.507', 's507_2406151147.jpg', 5, 'Biển số S.507 được sử dụng độc lập để báo trước cho người tham gia giao thông biết chỗ rẽ nguy hiểm và để chỉ hướng rẽ.'),
	(254, 'Biển chỉ dẫn số lượng làn và hướng đi cho từng làn', 'g11_2406151146.png', 5, 'Để thông báo cho lái xe số làn và hướng đi của từng làn xe, đặt biển số S.G,11a; S.G,11c; các biển này phải có số mũi tên bằng số lượng làn xe đi cùng hướng và phải chỉ dẫn số lượng làn xe của hướng đi sắp tới.'),
	(255, 'Biển chỉ dẫn làn đường không lưu thông ', 'Screenshot-2022-01-21-114056.png', 5, 'Để chỉ dẫn cho lái xe biết làn đường không lưu thông, đặt biển S.G,12a; S.G,12b.'),
	(256, 'Biển báo phụ “Ngoại lệ”', 'Screenshot-2022-01-21-114123.png', 5, 'Để chỉ các trường hợp mà biển cấm hoặc hạn chế được coi là không áp dụng đặc biệt cho một nhóm đối tượng tham gia giao thông nào đó, đặt biển S.H,6 và thể hiện nhóm đối tượng đó cùng với cụm từ “Except – Ngoại lệ”.');
--
-- Dumping data for table `sign`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--
INSERT INTO `user` (`id_user`, `username`, `password`, `avatar`) VALUES
	(1, 'anhhuy', '123', 'hinh-bau-troi-dem-anime-mau-tim.jpg'),
	(2, 'hoainam', '123', '203a_1809100953.jpg'),
	(5, 'admin', 'admin', 'hinhanh4.jpg');
--
-- Indexes for dumped tables
--

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id_user`,`id_sign`,`time`),
  ADD KEY `id_sign` (`id_sign`);

--
-- Indexes for table `sign`
--
ALTER TABLE `sign`
  ADD PRIMARY KEY (`id_sign`);



--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sign`
--
ALTER TABLE `sign`
  MODIFY `id_sign` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--

ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`databienbao
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`id_sign`) REFERENCES `sign` (`id_sign`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
