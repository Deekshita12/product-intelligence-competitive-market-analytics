from pathlib import Path
from sqlalchemy import create_engine, text

# PostgreSQL Database Connection
DATABASE_URL = (
    "postgresql+psycopg2://"
    "postgres:"
    "Deekshita%400308"
    "@localhost:5432/"
    "pricing_analytics"
)

engine = create_engine(DATABASE_URL)

print("=" * 60)
print("Creating Analytical Views")
print("=" * 60)

try:
    # Path to analytical SQL file
    sql_file = Path(__file__).resolve().parent.parent / "sql" / "analytical_views.sql"

    with open(sql_file, "r", encoding="utf-8") as file:
        sql_script = file.read()

    # Execute SQL
    with engine.begin() as connection:
        connection.execute(text(sql_script))

    print("✓ Analytical views created successfully.")
    print("✓ Database updated.")

except Exception as e:
    print("❌ Error creating analytical views.")
    print(e)

finally:
    engine.dispose()
    print("Database connection closed.")