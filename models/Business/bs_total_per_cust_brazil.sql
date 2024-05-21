-- which customer has spent the most money / how many orders has he made / current balance --> in brazil

select * from {{ ref('bs_total_per_cust') }}
where nation = 'BRAZIL'
order by ranking asc