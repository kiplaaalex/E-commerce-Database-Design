E-Commerce Database Project
Overview
This repository contains the SQL schema and design for an e-commerce platform database. It includes all necessary tables for managing products, variations (size, color), stock, images, attributes, and other related entities. The database is designed to handle the typical needs of an online store, including inventory management, product attributes, and various product variations.

Database Schema
The database consists of several interconnected tables, which are defined as follows:

brand: Stores the brand names.

product_category: Defines product categories (e.g., clothing, electronics).

product: General details of products (name, description, base price).

color: Stores available product colors.

size_category & size_option: Manage size information (e.g., S, M, L, 42, etc.).

product_variation: Combines products with their specific color/size variations.

product_item: Stores SKU-related information (stock quantity, price).

attribute_category & attribute_type: Categorizes and defines types of attributes (e.g., text, number).

product_attribute: Custom attributes for products (e.g., material, weight).

product_image: Links images to products.

Getting Started
Prerequisites
Ensure you have a MySQL-compatible database installed. You can use MySQL Workbench, phpMyAdmin, or any other platform that supports MySQL.

Install MySQL Server.

Install a database management tool (e.g., MySQL Workbench or phpMyAdmin).

Setup
Clone this repository to your local machine:

bash
Copy
Edit
git clone https://github.com/yourusername/ecommerce-database.git
Create a new database on your MySQL server:

sql
Copy
Edit
CREATE DATABASE ecommerce;
Import the schema:

Open MySQL Workbench (or any other MySQL client).

Select your ecommerce database.

Copy the ecommerce.sql script and execute it to create all the tables.

API Endpoints
Here are some example REST API endpoints that interact with the e-commerce database:

Products
GET /products: List all products (optional filters: category, brand)

GET /products/:id: Get detailed product information by ID

POST /products: Add a new product

Product Items
GET /product_items/:id: Get specific SKU information

POST /product_items: Add a new SKU

Categories, Colors, Sizes
GET /categories: List all product categories

GET /colors: List all available colors

GET /sizes: List all available sizes

