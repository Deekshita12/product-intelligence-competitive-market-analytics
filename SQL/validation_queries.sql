/*==============================================================

 Project : Product Intelligence & Competitive Market Analytics

 File    : validation_queries.sql

 Purpose : Validates the fact table, dimension tables
           and analytical views after data loading.

 Database: pricing_analytics
 Schema  : analytics

==============================================================*/

SELECT COUNT(*)
FROM analytics.fact_products;

SELECT *
FROM analytics.competitiveness
LIMIT 5;

SELECT *
FROM analytics.market_saturation
LIMIT 5;

SELECT *
FROM analytics.premiumization
LIMIT 5;

SELECT *
FROM analytics.hidden_gems
LIMIT 5;

SELECT *
FROM analytics.growth_opportunity
LIMIT 5;
