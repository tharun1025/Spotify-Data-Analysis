-- Data Analysis - medium category problem

select *
from spotify;
-- Q1. Calculate the average danceability of tracks in each album

select album, avg(danceability)
from spotify
group by 1
order by 2 desc;

-- Q2. Find the top 5 tracks with the highest energy values

select track as Top_five_tracks, max(energy)
from spotify
group by 1
order by 2 desc
limit 5;

-- Q3. List all tracks along with their views and likes where official_video = TRUE.

select track, 
sum(views)as total_views,
sum(likes) as total_likes
from spotify
where official_video = 1
group by 1;

-- Q4.For each album, calculate the total views of all associated tracks.

select 	album ,
		track, 
		sum(views) as total_views
from spotify
group by 1, 2
order by 3 desc;

-- Q5. Retrieve the track names that have been streamed on Spotify more than YouTube

select * from 
(select 
	track,
    coalesce(sum(case when most_played_on ='Youtube' then streamed end),0) as streamed_on_youtube,
    coalesce(sum(case when most_played_on ='Spotify' then streamed end),0) as streamed_on_spotify
from spotify
group by track
) as t1
where streamed_on_spotify > streamed_on_youtube
and 
streamed_on_youtube != 0;