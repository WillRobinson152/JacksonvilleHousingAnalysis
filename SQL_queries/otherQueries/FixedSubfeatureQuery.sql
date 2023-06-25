SELECT  RE,
		IFNULL(building,0) AS building,
		SUM(CASE WHEN sub_structure_descr = 'Addition' THEN 1
			ELSE NULL END) AS additions,
		SUM(CASE WHEN sub_structure_descr = 'Addition' THEN effec_area
			ELSE NULL END) AS additions_effec_area,
		SUM(CASE WHEN sub_structure_descr = 'Balcony' THEN effec_area
			ELSE NULL END) AS balcony_effec_area,
		SUM(CASE WHEN sub_structure_descr LIKE '%Garage%' THEN effec_area
			ELSE NULL END) AS garage_effec_area,
		SUM(CASE WHEN sub_structure_descr = 'Finished Storage' THEN effec_area
			ELSE NULL END) AS fin_storage_effec_area,
		SUM(CASE WHEN sub_structure_descr = 'Unfinished Storage' THEN effec_area
			ELSE NULL END) AS unfin_storage_effec_area
FROM
(SELECT RE
FROM Parcel
WHERE property_use = 100)
LEFT JOIN Subarea
USING (RE)
GROUP BY RE, building