-- Data Analysis - Easy category problem

-- Q1. Retrieve the names of all tracks that have more than 1 billion streams

select *
from spotify
where stream > 1000000000;

-- Q2 List all albums along with their respective artists

select distinct album, artist
from spotify;

-- Q3 Get the total number of comments for tracks where licensed = TRUE

select sum(comments) as total_comments
from spotify
where licensed = 1;

-- Q4 Find all tracks that belong to the album type single

select *
from spotify
where album_type = 'single';

-- Count the total number of tracks by each artist

select artist, count(*) as total_no_songs 
from spotify
group by artist;