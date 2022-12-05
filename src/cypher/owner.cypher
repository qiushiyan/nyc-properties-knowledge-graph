"""LOAD TAX, DEEDS, AND PERMITS"""

LOAD CSV ///NYC_Tax_Project_1_Final_Small.csv' AS row
WITH HEADERS FROM 'file:
MERGE (b:BBL { // set BBL properties})
  MERGE (o:OWNER { // set owner properties})
    MERGE (o)-[r:TAX_ASSESSOR_OWNER { // set relationship properties}]->(b);
      
      LOAD CSV ///NYC_Deeds_Project_1_Final_Small.csv' AS row
WITH HEADERS FROM 'file:
      MATCH (b:BBL { bbl: row.BBL })
      MERGE (o:OWNER { name: row.NAME })
      MERGE (o)-[r1:DEED_OWNER { // set relationship properties}]->(b)
        FOREACH ( // only create an address and a relationship if the address is not null);
        
        LOAD CSV ///NYC_Permit_Project_1_Final_Small.csv' AS row
WITH HEADERS FROM 'file:
        # only create a row if the date is NOT null
        MATCH (b:BBL { bbl: row.BBL })
        MERGE (o:OWNER { name: row.OWNER_FULL_NAME })
        MERGE (o)-[r1:PERMIT_OWNER { # SET relationship properties }}]->(b)
        FOREACH ( // only create an address and a relationship if the address is not null);
        
        """DISPLAY ALL NODES"""
        
        MATCH (n)
        RETURN n;
        
        "OR"
        
        MATCH (n1)-[r]->(n2)
        RETURN n1, r, n2;
        
        """DELETE UNAVAILABLE OWNER NODE"""
        
        MATCH (e:OWNER { name: 'UNAVAILABLE OWNER' })
        DETACH DELETE e;
        
        """TOP 3 OWNERS PER DISTINCT BBLs"""
        
        MATCH (o:OWNER)-[]->(b:BBL)
// collect number of distinct BBLs and return by descending order;
        
        Answer: ???
        
        """EMPIRE STATE BUILDING OWNER CONTACT"""
        
        MATCH (b:BBL{ bbl: '1008350041' })
        MATCH (o:OWNER)-[r1]->(b)
// add in optional match between owner and address and return
        
        Answer: ???
        
        """OWNER BBL 1006971016"""
        
        MATCH // owner to bbl
        
        Answer: ???
        
        """CONTACT ADDRESS BBL 1007330008"""
        
        MATCH // address to owner to bbl
        
        Answer: ???
        
        """NUMBER OF TOTAL BBL"""
        
        MATCH (b:BBL)
        RETURN COUNT(b);
        
        Answer: ???
        
        """BBL W/O TAX OWNER"""
        
        MATCH (b:BBL), ()-[r]-(b)
        WITH // collecting distinct relationship types
// which do not contain TAX_ASSESSOR_OWNER
        
        Answer: ???
        
        """BBL W/ TAX AND DEED OWNER"""
        
        MATCH (b:BBL), ()-[r]-(b)
        WITH // collecting distinct relationship types
// which contain TAX_ASSESSOR_OWNER and DEED_OWNER
        
        Answer: ???
        
        """OPTIONAL LOAD FOR LARGE GRAPH"""
        
        CALL apoc.periodic.iterate(
// load tax data
        );
        
        CALL apoc.periodic.iterate(
// load deed data
        );
        
        CALL apoc.periodic.iterate(
// load permit data
        );
