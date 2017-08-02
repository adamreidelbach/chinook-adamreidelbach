SELECT pl.Name "Playlist Name", COUNT(plt.TrackId)
FROM Playlist pl, PlaylistTrack plt, Track t
WHERE pl.PlaylistId = plt.PlaylistId and plt.TrackId = t.TrackId
GROUP BY pl.Name;