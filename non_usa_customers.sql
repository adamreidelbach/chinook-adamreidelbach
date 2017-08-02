SELECT FirstName || " " || lastName "Name", customerID, country
FROM Customer
WHERE Country!="USA";