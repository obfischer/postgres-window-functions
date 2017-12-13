-- Besitz im Vergleich zum direkten Vorgänger und Nachfolger
select
lastname, city, diamonds, 
lead(diamonds, 1) over c as predecessor,
lag(diamonds, 1) over c as successor
from
human
window c as (partition by city order by diamonds)
order by city, diamonds desc
