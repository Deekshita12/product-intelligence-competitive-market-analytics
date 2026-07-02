/*==============================================================

 Project : Product Intelligence & Competitive Market Analytics

 File    : dimension_queries.sql

 Purpose : Populates the dimension tables from the
           processed product data.

 Database: pricing_analytics
 Schema  : analytics

==============================================================*/

CREATE TABLE analytics.dim_category AS
SELECT DISTINCT main_category
FROM analytics.fact_products;

CREATE TABLE analytics.dim_subcategory AS
SELECT DISTINCT
main_category,
sub_category
FROM analytics.fact_products;

CREATE TABLE analytics.dim_price_segment AS
SELECT DISTINCT
price_category
FROM analytics.fact_products;
