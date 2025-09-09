SELECT
    url,
    type,
    domain,
    CASE 
        WHEN type = 'malware' THEN 'High'
        WHEN type = 'defacement' THEN 'Medium High'
        WHEN type = 'phishing' THEN 'Medium'
        WHEN type = 'benign' THEN 'Low'
    END AS severity_rank
FROM malicious_urls_project_catalog.enriched_data.malicious_urls_enriched
where type is not null and domain is not null
ORDER BY 
    CASE 
        WHEN type = 'malware' THEN 1
        WHEN type = 'defacement' THEN 2
        WHEN type = 'phishing' THEN 3
        WHEN type = 'benign' THEN 4
    END;