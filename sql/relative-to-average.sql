-- Besitz von Diamanten im Verhältnis zur Durchschnitt
select lastname || ', ' || firstname as name, city, diamonds, avg(diamonds) over c, max(diamonds) over c
from human
window c as (partition by city)
order by name