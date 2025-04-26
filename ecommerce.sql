CREATE DATABASE ecommerce;

USE ecommerce;

-- Brand table
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL UNIQUE
);

-- Product category table
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- Product table
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    description TEXT,
    base_price DECIMAL(10,2) NOT NULL,
    brand_id INT,
    category_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Color table
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL UNIQUE,
    hex_value CHAR(7)
);

-- Size category table
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- Size option table
CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY KEY,
    size_value VARCHAR(20) NOT NULL,
    size_category_id INT,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Product variation table
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- Product item (SKU) table
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    variation_id INT,
    stock_quantity INT DEFAULT 0,
    price DECIMAL(10,2),
    sku VARCHAR(50) UNIQUE,
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

-- Attribute category table
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- Attribute type table
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL UNIQUE
);

-- Product attribute table
CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attribute_name VARCHAR(100) NOT NULL,
    attribute_value VARCHAR(255) NOT NULL,
    attribute_type_id INT,
    attribute_category_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id)
);

-- Product image table
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255) NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    alt_text VARCHAR(150),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

USE ecommerce;

-- Insert into brand
INSERT INTO brand (brand_name) VALUES
('Nike'), ('Adidas'), ('Apple'), ('Samsung'), ('Sony'), 
('Puma'), ('Zara'), ('Gucci'), ('Microsoft'), ('AmazonBasics'),
('Reebok'), ('Under Armour'), ('LG'), ('HP'), ('Dell'),
('Lenovo'), ('Asus'), ('Chanel'), ('Prada'), ('H&M');

-- Insert into product_category
INSERT INTO product_category (category_name) VALUES
('Clothing'), ('Electronics'), ('Footwear'), ('Accessories'), ('Home Appliances'),
('Furniture'), ('Books'), ('Beauty Products'), ('Sports'), ('Gadgets'),
('Toys'), ('Automotive'), ('Groceries'), ('Fitness Equipment'), ('Music Instruments'),
('Pet Supplies'), ('Garden'), ('Office Supplies'), ('Stationery'), ('Gaming');

-- Insert into color
INSERT INTO color (color_name, hex_value) VALUES
('Red', '#FF0000'), ('Blue', '#0000FF'), ('Green', '#00FF00'), ('Black', '#000000'), ('White', '#FFFFFF'),
('Yellow', '#FFFF00'), ('Purple', '#800080'), ('Pink', '#FFC0CB'), ('Brown', '#A52A2A'), ('Orange', '#FFA500'),
('Gray', '#808080'), ('Cyan', '#00FFFF'), ('Magenta', '#FF00FF'), ('Gold', '#FFD700'), ('Silver', '#C0C0C0'),
('Beige', '#F5F5DC'), ('Maroon', '#800000'), ('Olive', '#808000'), ('Navy', '#000080'), ('Teal', '#008080');

-- Insert into size_category
INSERT INTO size_category (category_name) VALUES
('Clothing Sizes'), ('Shoe Sizes'), ('Ring Sizes'), ('Cap Sizes'), ('Glove Sizes'),
('Furniture Sizes'), ('TV Sizes'), ('Laptop Sizes'), ('Bag Sizes'), ('Bed Sizes'),
('Curtain Sizes'), ('Bicycle Sizes'), ('Bottle Sizes'), ('Toy Sizes'), ('Monitor Sizes'),
('Book Sizes'), ('Notebook Sizes'), ('Car Sizes'), ('Mirror Sizes'), ('Frame Sizes');

-- Insert into size_option
INSERT INTO size_option (size_value, size_category_id) VALUES
('S', 1), ('M', 1), ('L', 1), ('XL', 1), ('XXL', 1),
('6', 2), ('7', 2), ('8', 2), ('9', 2), ('10', 2),
('5', 2), ('11', 2), ('Small', 3), ('Medium', 3), ('Large', 3),
('One Size', 4), ('Adjustable', 4), ('Standard', 5), ('Custom', 5), ('Universal', 5);

