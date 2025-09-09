
<img width="1536" height="1024" alt="Malicious URL System" src="https://github.com/user-attachments/assets/1052e0d4-9d20-4ba0-86f4-ab789c2bc71e" />

🚨 Malicious URL Enrichment and Analysis
🌟 Overview

This project ingests raw URL datasets from Azure Storage, enriches them with domain-level features, performs analytics, and stores the results in a secure Delta table.
It provides a scalable, auditable pipeline for cybersecurity analysis.

🛠 Workflow
1️⃣ Secure Data Ingestion

Raw CSVs landed in Azure Storage.

Credentials are managed via Databricks Secret Scopes.

Spark ingests and prepares data for processing.

2️⃣ Domain Enrichment & Feature Engineering

Extract domains and TLDs.

WHOIS lookups for domain ownership.

Features include letter counts and A/T presence.

Scalable using PySpark UDFs.

3️⃣ Analytics & Ranking

Aggregate distinct domains by type.

Assign severity ranks:

🔴 High → Malware

🟠 Medium High → Defacement

🟡 Medium → Phishing

🟢 Low → Benign                                                                                                    

Prioritize critical URLs for analysis.

4️⃣ Secure Storage & Governance

Enriched datasets stored in Delta tables in Azure Storage.

Security enforced via:

Databricks Secret Scopes

External Locations & Databricks Connector

Unity Catalog Permissions

🔑 Key Benefits

✅ Scalable distributed pipeline for enrichment

✅ Secure & auditable access to sensitive data

✅ Governed dataset ready for analytics or ML

💻 Technologies Used
Layer	Technology
Ingestion	Databricks, Python, Pandas
Transformation	PySpark, UDFs, tldextract, whois
Analytics	Databricks SQL, Delta Lake
Storage & Security	Azure Storage, Unity Catalog, Databricks Connector

