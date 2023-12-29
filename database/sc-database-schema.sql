CREATE SCHEMA `skillcloud`;

CREATE TABLE `skillcloud`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(255) NOT NULL,
  `product_price` DECIMAL(6,2) NOT NULL,
  `product_description` VARCHAR(1000) NOT NULL,
  `product_image_url` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE);

CREATE TABLE `skillcloud`.`cart` (
  `cart_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `product_quantity` INT NOT NULL,
  PRIMARY KEY (`cart_id`, `product_id`),
  INDEX `product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `skillcloud`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `skillcloud`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_username` VARCHAR(20) NOT NULL,
  `customer_password` VARCHAR(20) NOT NULL,
  `customer_first_name` VARCHAR(30) NOT NULL,
  `customer_last_name` VARCHAR(30) NOT NULL,
  `customer_billing_street_1` VARCHAR(60) NOT NULL,
  `customer_billing_street_2` VARCHAR(60) NULL,
  `customer_billing_state` VARCHAR(2) NOT NULL,
  `customer_billing_zip` VARCHAR(5) NOT NULL,
  `customer_phone` VARCHAR(12) NOT NULL,
  `customer_email` VARCHAR(50) NOT NULL,
  `customer_cc_number` VARCHAR(10) NOT NULL,
  `customer_cc_exp` VARCHAR(5) NOT NULL,
  `customer_cart_id` INT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_cart_id_UNIQUE` (`customer_cart_id` ASC) VISIBLE,
  UNIQUE INDEX `customer_username_UNIQUE` (`customer_username` ASC) VISIBLE,
  UNIQUE INDEX `customer_password_UNIQUE` (`customer_password` ASC) VISIBLE,
  CONSTRAINT `customer_cart_id`
    FOREIGN KEY (`customer_cart_id`)
    REFERENCES `skillcloud`.`cart` (`cart_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `skillcloud`.`order_core` (
  `order_core_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `product_quantity` INT NOT NULL,
  PRIMARY KEY (`order_core_id`, `customer_id`, `product_id`),
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  INDEX `product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `skillcloud`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_id2`
    FOREIGN KEY (`product_id`)
    REFERENCES `skillcloud`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `skillcloud`.`order_detail` (
  `order_details_id` INT NOT NULL,
  `order_core_id` INT NOT NULL,
  `order_date` VARCHAR(10) NOT NULL,
  `order_time` VARCHAR(5) NOT NULL,
  `order_shipping_street_1` VARCHAR(60) NOT NULL,
  `order_shipping_street_2` VARCHAR(60) NULL,
  `order_shipping_state` VARCHAR(2) NOT NULL,
  `order_shipping_zip` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`order_details_id`),
  INDEX `order_core_id_idx` (`order_core_id` ASC) VISIBLE,
  CONSTRAINT `order_core_id`
    FOREIGN KEY (`order_core_id`)
    REFERENCES `skillcloud`.`order_core` (`order_core_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `skillcloud`.`review` (
  `review_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `review_rating` INT NOT NULL,
  `review_text` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`review_id`),
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_id2`
    FOREIGN KEY (`customer_id`)
    REFERENCES `skillcloud`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
INSERT INTO `skillcloud`.`product` (product_name, product_price, product_description, product_image_url)
	VALUES ( 'Asustor Drivestor 2 AS1102T', 179.00, '2 Bay NAS, 1.4GHz Quad Core, Single 2.5GbE Port, 1GB RAM DDR4, Network Attached Storage, Personal Private Cloud (Diskless)', 'https://m.media-amazon.com/images/I/71rc6RVJ4ZS._AC_SX679_.jpg' );
INSERT INTO `skillcloud`.`product` (product_name, product_price, product_description, product_image_url)
	VALUES ( 'BUFFALO LinkStation 210', 164.99, '4TB 1-Bay NAS Network Attached Storage with HDD Hard Drives Included NAS Storage That Works as Home Cloud or Network Storage Device for Home', 'https://m.media-amazon.com/images/I/81uJnwkiQoL._AC_SX679_.jpg' );
INSERT INTO `skillcloud`.`product` (product_name, product_price, product_description, product_image_url)
	VALUES ( 'QNAP TS-464-8G-US', 610.93, '4 Bay High-Performance Desktop NAS with Intel Celeron Quad-core Processor, M.2 PCIe Slots and Dual 2.5GbE (2.5G/1G/100M) Network Connectivity (Diskless)', 'https://m.media-amazon.com/images/I/61aeABU2+uL._AC_SX679_.jpg' );