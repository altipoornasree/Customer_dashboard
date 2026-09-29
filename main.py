import pandas as pd
from sqlalchemy import create_engine
df=pd.read_csv("dataset.csv")
df["Review Rating"]=df.groupby("Category")["Review Rating"].transform(lambda x:x.median())
df.columns=df.columns.str.lower()
df.columns=df.columns.str.replace(" ","_")
df.rename(columns={"purchase_amount_(usd)":"purchase_amount"},inplace=True)
# we are actually dividing according to the group
labels=["Young Adult","Adult","Middle-aged","Senior"]
df["age_group"]=pd.qcut(df["age"] ,q=4,labels=labels)
# creat column purchase of frequency in terms numbers
frequency_map={
    "Fortnightly":14,
    "Weekly":7,
    "Quarterly":90,
    "Monthly":30,
    "Bi-Weekly":14,
    "Annually":365,
    "Every 3 months":90
}
df["purchase_frequency_days"]=df["frequency_of_purchases"].map(frequency_map)
#print(df[["purchase_frequency_days","frequency_of_purchases"]])
df.drop("promo_code_used",axis=1,inplace=True)
db_user="postgres"
db_password="Alti%402005"
db_host="localhost"
db_port="5432"
db_name="postgres"
engine=create_engine(f"postgresql+psycopg2://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}")
table_name='customer_records'
df.to_sql(table_name,engine,index=False,if_exists="replace")
print(f"success automatically created")
