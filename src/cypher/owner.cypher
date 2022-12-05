

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/qiushiyan/nyc-properties-knowledge-graph/main/data/tax_small_final.csv" AS row
MERGE(b:BBL  {address: row.tax_property_address, bbl: row.bbl})
MERGE(o:OWNER {name: row.tax_owner_name})
MERGE (o)-[r:TAX_ASSESSOR_OWNER] -> (b) 

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/qiushiyan/nyc-properties-knowledge-graph/main/data/deed_small_final.csv" AS row
MATCH(b:BBL {bbl: row.bbl})
MERGE(o:OWNER {name: row.deed_owner_name, address: row.deed_owner_address})
MERGE (o)-[r1:DEED_OWNER {date: row.deed_date}]->(b)

LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/qiushiyan/nyc-properties-knowledge-graph/main/data/permit_small_final.csv' AS row
MATCH(b:BBL {bbl: row.bbl})
MERGE(o:OWNER {name: row.permit_owner_name, business_name: row.permit_business_name, address: row.permit_owner_address})
MERGE(p:PHONE {phone: row.permit_owner_phone})
MERGE (o)-[r1:PERMIT_OWNER {date: row.permit_date}]-> (b)

