import pandas as pd
from sqlalchemy import create_engine

DATABASE_URL = (
    "postgresql+psycopg2://"
    "postgres:"
    "Deekshita%400308"
    "@localhost:5432/"
    "pricing_analytics"
)

engine = create_engine(DATABASE_URL)

print("Reading cleaned dataset...")

df = pd.read_csv(
    "data/processed/clean_products.csv",
    low_memory=False
)

print(f"Rows Found: {len(df):,}")

print("Uploading to PostgreSQL...")

df.to_sql(
    name="fact_products",
    con=engine,
    schema="analytics",
    if_exists="replace",
    index=False,
    chunksize=10000,
    method="multi"
)

print("Data Loaded Successfully!")