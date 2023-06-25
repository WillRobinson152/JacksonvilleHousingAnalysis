SELECT  RE,
		MAX(CASE WHEN use_descr LIKE '%1 UNIT PER 100 A%' THEN 0.01
			 WHEN use_descr LIKE '%1 UNIT PER 40 A%' THEN 0.025
			 WHEN use_descr LIKE '%1 UNIT PER 10 A%' THEN 0.1
			 WHEN use_descr LIKE '%1 UNIT PER 2.5 A%' THEN 0.4
			 WHEN use_descr LIKE '%8-19 UNITS PER A%' THEN 19
			 WHEN use_descr LIKE '%3-7 UNITS PER A%' THEN 7
			 WHEN use_descr LIKE '%2 OR LESS%' THEN 2
			 WHEN use_descr LIKE '%20-60 UNITS PER A%' THEN 60
			 ELSE NULL END) AS max_units_per_acre,
		MAX(CASE WHEN use_descr LIKE '%CANAL%' THEN 1
			 ELSE NULL END) AS use_canal,
		MAX(CASE WHEN use_descr LIKE '%GOLF%' THEN 1
			 ELSE NULL END) AS use_golf,
		MAX(CASE WHEN use_descr LIKE '%MARSH%' THEN 1
			 ELSE NULL END) AS use_marsh,
		MAX(CASE WHEN use_descr LIKE '%OCEAN%' THEN 1
			 ELSE NULL END) AS use_ocean,
		MAX(CASE WHEN use_descr LIKE '%POND%' THEN 1
			 ELSE NULL END) AS use_marsh,
		MAX(CASE WHEN use_descr LIKE '%RIVER%' THEN 1
			 ELSE NULL END) AS use_river,
		SUM(land_val) AS land_val,
		COUNT(use_descr) AS use_types
FROM 
(SELECT RE
FROM Parcel
WHERE property_use = 100)
LEFT JOIN Common
USING (RE)
GROUP BY RE		