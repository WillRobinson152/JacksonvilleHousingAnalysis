SELECT  section, township, range,
		CASE WHEN mailing_2 NOT NULL THEN (mailing_1||' '||mailing_2)
			ELSE mailing_1 END AS mailing_address,
		mailing_city, mailing_state, property_use, subdivision, neighborhood, perc_capped, val_method, cap_base_yr,
		assessed_val, just_val, school_taxable, county_taxable, sjrwnd_taxable, taxing_district, square_feet AS lot_size, acres
FROM
	(
	SELECT RE, building, type_descr, class, quality, actual_yr_built, effec_yr_built, value AS bldng_value, value/heated_sf AS vpsf, heated_sf
	FROM building	
	WHERE (type_descr LIKE 'SFR%')
	)
LEFT JOIN Parcel
USING (RE)
