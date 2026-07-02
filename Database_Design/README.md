# 🗄️ Database Design

This folder contains the Entity Relationship (ER) Diagram representing the analytical database designed for the **Product Intelligence & Competitive Market Analytics** project.

The database follows a dimensional modeling approach, consisting of one central fact table and multiple supporting dimension tables to enable efficient analytical reporting and seamless integration with Power BI.

---

## Database Components

### 📊 Fact Table

**fact_products**

Stores product-level transactional and analytical information, including:

- Product Details
- Pricing Information
- Customer Ratings
- Discount Metrics
- Value Score
- Price Category
- Source Information

---

### 📂 Dimension Tables

#### dim_category

Stores the unique product categories used for category-level analysis.

#### dim_subcategory

Stores the relationship between product categories and their respective subcategories.

#### dim_price_segment

Stores product price classifications such as:

- Budget
- Mid Range
- Premium
- Luxury

---

## Entity Relationship Diagram

**File Included**

- `database_er_diagram.png`

The ER Diagram illustrates the logical relationship between the fact table and dimension tables used throughout the analytics pipeline.

---

## Database Design Goals

- Efficient analytical querying
- Simplified data modeling
- Support for SQL analytical views
- Optimized integration with Power BI
- Scalable reporting structure

---

## Technologies Used

| Technology | Purpose |
|------------|---------|
| PostgreSQL | Analytical Database |
| SQL | Database Design & Queries |
| Power BI | Reporting & Visualization |
| DAX | Business Metrics & KPIs |

---

The database structure provides a scalable foundation for business intelligence reporting, enabling efficient querying, analytical processing  and interactive dashboard development.