-- Insert into product
INSERT INTO product (product_name, description, base_price, brand_id, category_id) VALUES
('Nike Air Zoom', 'Running Shoes', 120.00, 1, 3),
('Adidas Ultraboost', 'Boost technology shoes', 150.00, 2, 3),
('iPhone 14', 'Latest Apple smartphone', 999.00, 3, 2),
('Samsung Galaxy S23', 'High-end Android phone', 899.00, 4, 2),
('Sony WH-1000XM4', 'Noise cancelling headphones', 350.00, 5, 2),
('Puma Sports Shirt', 'Breathable material', 40.00, 6, 1),
('Zara Leather Jacket', 'Premium leather jacket', 200.00, 7, 1),
('Gucci Sunglasses', 'Luxury eyewear', 450.00, 8, 4),
('Surface Laptop 5', 'Touchscreen laptop', 1300.00, 9, 2),
('Echo Dot 5', 'Smart speaker', 60.00, 10, 2),
('Reebok Running Shorts', 'Lightweight shorts', 30.00, 11, 1),
('Under Armour Hoodie', 'Warm and cozy', 70.00, 12, 1),
('LG OLED TV', 'Smart TV 55 inches', 1200.00, 13, 2),
('HP Pavilion Laptop', 'Core i7, 16GB RAM', 950.00, 14, 2),
('Dell XPS 13', 'Ultra-slim laptop', 1200.00, 15, 2),
('Lenovo ThinkPad', 'Business laptop', 1100.00, 16, 2),
('Asus ROG Phone', 'Gaming smartphone', 1100.00, 17, 2),
('Chanel No.5', 'Classic perfume', 250.00, 18, 8),
('Prada Backpack', 'Luxury backpack', 700.00, 19, 4),
('H&M Basic T-Shirt', 'Everyday wear', 20.00, 20, 1);

-- Insert into product_variation
INSERT INTO product_variation (product_id, color_id, size_option_id) VALUES
(1, 1, 6), (1, 2, 7), (2, 3, 8), (2, 4, 9), (3, 5, NULL),
(4, 6, NULL), (5, 7, NULL), (6, 8, 1), (7, 9, 2), (8, 10, NULL),
(9, 11, NULL), (10, 12, NULL), (11, 13, 1), (12, 14, 2), (13, 15, NULL),
(14, 16, NULL), (15, 17, NULL), (16, 18, NULL), (17, 19, NULL), (18, 20, NULL);

-- Insert into product_item
INSERT INTO product_item (variation_id, stock_quantity, price, sku) VALUES
(1, 50, 120.00, 'SKU001'), (2, 45, 120.00, 'SKU002'), (3, 30, 150.00, 'SKU003'), (4, 25, 150.00, 'SKU004'), (5, 15, 999.00, 'SKU005'),
(6, 10, 899.00, 'SKU006'), (7, 20, 350.00, 'SKU007'), (8, 40, 40.00, 'SKU008'), (9, 30, 200.00, 'SKU009'), (10, 25, 450.00, 'SKU010'),
(11, 35, 1300.00, 'SKU011'), (12, 45, 60.00, 'SKU012'), (13, 50, 30.00, 'SKU013'), (14, 40, 70.00, 'SKU014'), (15, 20, 1200.00, 'SKU015'),
(16, 25, 950.00, 'SKU016'), (17, 30, 1200.00, 'SKU017'), (18, 20, 1100.00, 'SKU018'), (19, 15, 1100.00, 'SKU019'), (20, 10, 250.00, 'SKU020');

-- Insert into attribute_category
INSERT INTO attribute_category (category_name) VALUES
('Physical'), ('Technical'), ('Performance'), ('Aesthetic'), ('Functional'),
('Environmental'), ('Warranty'), ('Material'), ('Size'), ('Color'), 
('Battery'), ('Durability'), ('Connectivity'), ('Display'), ('Memory'),
('Processor'), ('Storage'), ('Camera'), ('Software'), ('Sound');

-- Insert into attribute_type
INSERT INTO attribute_type (type_name) VALUES
('Text'), ('Number'), ('Boolean'), ('Date'), ('Decimal'),
('Integer'), ('String'), ('Float'), ('Enum'), ('Range'),
('Percentage'), ('Currency'), ('Timestamp'), ('Geo'), ('Multiselect'),
('Password'), ('Image URL'), ('Color Code'), ('Rating'), ('Version');

