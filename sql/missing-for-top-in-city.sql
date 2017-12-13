-- Wie viele brauch ich für Platz 1?
select lastname || ', ' || firstname as name, city, diamonds, 
row_number()  over (partition by city order by diamonds desc) as pos,

case first_value(diamonds) over c - diamonds
  WHEN 0 THEN 0
  ELSE first_value(diamonds) over c - diamonds + 1
end as neede

from human
window c as (partition by city order by diamonds desc)
