SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `Millets` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `pricePerKg` int(20) NOT NULL,
  `pack-size` varchar(20) DEFAULT NULL,
  `usage` varchar(20) NOT NULL

)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `millets` (`id`, `type`, `pricePerKg`, `pack-size`, `usage`) VALUES
(1, 'Hulled',30,'50','Animal feed'),
(2, 'Hulled',50,'50','Good for health'),
(3, 'Hulled',20,'50','nutritional food'),
(4, 'Hulled',50,'50','Animal feed'),
(5, 'Hulled',60,'50','benificial for health');
 


CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email_id` varchar(25) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `phone` int(10) NOT NULL,
  `registration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` (`id`, `email_id`, `first_name`, `last_name`, `phone`, `registration_time`, `password`) VALUES
(65, 'sharew5m123@gmail.com', 'reys', 'rudt', 0, '2019-03-18 13:46:33', 'e4f194cba29960e12d8b8f1bfedc972b'),
(66, 'sgah234@gmail.com', 'werty', 'erty', 0, '2019-03-18 13:55:46', 'e10adc3949ba59abbe56e057f20f883e'),
(67, 'sham1234@gmail.com', 'Sham', 'das', 0, '2019-03-19 07:37:46', 'e10adc3949ba59abbe56e057f20f883e');

--
CREATE TABLE `users_products` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `status` enum('Added To Cart','Confirmed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_products`
--

INSERT INTO `users_products` (`id`, `user_id`, `item_id`, `status`) VALUES
(11, 67, 6, 'Confirmed'),
(17, 67, 1, 'Confirmed'),
(18, 67, 5, 'Confirmed'),
(19, 67, 6, 'Confirmed'),
(20, 67, 1, 'Confirmed'),
(23, 67, 1, 'Confirmed'),
(24, 67, 2, 'Confirmed'),
(25, 67, 9, 'Confirmed');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_products`
--
ALTER TABLE `users_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `users_products`
--
ALTER TABLE `users_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_products`
--
ALTER TABLE `users_products`
  ADD CONSTRAINT `users_products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_products_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `products` (`id`);
COMMIT;
