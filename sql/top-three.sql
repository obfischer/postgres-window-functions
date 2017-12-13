-- Die drei Besitzer pro Stadt mit den meisten Diamanten
select * from (
        select lastname || ', ' || firstname as name, city, diamonds, 
        row_number()  over (partition by city order by diamonds desc) as rn
        from human) as sq
where rn <= 3
