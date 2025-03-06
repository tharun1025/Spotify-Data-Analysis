-- EDA

SELECT count(*)
FROM spotify_db.spotify;

SELECT count(distinct artist)
FROM spotify_db.spotify;

SELECT count(distinct album)
FROM spotify_db.spotify;

SELECT distinct album_type
FROM spotify_db.spotify;

select max(duration_min)
from spotify;

select min(duration_min)
from spotify;

select *
from spotify
where duration_min =0;

delete from spotify
where duration_min = 0;

SELECT distinct channel
FROM spotify_db.spotify;

select distinct most_played_on
from spotify;













