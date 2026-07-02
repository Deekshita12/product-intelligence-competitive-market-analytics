-- =====================================================
-- CREATE FACT AND DIMENSION TABLES
-- Project: Competitive Product Intelligence Platform
-- Database: pricing_analytics
-- Schema: analytics
-- =====================================================

CREATE TABLE analytics.dim_category (
    category_id SERIAL PRIMARY KEY,
    main_category VARCHAR(100) UNIQUE
);

CREATE TABLE analytics.dim_subcategory (
    subcategory_id SERIAL PRIMARY KEY,
    main_category VARCHAR(100),
    sub_category VARCHAR(150)
);

CREATE TABLE analytics.dim_price_segment (
    price_segment_id SERIAL PRIMARY KEY,
    price_category VARCHAR(50)
);

CREATE TABLE analytics.fact_products (
    product_id SERIAL PRIMARY KEY,
    name TEXT,
    main_category VARCHAR(100),
    sub_category VARCHAR(150),
    image TEXT,
    link TEXT,
    ratings NUMERIC,
    no_of_ratings BIGINT,
    discount_price NUMERIC,
    actual_price NUMERIC,
    discount_percent NUMERIC,
    value_score NUMERIC,
    price_category VARCHAR(50),
    source_file VARCHAR(100)
);