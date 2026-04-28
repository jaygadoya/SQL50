# Write your MySQL query statement below
SELECT id
FROM (
    SELECT id,
           temperature,
           recordDate,
           LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
           LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
    FROM Weather
) temp_table
WHERE temperature > prev_temp
      and datediff(recordDate,prev_date) = 1;
