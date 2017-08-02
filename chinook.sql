--1
SELECT FirstName || " " || lastName "Name", customerID, country
FROM Customer
WHERE Country!="USA";

--2
SELECT FirstName, lastName, customerID, country
FROM Customer
WHERE Country="Brazil";

--3
SELECT c.FirstName, c.lastName, c.Country, i.InvoiceId, i.InvoiceDate, i.BillingCountry
FROM Customer c, Invoice i
WHERE c.Country="Brazil";

--4
SELECT FirstName, LastName
FROM Employee
WHERE Title = "Sales Support Agent";

--5
SELECT DISTINCT BillingCountry
FROM Invoice;

--6
SELECT e.FirstName, e.LastName, e.EmployeeId, c.CustomerId, c.SupportRepId, i.InvoiceId, i.CustomerId
FROM Employee e, Customer c, Invoice i
WHERE e.EmployeeId = c.SupportRepId AND i.CustomerId = c.CustomerId;

--7
SELECT i.Total as "Invoice Total", c.FirstName, c.LastName, c.Country, e.FirstName, e.LastName
FROM Invoice i, Customer c, Employee e

--8
SELECT COUNT(InvoiceId)
FROM Invoice
WHERE InvoiceDate LIKE "2009%" OR InvoiceDate LIKE "2011%";

--9
SELECT SUM(Total)
FROM Invoice 
WHERE InvoiceDate LIKE "2009%" 

--10
SELECT SUM(Total)
FROM Invoice 
WHERE InvoiceDate LIKE "2011%";

--11
SELECT COUNT(InvoiceId)
FROM InvoiceLine
WHERE InvoiceId = 37;

--12
SELECT InvoiceId, COUNT (InvoiceLineId)
FROM InvoiceLine
GROUP BY InvoiceId;

--13
SELECT il.InvoiceId, il.TrackId, t.Name "Track Name"
FROM InvoiceLine il, Track t
WHERE il.TrackId = t.TrackId;

--14
SELECT il.TrackId, t.Name "Track Name", a.Name "Artist Name"
FROM InvoiceLine il, Track t, Artist a, Album al
WHERE il.TrackId = t.TrackId and a.ArtistId = al.ArtistId and t.AlbumId = al.AlbumId;

--15
SELECT pl.Name "Playlist Name", COUNT(plt.TrackId)
FROM Playlist pl, PlaylistTrack plt, Track t
WHERE pl.PlaylistId = plt.PlaylistId and plt.TrackId = t.TrackId
GROUP BY pl.Name;

--16
SELECT t.Name "Track Name",  al.Title "Album Name", mt.Name "Media Type", g.Name "Genre"
FROM Track t, Album al, MediaType mt, Genre g
WHERE t.AlbumId = al.AlbumId and t.MediaTypeId = mt.MediaTypeId and g.GenreId = t.GenreId
GROUP BY t.Name;

--17
SELECT i.*, COUNT(il.InvoiceLineId)
FROM Invoice i, InvoiceLine il
WHERE i.InvoiceId = il.InvoiceId
GROUP BY il.InvoiceId;

--18
SELECT e.FirstName || " " || e.LastName "Name", SUM(i.Total) "Total Sales"
FROM Employee e, Invoice i, Customer c
WHERE i.CustomerId = c.CustomerId AND c.SupportRepId = e.EmployeeId
GROUP BY e.LastName;

--19
SELECT Totals.FirstName || " " || Totals.LastName "Name", MAX(Totals.TotalSales)
FROM (SELECT e.FirstName, e.LastName, SUM(i.Total) as "TotalSales"
FROM Employee e, Invoice i, Customer c
WHERE i.CustomerId = c.CustomerId 
AND c.SupportRepId = e.EmployeeId 
AND i.InvoiceDate LIKE "2009%" 
GROUP BY e.LastName) as "Totals" 

--20
SELECT Totals.FirstName, Totals.LastName, MAX(Totals.TotalSales)
FROM (SELECT e.FirstName, e.LastName, SUM(i.Total) as "TotalSales"
FROM Employee e, Invoice i, Customer c
WHERE i.CustomerId = c.CustomerId 
AND c.SupportRepId = e.EmployeeId 
GROUP BY e.LastName) as "Totals" 

--21
SELECT e.EmployeeId, e.FirstName, e.LastName, COUNT(c.CustomerId) "Customer Count"
FROM Employee e, Customer c
WHERE c.SupportRepId = e.EmployeeId
GROUP BY e.LastName;

--22
SELECT c.Country, SUM(i.Total) as "TotalSalesPerCountry"
FROM Customer c, Invoice i
WHERE c.CustomerId = i.CustomerId
GROUP BY c.Country;

--23 
SELECT CountrySpent.Country, MAX(CountrySpent.TotalSalesPerCountry)
FROM (SELECT c.Country, SUM(i.Total) as "TotalSalesPerCountry"
FROM Customer c, Invoice i
WHERE c.CustomerId = i.CustomerId
GROUP BY c.Country) as "CountrySpent"

--24
SELECT TrackSales.Name, MAX(TrackSales.TotalSales)
FROM (SELECT t.Name, SUM(i.Total) as "TotalSales"
FROM Track t, Invoice i, InvoiceLine il
WHERE t.TrackId = il.TrackId and i.InvoiceId = il.InvoiceId and i.InvoiceDate LIKE "2013%" GROUP BY t.Name) as "TrackSales"

--25
SELECT t.Name, SUM(i.Total) as "TotalSales"
FROM Track t, Invoice i, InvoiceLine il
WHERE t.TrackId = il.TrackId and i.InvoiceId = il.InvoiceId
GROUP BY t.Name
ORDER BY TotalSales DESC
LIMIT 5;

--26
SELECT a.Name, COUNT(i.Total) as "TotalSales"
FROM Artist a, Invoice i, InvoiceLine il, Track t, Album al
WHERE il.TrackId = t.TrackId 
and t.AlbumId = al.AlbumId 
and al.ArtistId= a.ArtistId 
and i.InvoiceId = il.InvoiceId
GROUP BY a.Name
ORDER BY TotalSales DESC
LIMIT 3;

--27
SELECT mt.Name, COUNT(i.Total) as "TotalSales"
FROM Artist a, Invoice i, InvoiceLine il, Track t, Album al, MediaType mt
WHERE il.TrackId = t.TrackId 
and t.AlbumId = al.AlbumId 
and al.ArtistId= a.ArtistId 
and i.InvoiceId = il.InvoiceId
and t.MediaTypeId = mt.MediaTypeId
GROUP BY mt.Name
ORDER BY TotalSales DESC
LIMIT 1;


