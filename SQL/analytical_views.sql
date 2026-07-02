-- =====================================================
-- ANALYTICAL VIEWS
-- Project: Competitive Product Intelligence Platform
-- Database: pricing_analytics
-- Schema: analytics
-- =====================================================

---------------------------------------------------------
-- 1. COMPETITIVENESS VIEW
---------------------------------------------------------

CREATE OR REPLACE VIEW analytics.competitiveness AS
SELECT
    main_category,

    ROUND(
        AVG(discount_percent)::numeric,
        2
    ) AS avg_discount,

    ROUND(
        AVG(no_of_ratings)::numeric,
        2
    ) AS avg_reviews,

    ROUND(
        (
            AVG(discount_percent)
            *
            LN(AVG(no_of_ratings) + 1)
        )::numeric,
        2
    ) AS competitiveness_score

FROM analytics.fact_products
GROUP BY main_category;


---------------------------------------------------------
-- 2. MARKET SATURATION VIEW
---------------------------------------------------------

CREATE OR REPLACE VIEW analytics.market_saturation AS
SELECT
    main_category,

    COUNT(*) AS products,

    ROUND(
        AVG(no_of_ratings)::numeric,
        2
    ) AS avg_reviews,

    ROUND(
        (
            COUNT(*)
            *
            LN(AVG(no_of_ratings) + 1)
        )::numeric,
        2
    ) AS saturation_score

FROM analytics.fact_products
GROUP BY main_category;


---------------------------------------------------------
-- 3. PREMIUMIZATION VIEW
---------------------------------------------------------

CREATE OR REPLACE VIEW analytics.premiumization AS
SELECT
    main_category,
    round(avg(actual_price)::numeric, 2) AS avg_price,
    round(avg(ratings)::numeric, 2) AS avg_rating,
    round(
    (
        ln(avg(actual_price) + 1)
        * avg(ratings)
        * 100
    )::numeric,
    2
    ) AS premiumization_index
FROM analytics.fact_products
GROUP BY main_category;

ALTER TABLE analytics.premiumization
OWNER TO postgres;

---------------------------------------------------------
-- 4. HIDDEN GEMS VIEW
---------------------------------------------------------

CREATE OR REPLACE VIEW analytics.hidden_gems AS
SELECT
    name,
    main_category,
    ratings,
    no_of_ratings,
    discount_price,

    ROUND(
        value_score::numeric,
        2
    ) AS value_score

FROM analytics.fact_products
WHERE ratings >= 4
AND no_of_ratings >= 100;


---------------------------------------------------------
-- 5. GROWTH OPPORTUNITY VIEW
---------------------------------------------------------

CREATE OR REPLACE VIEW analytics.growth_opportunity AS
SELECT
    main_category,

    ROUND(
        (
            (
                AVG(ratings)
                *
                COUNT(*)
            )
            /
            LN(
                AVG(no_of_ratings) + 1
            )
        )::numeric,
        2
    ) AS growth_opportunity_score

FROM analytics.fact_products
GROUP BY main_category;