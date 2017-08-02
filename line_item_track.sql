SELECT il.InvoiceId, il.TrackId, t.Name "Track Name"
FROM InvoiceLine il, Track t
WHERE il.TrackId = t.TrackId;