-- Insert into product_attribute
INSERT INTO product_attribute (product_id, attribute_name, attribute_value, attribute_type_id, attribute_category_id) VALUES
(1, 'Material', 'Mesh', 1, 8), (1, 'Weight', '250g', 2, 1), (2, 'Boost Technology', 'Yes', 3, 3),
(2, 'Warranty', '1 year', 1, 7), (3, 'Screen Size', '6.1 inch', 1, 14),
(3, 'Battery Life', '20 hours', 2, 11), (4, 'RAM', '12GB', 2, 16), (4, 'Storage', '256GB', 2, 17),
(5, 'Noise Cancelling', 'Yes', 3, 3), (5, 'Color', 'Black', 18, 10),
(6, 'Material', 'Polyester', 1, 8), (7, 'Material', 'Leather', 1, 8), (8, 'Frame', 'Metal', 1, 8),
(9, 'Touchscreen', 'Yes', 3, 5), (10, 'Smart Speaker', 'Yes', 3, 5),
(11, 'Material', 'Polyester', 1, 8), (12, 'Material', 'Cotton Blend', 1, 8),
(13, 'Display', '4K OLED', 1, 14), (14, 'RAM', '16GB', 2, 16), (15, 'Processor', 'Intel Core i7', 1, 16);

-- Insert into product_image
INSERT INTO product_image (product_id, image_url, is_primary, alt_text) VALUES
(1, 'https://images.pexels.com/photos/4252970/pexels-photo-4252970.jpeg', TRUE, 'Nike Air Zoom Running Shoes'),
(2, 'https://images.pexels.com/photos/7501135/pexels-photo-7501135.jpeg', TRUE, 'Adidas Ultraboost Running Shoes'),
(3, 'https://images.pexels.com/photos/30353222/pexels-photo-30353222.jpeg', TRUE, 'iPhone 14 Front View'),
(4, 'https://images.pexels.com/photos/15493878/pexels-photo-15493878.jpeg', TRUE, 'Samsung Galaxy S23 Front'),
(5, 'https://images.pexels.com/photos/10292805/pexels-photo-10292805.jpeg', TRUE, 'Sony Noise Cancelling Headphones'),
(6, 'https://images.pexels.com/photos/20102169/pexels-photo-20102169.jpeg', TRUE, 'Puma Sports Shirt'),
(7, 'https://www.mytheresa.com/media/2310/2612/100/86/P00855238.jpg', TRUE, 'Zara Leather Jacket'),
(8, 'https://images.pexels.com/photos/12901704/pexels-photo-12901704.jpeg​', TRUE, 'Gucci Sunglasses'),
(9, 'https://www.pexels.com/photo/semi-opened-laptop-computer-turned-on-on-table-2047905/', TRUE, 'Microsoft Surface Laptop 5'),
(10, 'https://images.pexels.com/photos/4790267/pexels-photo-4790267.jpeg​', TRUE, 'Amazon Echo Dot 5'),
(11, 'https://images.pexels.com/photos/4348621/pexels-photo-4348621.jpeg​', TRUE, 'Reebok Running Shorts'),
(12, 'https://www.shutterstock.com/image-photo/tesanj-bosnia-herzegovina-december-29-2023-2409154405', TRUE, 'Under Armour Hoodie'),
(13, 'https://images.pexels.com/photos/29942709/pexels-photo-29942709.jpeg', TRUE, 'LG OLED Smart TV'),
(14, ' https://images.pexels.com/photos/13823992/pexels-photo-13823992.jpeg', TRUE, 'HP Pavilion Laptop'),
(15, 'https://images.pexels.com/photos/1092652/pexels-photo-1092652.jpeg', TRUE, 'Dell XPS 13 Laptop'),
(16, 'https://images.pexels.com/photos/1359327/pexels-photo-1359327.jpeg', TRUE, 'Lenovo ThinkPad Laptop'),
(17, 'https://images.pexels.com/photos/9956771/pexels-photo-9956771.jpeg', TRUE, 'Asus ROG Gaming Phone'),
(18, ' https://images.pexels.com/photos/21008924/pexels-photo-21008924.jpeg', TRUE, 'Chanel No.5 Perfume'),
(19, 'https://images.pexels.com/photos/8365688/pexels-photo-8365688.jpeg', TRUE, 'Prada Luxury Backpack'),
(20, 'https://images.pexels.com/photos/8532616/pexels-photo-8532616.jpeg', TRUE, 'H&M Basic T-Shirt');
