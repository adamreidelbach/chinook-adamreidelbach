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