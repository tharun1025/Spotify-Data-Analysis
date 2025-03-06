-- Advanced Level porblem


select *
from spotify;

-- Q1. Find the top 3 most-viewed tracks for each artist using window functions 

-- each artist and total view for each artist
-- track with highest view for each artist (top 3_)
-- dense rank
-- cte and filter rank < 3

with ranking_artist 
as
(select
	artist,
    track,
    sum(views) as total_views,
    dense_rank() over(partition by artist order by sum(views) desc) as top_rank 
from spotify
group by 1, 2
order by 1, 3 desc
)
select *
from ranking_artist
where top_rank <= 3;

-- Q2. Write a query to find tracks where the liveness score is above the average.

select track, artist, liveness
from spotify
where liveness > (select avg(liveness)
from spotify);

-- Q3. Use a WITH clause to calculate the difference between the highest and 
--     lowest energy values for tracks in each album

with cte
as
(select 
	album, 
    max(energy) as highest_energy,
    min(energy) as lowest_energy
from spotify
group by 1
)
select 
	album,
    highest_energy - lowest_energy as energy_diff
from cte
order by 2 desc;


















    



















