SELECT  RE,
		MAX(CASE WHEN char_descr = 'ARLINGTON RIVER' THEN char_descr
			 WHEN char_descr LIKE '%Avondale%' THEN 'AVONDALE HISTORIC DISTRICT'
			 WHEN char_descr = 'BIG POTTSBURG CREEK' THEN char_descr
			 WHEN char_descr = 'BROWARD RIVER' THEN char_descr
			 WHEN char_descr = 'Browns Dump' THEN UPPER(char_descr)
			 WHEN char_descr = 'BROWARD RIVER' THEN char_descr
			 WHEN char_descr = 'CEDAR CREEK' THEN char_descr
			 WHEN char_descr LIKE 'DUNN%' THEN char_descr
			 WHEN char_descr = 'DURBIN CREEK' THEN char_descr
			 WHEN char_descr = 'Fifth and Cleveland' THEN UPPER(char_descr)
			 WHEN char_descr = 'JULINGTON CREEK' THEN char_descr
			 WHEN char_descr LIKE 'LEM TURNER%' THEN char_descr
			 WHEN char_descr = 'MONCRIEF CREEK' THEN char_descr
			 WHEN char_descr = 'NEWROSE CREEK' THEN char_descr
			 WHEN char_descr LIKE '%Ortega%' THEN 'ORTEGA HISTORIC DISTRICT'
			 WHEN char_descr = 'SILVERSMITH CREEK' THEN char_descr
			 WHEN char_descr LIKE '%Springfield%' THEN 'SPRINGFIELD HISTORIC DISTRICT'
			 ELSE NULL END) AS 'char_descr',
		MAX(CASE WHEN char_descr = 'CANAL' THEN 1
			 ELSE NULL END) AS canal,
		MAX(CASE WHEN char_descr = 'GOLF COURSE' THEN 1
			 ELSE NULL END) AS golf,
		MAX(CASE WHEN char_descr = 'INTRACOASTAL WATERWAY' THEN 1
			 ELSE NULL END) AS intracoastal,
		MAX(CASE WHEN char_descr = 'LAKE' THEN 1
			 ELSE NULL END) AS lake,
		MAX(CASE WHEN char_descr = 'MISCELLANEOUS WATERWAY' THEN 1
			 ELSE NULL END) AS misc_waterway,
		MAX(CASE WHEN char_descr = 'OCEAN FRONT' THEN 1
			 ELSE NULL END) AS ocean_front,
		MAX(CASE WHEN char_descr = 'ORTEGA RIVER' THEN 1
			 ELSE NULL END) AS ortega_river,
		MAX(CASE WHEN char_descr = 'RIBAULT RIVER' THEN 1
			 ELSE NULL END) AS ribault_river,
		MAX(CASE WHEN char_descr = 'ST JOHNS RIVER' THEN 1
			 ELSE NULL END) AS stjohns_river,
		MAX(CASE WHEN char_descr = 'TROUT RIVER' THEN 1
			 ELSE NULL END) AS trout_river
FROM
(SELECT RE
FROM Parcel
WHERE property_use = 100)
LEFT JOIN Characteristic
USING (RE)
GROUP BY RE



