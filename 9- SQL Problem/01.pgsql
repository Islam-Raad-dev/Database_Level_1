-- Create Master View 

CREATE OR REPLACE VIEW public."VehicleMasterDetails" AS
SELECT 
    vd."ID" AS "VehicleDetailID", 
    vd."MakeID", 
    m."Make", 
    vd."ModelID", 
    mm."ModelName", 
    vd."SubModelID", 
    sm."SubModelName", 
    vd."BodyID", 
    b."bodyname", 
    vd."Vehicle_Display_Name", 
    vd."Year", 
    vd."DriveTypeID", 
    dt."DriveTypeName", 
    vd."Engine", 
    vd."Engine_CC", 
    vd."Engine_Cylinders", 
    vd."Engine_Liter_Display", 
    vd."FuelTypeID", 
    ft."FuelTypeName", 
    vd."NumDoors"
FROM 
    vehicledetails vd
INNER JOIN public.makes m 
    ON vd."MakeID" = m."MakeID"
INNER JOIN public.makemodels mm 
    ON m."MakeID" = mm."MakeID"
INNER JOIN public.submodels sm 
    ON mm."ModelID" = sm."ModelID"
INNER JOIN public.bodies b 
    ON vd."BodyID" = b.bodyID
INNER JOIN public.driveTypes dt 
    ON vd."DriveTypeID" = dt."DriveTypeID"
INNER JOIN public.fuelTypes ft 
    ON vd."FuelTypeID" = ft."FuelTypeID";
