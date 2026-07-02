/*==============================================================

 Project : Product Intelligence & Competitive Market Analytics

 File    : analysis_queries.sql

 Purpose : Executes business analysis queries used to
           evaluate marketplace performance and generate
           strategic insights.

 Database: pricing_analytics
 Schema  : analytics

==============================================================*/

SELECT *
FROM analytics.competitiveness
ORDER BY competitiveness_score DESC;

SELECT *
FROM analytics.market_saturation
ORDER BY saturation_score DESC;

SELECT *
FROM analytics.premiumization
ORDER BY premiumization_index DESC;

SELECT *
FROM analytics.hidden_gems
ORDER BY value_score DESC
LIMIT 20;

SELECT *
FROM analytics.growth_opportunity
ORDER BY growth_opportunity_score DESC;
