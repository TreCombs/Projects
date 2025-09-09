System Design: Malicious URL Enrichment and Analysis
1. Data Ingestion Layer

Source: Raw CSV files containing URLs, uploaded to Azure Storage (e.g., ADLS Gen2 or Blob Storage).

Security: Access to storage is managed via Databricks secret scopes; SAS tokens or service principals ensure no secrets are exposed in code.

Tools: Databricks notebooks, Pandas for initial read (for small files), Spark for scalable ingestion.

2. Data Processing & Transformation Layer

Compute: Databricks clusters (PySpark) process raw data.

Transformations:

Extract domain and top-level domain (TLD) from URLs.

Enrich domains with WHOIS information (domain owner/organization).

Generate derived features (e.g., character counts, presence of specific letters).

Scalability: Spark UDFs allow distributed processing across large datasets.

Intermediate Storage: Temporary views in Spark for staging transformations.

3. Data Analytics Layer

SQL Aggregations:

Count distinct domains per type.

Compute percentages of total domains by type.

Assign severity rankings to URLs (High, Medium High, Medium, Low).

Tools: Databricks SQL for queries and dashboards.

Outputs: Top domains by severity and type distributions for analysis.

4. Data Storage Layer

Destination: Enriched dataset stored in Delta tables in Azure Storage.

Features:

ACID transactions and versioning for traceability.

Scalable storage for large datasets.

5. Security & Governance

Credential Management: All secrets stored in Databricks Secret Scope, not in notebooks.

Access Control:

Unity Catalog governs access to tables and external locations.

External locations ensure controlled access between Databricks and Azure Storage.

Databricks Connector manages secure connectivity to cloud storage.

Compliance: Auditable logs for data access and modifications.

6. Data Consumption Layer

Consumers: Analysts, data scientists, and security teams.

Use Cases:

Identifying malicious domains.

Building predictive models for phishing/malware detection.

Reporting and visualization.

Interface: SQL queries, dashboards, or exported datasets.
