SELECT RE, building, type_descr, class, quality, actual_yr_built, effec_yr_built, value AS bldng_value, value/heated_sf AS vpsf, heated_sf
FROM building	
WHERE (type_descr LIKE 'SFR%')
