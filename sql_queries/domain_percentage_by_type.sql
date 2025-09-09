
SELECT 
    type,
    COUNT(DISTINCT domain) AS domain_count,
    ROUND(
        COUNT(DISTINCT domain) * 100.0 / SUM(COUNT(DISTINCT domain)) OVER (), 
        2
    ) AS percentage_of_total
FROM malicious_urls_project_catalog.enriched_data.malicious_urls_enriched
GROUP BY type
ORDER BY domain_count DESC;