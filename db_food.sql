/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(100) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `food_desc` varchar(250) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `arr_sub_id` varchar(200) DEFAULT NULL,
  `date_order` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `food_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `food_order_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  `dislike` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(150) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `res_desc` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(100) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `food_desc`, `type_id`) VALUES
(1, 'Spaghetti Carbonara', 'https://picsum.photos/200', 12.99, 'A classic Italian pasta dish with eggs, cheese, pancetta, and pepper.', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `food_desc`, `type_id`) VALUES
(2, 'Margherita Pizza', 'https://picsum.photos/200', 15.5, 'Simple Italian pizza with tomatoes, sliced mozzarella, basil, and extra virgin olive oil.', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `food_desc`, `type_id`) VALUES
(3, 'Tacos Al Pastor', 'https://picsum.photos/200', 9.99, 'Marinated pork served on corn tortillas with pineapple, onions, and cilantro.', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `food_desc`, `type_id`) VALUES
(4, 'Chicken Enchiladas', 'https://picsum.photos/200', 14.99, 'Corn tortillas filled with juicy chicken, covered in chili sauce and cheese.', 2),
(5, 'Kung Pao Chicken', 'https://picsum.photos/200', 13.99, 'Spicy stir-fry Chinese dish with chicken, peanuts, vegetables, and chili peppers.', 3),
(6, 'Beef and Broccoli', 'https://picsum.photos/200', 10.99, 'Tender beef slices with broccoli in a ginger garlic sauce.', 3),
(7, 'Burger with Fries', 'https://picsum.photos/200', 11.99, 'Classic American beef burger served with a side of fries.', 4),
(8, 'BBQ Ribs', 'https://picsum.photos/200', 16.99, 'Slow-cooked ribs coated in a rich BBQ sauce.', 4),
(9, 'Butter Chicken', 'https://picsum.photos/200', 12.99, 'Creamy Indian curry dish with tender chicken pieces in a buttery tomato sauce.', 5),
(10, 'Palak Paneer', 'https://picsum.photos/200', 10.99, 'Spinach curry with paneer cheese, a popular vegetarian dish.', 5),
(11, 'Lasagna', 'https://picsum.photos/200', 13.5, 'Layered pasta dish with cheese, ground meat, and tomato sauce.', 1),
(12, 'Churros', 'https://picsum.photos/200', 7.99, 'Fried-dough pastry, lightly dusted with sugar and served with chocolate dip.', 2),
(13, 'Mapo Tofu', 'https://picsum.photos/200', 9.99, 'Spicy and aromatic Chinese tofu dish with minced meat, typically pork or beef.', 3),
(14, 'Apple Pie', 'https://picsum.photos/200', 5.99, 'Traditional American dessert with a spiced apple filling in a flaky pastry crust.', 4),
(15, 'Chicken Tikka Masala', 'https://picsum.photos/200', 11.99, 'Grilled marinated chicken chunks in a spicy and creamy tomato sauce.', 5);

INSERT INTO `food_order` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `date_order`) VALUES
(1, 6, 1, 1, NULL, NULL, '2024-02-01 10:00:00');
INSERT INTO `food_order` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `date_order`) VALUES
(2, 15, 1, 1, 'SALE20', '1,2', '2024-02-02 10:00:00');
INSERT INTO `food_order` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `date_order`) VALUES
(3, 14, 2, 2, 'SALE10', NULL, '2024-02-03 10:00:00');
INSERT INTO `food_order` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `date_order`) VALUES
(4, 6, 3, 5, NULL, NULL, '2024-02-04 10:00:00'),
(5, 8, 4, 1, NULL, NULL, '2024-02-05 10:00:00'),
(6, 20, 5, 1, NULL, NULL, '2024-02-06 10:00:00'),
(7, 18, 6, 1, 'SALE50', NULL, '2024-02-07 10:00:00'),
(8, 8, 7, 3, NULL, '5,7', '2024-02-08 10:00:00'),
(9, 4, 7, 2, NULL, '6', '2024-02-09 10:00:00'),
(10, 18, 8, 1, NULL, NULL, '2024-02-10 10:00:00'),
(11, 18, 9, 2, 'SALE20', NULL, '2024-02-11 10:00:00'),
(12, 17, 11, 2, 'SALE30', NULL, '2024-02-12 10:00:00'),
(13, 7, 15, 2, 'SALE10', '12', '2024-02-13 10:00:00'),
(14, 4, 3, 4, 'SALE20', '4', '2024-02-14 08:00:00'),
(15, 18, 8, 3, NULL, NULL, '2024-03-15 07:00:00'),
(16, 3, 7, 5, NULL, '5,6,7', '2024-05-02 08:28:44'),
(17, 5, 5, 5, 'SALE20', NULL, '2024-05-02 08:29:23'),
(18, 5, 5, 5, 'SALE20', NULL, '2024-05-02 08:29:29');

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Italian');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Mexican');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Chinese');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'American'),
(5, 'Indian');

INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`, `dislike`) VALUES
(1, 19, 1, '2024-02-01 10:00:00', 0);
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`, `dislike`) VALUES
(3, 18, 6, '2024-02-03 12:00:00', 0);
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`, `dislike`) VALUES
(4, 5, 5, '2024-02-04 13:00:00', 0);
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`, `dislike`) VALUES
(5, 7, 6, '2024-02-05 14:00:00', 0),
(7, 7, 7, '2024-02-07 16:00:00', 0),
(8, 11, 6, '2024-02-08 17:00:00', 0),
(9, 20, 5, '2024-02-09 18:00:00', 0),
(10, 4, 6, '2024-02-10 19:00:00', 0),
(11, 4, 3, '2024-02-11 20:00:00', 0),
(12, 16, 2, '2024-02-12 21:00:00', 0),
(13, 6, 1, '2024-02-13 22:00:00', 0),
(14, 13, 8, '2024-02-14 23:00:00', 0),
(15, 15, 6, '2024-02-15 08:00:00', 0),
(16, 12, 3, '2024-02-16 09:00:00', 0),
(17, 7, 1, '2024-02-17 10:00:00', 0),
(18, 2, 5, '2024-02-18 11:00:00', 0),
(19, 15, 6, '2024-02-19 12:00:00', 0),
(28, 10, 10, '2024-05-01 18:53:36', 1);

INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 19, 1, 3, '2024-01-01 10:00:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 10, 4, 6, '2024-01-02 11:00:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 15, 9, 10, '2024-01-03 12:00:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 8, 10, 6, '2024-01-04 13:00:00'),
(5, 18, 9, 7, '2024-01-05 14:00:00'),
(6, 14, 4, 8, '2024-01-06 15:00:00'),
(7, 13, 1, 2, '2024-01-07 16:00:00'),
(8, 17, 6, 6, '2024-01-08 17:00:00'),
(9, 15, 2, 5, '2024-01-09 18:00:00'),
(10, 19, 2, 10, '2024-01-10 19:00:00'),
(11, 8, 10, 6, '2024-01-11 20:00:00'),
(12, 17, 7, 8, '2024-01-12 21:00:00'),
(13, 18, 1, 5, '2024-01-13 22:00:00'),
(14, 5, 9, 4, '2024-01-14 23:00:00'),
(15, 5, 3, 5, '2024-01-15 08:00:00'),
(16, 8, 7, 1, '2024-01-16 09:00:00'),
(17, 9, 9, 2, '2024-01-17 10:00:00'),
(18, 5, 6, 10, '2024-01-18 11:00:00'),
(19, 2, 7, 9, '2024-01-19 12:00:00'),
(20, 12, 3, 6, '2024-01-20 13:00:00'),
(22, 10, 10, 7, '2024-05-02 07:50:04');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `res_desc`) VALUES
(1, 'Sunny Side Cafe', 'https://picsum.photos/200', 'A cozy place for breakfast and brunch with freshly baked pastries.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `res_desc`) VALUES
(2, 'Moonlight Diner', 'https://picsum.photos/200', 'Classic American diner offering comfort food 24/7.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `res_desc`) VALUES
(3, 'The Italian Table', 'https://picsum.photos/200', 'Authentic Italian cuisine with a modern twist.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `res_desc`) VALUES
(4, 'Curry Express', 'https://picsum.photos/200', 'Fast and flavorful Indian curries, perfect for a quick meal.'),
(5, 'Dragon Wok', 'https://picsum.photos/200', 'Traditional Chinese dishes with bold flavors.'),
(6, 'El Taco Rio', 'https://picsum.photos/200', 'Mexican street food favorites, from tacos to quesadillas.'),
(7, 'Bistro Parisien', 'https://picsum.photos/200', 'French bistro classics in a romantic setting.'),
(8, 'Sakura Sushi', 'https://picsum.photos/200', 'Fresh sushi and Japanese delicacies in a serene atmosphere.'),
(9, 'The Vegan Spot', 'https://picsum.photos/200', 'Innovative vegan dishes that will delight even the most skeptical foodies.'),
(10, 'Brew & Chew', 'https://picsum.photos/200', 'Coffee and casual eats in a laid-back environment.');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Extra Cheese', 3.99, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Extra Pasta', 2.99, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Extra Sauce', 2.99, 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Extra Guacamole', 4.99, 3),
(5, 'Extra Bacon', 3.99, 7),
(6, 'Extra Patty', 4.99, 7),
(7, 'Extra Cheese', 2.99, 7),
(8, 'Extra Sauce', 2.99, 8),
(9, 'Extra Rice', 2.99, 13),
(10, 'Extra Caramel', 2.99, 14),
(11, 'Extra Rice', 2.99, 15),
(12, 'Extra Chicken', 4.99, 15);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Alex Johnson', 'alex.johnson@example.com', 'password123');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Maria Garcia', 'maria.garcia@example.com', 'securePass1');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'James Smith', 'james.smith@example.com', 'myPass789');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Patricia Miller', 'patricia.miller@example.com', 'pass1234'),
(5, 'Michael Davis', 'michael.davis@example.com', '12345678'),
(6, 'Linda Taylor', 'linda.taylor@example.com', 'lindaPass'),
(7, 'Robert Anderson', 'robert.anderson@example.com', 'andersonPwd'),
(8, 'Lisa White', 'lisa.white@example.com', 'white1234'),
(9, 'John Harris', 'john.harris@example.com', 'johnnySecure'),
(10, 'Sarah Martin', 'sarah.martin@example.com', 'sarahM123'),
(11, 'Kevin Brown', 'kevin.brown@example.com', 'kevBrow123'),
(12, 'Karen Jones', 'karen.jones@example.com', 'karenJPass'),
(13, 'Brian Wilson', 'brian.wilson@example.com', 'brianW321'),
(14, 'Nancy Moore', 'nancy.moore@example.com', 'mooreNancy'),
(15, 'Gary Thompson', 'gary.thompson@example.com', 'garyTpass'),
(16, 'Sandra Clark', 'sandra.clark@example.com', 'sandraCpwd'),
(17, 'Jason Allen', 'jason.allen@example.com', 'allen123'),
(18, 'Rebecca Scott', 'rebecca.scott@example.com', 'rebeccaS'),
(19, 'Timothy King', 'timothy.king@example.com', 'timKing456'),
(20, 'Laura Wright', 'laura.wright@example.com', 'lauraWpass');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;