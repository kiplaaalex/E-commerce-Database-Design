E-commerce Database Design
Overview
This repository contains the SQL schema for an e-commerce platform. The database is designed to manage product information, including brands, categories, sizes, colors, variations, and product items. It is built using MySQL and includes relevant relationships between tables to support an e-commerce application's backend.

Features
Brand Management: Store different product brands.

Product Categories: Define categories such as Electronics, Clothing, etc.

Product Details: Manage individual product listings with descriptions, prices, and attributes.

Product Variations: Track color, size, and SKU variations for products.

Product Images: Link multiple images to products with the ability to set a primary image.

Attribute Management: Allow product attributes (e.g., material, warranty) to be assigned and categorized.

Database Schema
The database includes the following tables:

brand: Stores information about product brands.

product_category: Stores product categories like Electronics, Clothing, etc.

product: Contains product details such as name, description, and base price.

color: Stores color options for product variations.

size_category: Defines different size categories (e.g., clothing sizes, shoe sizes).

size_option: Tracks specific size options within a category.

product_variation: Links products with color and size variations.

product_item: Tracks individual items (SKUs) and their stock.

attribute_category: Defines categories for product attributes.

attribute_type: Specifies types of attributes (e.g., text, number).

product_attribute: Stores attributes for each product.

product_image: Stores links to product images with primary image designation.

Setup Instructions
To set up the database, follow these steps:

Install MySQL: Make sure you have MySQL installed on your system. You can download it from the official website.

Create the Database:

sql
Copy
Edit
CREATE DATABASE ecommerce;
USE ecommerce;
Execute the Schema: Copy and paste the SQL schema into your MySQL client to create the tables.

Insert Data: After creating the tables, you can insert sample data by running the INSERT statements provided in the SQL script.

Sample Data
The database includes sample data for products like:

Nike Air Zoom: A pair of running shoes.

iPhone 14: Apple’s latest smartphone.

Zara Leather Jacket: A premium leather jacket.

Each product can have different variations such as size and color, and multiple images are associated with each product.

GitHub Repository
You can find the source code for this project at the following GitHub repository:

https://github.com/kiplaaalex

License
This project is licensed under the MIT License - see the LICENSE file for details.
