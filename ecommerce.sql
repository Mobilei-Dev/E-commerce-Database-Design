CREATE TABLE `brand` (
  `brand_id` int PRIMARY KEY,
  `brand_name` varchar(255)
);

CREATE TABLE `product_category` (
  `category_id` int PRIMARY KEY,
  `category_name` varchar(255)
);

CREATE TABLE `product` (
  `product_id` int PRIMARY KEY,
  `product_name` varchar(255),
  `base_price` decimal,
  `brand_id` int,
  `category_id` int
);

CREATE TABLE `color` (
  `color_id` int PRIMARY KEY,
  `color_name` varchar(255)
);

CREATE TABLE `size_category` (
  `size_category_id` int PRIMARY KEY,
  `category_name` varchar(255)
);

CREATE TABLE `size_option` (
  `size_id` int PRIMARY KEY,
  `size_value` varchar(255),
  `size_category_id` int
);

CREATE TABLE `product_item` (
  `item_id` int PRIMARY KEY,
  `product_id` int,
  `color_id` int,
  `size_id` int,
  `stock_quantity` int,
  `price` decimal
);

CREATE TABLE `product_image` (
  `image_id` int PRIMARY KEY,
  `product_id` int,
  `image_url` varchar(255)
);

CREATE TABLE `product_variation` (
  `variation_id` int PRIMARY KEY,
  `product_id` int,
  `variation_name` varchar(255)
);

CREATE TABLE `attribute_category` (
  `attribute_category_id` int PRIMARY KEY,
  `category_name` varchar(255)
);

CREATE TABLE `attribute_type` (
  `attribute_type_id` int PRIMARY KEY,
  `type_name` varchar(255),
  `attribute_category_id` int
);

CREATE TABLE `product_attribute` (
  `attribute_id` int PRIMARY KEY,
  `product_id` int,
  `attribute_type_id` int,
  `value` text
);

ALTER TABLE `product` ADD FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`);

ALTER TABLE `product` ADD FOREIGN KEY (`category_id`) REFERENCES `product_category` (`category_id`);

ALTER TABLE `size_option` ADD FOREIGN KEY (`size_category_id`) REFERENCES `size_category` (`size_category_id`);

ALTER TABLE `product_item` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `product_item` ADD FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`);

ALTER TABLE `product_item` ADD FOREIGN KEY (`size_id`) REFERENCES `size_option` (`size_id`);

ALTER TABLE `product_image` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `product_variation` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `attribute_type` ADD FOREIGN KEY (`attribute_category_id`) REFERENCES `attribute_category` (`attribute_category_id`);

ALTER TABLE `product_attribute` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `product_attribute` ADD FOREIGN KEY (`attribute_type_id`) REFERENCES `attribute_type` (`attribute_type_id`);
