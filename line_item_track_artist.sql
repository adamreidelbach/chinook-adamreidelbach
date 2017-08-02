SELECT il.TrackId, t.Name "Track Name", a.Name "Artist Name"
FROM InvoiceLine il, Track t, Artist a, Album al
WHERE il.TrackId = t.TrackId and a.ArtistId = al.ArtistId and t.AlbumId = al.AlbumId;