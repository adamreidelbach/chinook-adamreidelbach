SELECT t.Name "Track Name",  al.Title "Album Name", mt.Name "Media Type", g.Name "Genre"
FROM Track t, Album al, MediaType mt, Genre g
WHERE t.AlbumId = al.AlbumId and t.MediaTypeId = mt.MediaTypeId and g.GenreId = t.GenreId
GROUP BY t.Name;