-- Get all vehicles made between 1950 and 2000

SELECT * FROM VEHICLEDETAILS V 
WHERE V."Year" BETWEEN 1950 AND 2000
ORDER BY "ID" 
