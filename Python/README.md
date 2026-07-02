# 🐍 Python Scripts

This folder contains the Python scripts used to build the ETL pipeline for the **Product Intelligence & Competitive Market Analytics** project.

The scripts automate data preprocessing, database loading, and analytical view creation before the data is visualized in Power BI.

---

## Script Overview

| Script | Purpose |
|---------|---------|
| `transform_data.py` | Cleans, transforms, and prepares the raw product dataset for analysis. |
| `load_data.py` | Loads the processed dataset into the PostgreSQL analytical database. |
| `create_views.py` | Creates analytical SQL views used for reporting and Power BI dashboards. |

---

## ETL Workflow

```text
Raw Dataset
      │
      ▼
transform_data.py
      │
      ▼
Processed Dataset
      │
      ▼
load_data.py
      │
      ▼
PostgreSQL Database
      │
      ▼
create_views.py
      │
      ▼
Analytical SQL Views
      │
      ▼
Power BI Dashboard
```

---

## Technologies Used

- Python
- Pandas
- NumPy
- SQLAlchemy
- Psycopg2
- PostgreSQL

---

These scripts automate the complete ETL process, ensuring that the data is clean, structured, and optimized for analytical reporting.
