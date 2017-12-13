-- Wie viele Diamanten gibt es in jeder Stadt?
select city, sum(diamonds) as diamonds_in_city
from human
group by city