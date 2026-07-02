# 🗄️ SQL Scripts

This folder contains the SQL scripts used to build the analytical database for the **Product Intelligence & Competitive Market Analytics** project.

The scripts create the database schema, define the analytical data model, generate business-focused SQL views, validate data integrity and support reporting in Power BI.

---

## SQL Workflow

The SQL scripts should be executed in the following order:

| Step | Script | Purpose |
|------|--------|---------|
| 1 | `schema.sql` | Creates the analytics schema. |
| 2 | `create_tables.sql` | Creates the fact and dimension tables. |
| 3 | `dimension_queries.sql` | Populates the dimension tables. |
| 4 | `analytical_views.sql` | Creates analytical SQL views for reporting. |
| 5 | `validation_queries.sql` | Validates the database objects and analytical views. |
| 6 | `analysis_queries.sql` | Executes business queries for data analysis and insight generation. |

---

## Database Structure

The analytical database consists of:

### Fact Table

- `fact_products`

### Dimension Tables

- `dim_category`
- `dim_subcategory`
- `dim_price_segment`

### Analytical Views

- `competitiveness`
- `market_saturation`
- `premiumization`
- `hidden_gems`
- `growth_opportunity`

---

## Business Purpose

The SQL layer is responsible for:

- Creating the analytical data model
- Organizing product information into fact and dimension tables
- Calculating business metrics
- Supporting competitive market analysis
- Preparing optimized datasets for Power BI reporting

---

## Technologies Used

- PostgreSQL
- SQL
- Power BI
- Python (ETL)

---

The SQL scripts form the core analytical layer of the project, transforming processed product data into business-ready datasets that support interactive dashboards and strategic decision-making.
