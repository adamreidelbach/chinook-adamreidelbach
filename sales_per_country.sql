SELECT c.Country, SUM(i.Total) as "TotalSalesPerCountry"
FROM Customer c, Invoice i
WHERE c.CustomerId = i.CustomerId
GROUP BY c.Country;
