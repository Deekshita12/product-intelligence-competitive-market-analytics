import pandas as pd
from pathlib import Path

RAW_FOLDER = Path("data/raw")
PROCESSED_FOLDER = Path("data/processed")

all_files = list(RAW_FOLDER.glob("*.csv"))

dfs = []

for file in all_files:
    print(f"Reading {file.name}")

    df = pd.read_csv(
        file,
        low_memory=False
    )

    df["source_file"] = file.stem

    dfs.append(df)

master_df = pd.concat(
    dfs,
    ignore_index=True
)

#################################################
# CLEANING
#################################################

master_df.drop(
    columns=["Unnamed: 0"],
    errors="ignore",
    inplace=True
)

master_df["ratings"] = pd.to_numeric(
    master_df["ratings"],
    errors="coerce"
)

master_df["no_of_ratings"] = (
    master_df["no_of_ratings"]
    .astype(str)
    .str.replace(",", "")
)

master_df["no_of_ratings"] = pd.to_numeric(
    master_df["no_of_ratings"],
    errors="coerce"
)

master_df["discount_price"] = (
    master_df["discount_price"]
    .astype(str)
    .str.replace("₹", "")
    .str.replace(",", "")
)

master_df["actual_price"] = (
    master_df["actual_price"]
    .astype(str)
    .str.replace("₹", "")
    .str.replace(",", "")
)

master_df["discount_price"] = pd.to_numeric(
    master_df["discount_price"],
    errors="coerce"
)

master_df["actual_price"] = pd.to_numeric(
    master_df["actual_price"],
    errors="coerce"
)

master_df.drop_duplicates(
    inplace=True
)

master_df.reset_index(
    drop=True,
    inplace=True
)

#################################################
# CREATE DISCOUNT %
#################################################

master_df["discount_percent"] = (
    (
        master_df["actual_price"]
        -
        master_df["discount_price"]
    )
    /
    master_df["actual_price"]
) * 100

#################################################
# CREATE VALUE SCORE
#################################################

master_df["value_score"] = (
    master_df["ratings"]
    *
    master_df["no_of_ratings"]
) / (
    master_df["discount_price"] + 1
)

#################################################
# CREATE PRICE CATEGORY
#################################################

master_df["price_category"] = pd.cut(
    master_df["discount_price"],
    bins=[0,500,2000,10000,1000000],
    labels=[
        "Budget",
        "Mid Range",
        "Premium",
        "Luxury"
    ]
)

print(master_df.info())
print(master_df.head())

master_df.to_csv(
    "data/processed/clean_products.csv",
    index=False
)

print("Clean dataset created.")