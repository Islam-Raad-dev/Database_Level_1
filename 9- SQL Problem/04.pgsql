-- Get the number of vehicles made between 1950 and 2000 per make and order them by the number of vehicles in descending order

SELECT 
    m."Make", 
    COUNT(*) AS "NumberOfVehicles"
FROM 
    VEHICLEDETAILS  vd
INNER JOIN MAKES m 
    ON vd."MakeID" = m."MakeID"
WHERE 
    vd."Year" BETWEEN 1950 AND 2000
GROUP BY 
    m."Make"
ORDER BY 
    "NumberOfVehicles" DESC;
