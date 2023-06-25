SELECT trans_id, SUM(val_est) AS val_ests, SUM(price_est) AS price_ests, trans_value, price_value, price, parcel_count, lots, COUNT(*) AS bldngs
FROM
(

SELECT  RE, building, type_descr, class, quality, actual_yr_built, effec_yr_built, bldng_value, vpsf, heated_sf, 
		mailing_address, mailing_city, mailing_state, property_use, subdivision, neighborhood, perc_capped, val_method, cap_base_yr,
		assessed_val, just_val, school_taxable, county_taxable, sjrwnd_taxable, taxing_district, lot_size, acres,
		exem_types, exempted, bedrooms, baths, rooms, stories,
		trans_id,
		qualification, instr_descr, deed_descr, sale_date, seller, price,
		price_value, trans_value, 
		val_est, lots, parcel_count,
		price_est
FROM
	(
	SELECT  RE, 
			building, type_descr, class, quality, actual_yr_built, effec_yr_built, bldng_value, vpsf, heated_sf, 
			mailing_address, mailing_city, mailing_state, property_use, subdivision, neighborhood, perc_capped, val_method, cap_base_yr, 
			assessed_val, just_val, school_taxable, county_taxable, sjrwnd_taxable, taxing_district, lot_size, acres,
			COUNT(DISTINCT(exem_code)) AS exem_types, SUM(exempted) AS exempted,
			bedrooms, baths, rooms, stories
	FROM
		(
		SELECT  RE, 
				building, type_descr, class, quality, actual_yr_built, effec_yr_built, bldng_value, vpsf, heated_sf, 
				mailing_address, mailing_city, mailing_state, property_use, subdivision, neighborhood, perc_capped, val_method, cap_base_yr, 
				assessed_val, just_val, school_taxable, county_taxable, sjrwnd_taxable, taxing_district, lot_size, acres,
				exem_code, exem_perc, exem_perc * exem_amount * override AS exempted
		FROM
			(
			SELECT  RE, 
					building.building, type_descr, class, quality, actual_yr_built, effec_yr_built, value AS bldng_value, value/heated_sf AS vpsf, heated_sf,
					CASE WHEN mailing_2 NOT NULL THEN (mailing_1||' '||mailing_2)
						ELSE mailing_1 END AS mailing_address,
					mailing_city, mailing_state, property_use, subdivision, neighborhood, perc_capped, val_method, cap_base_yr,
					assessed_val, just_val, school_taxable, county_taxable, sjrwnd_taxable, taxing_district, square_feet AS lot_size, acres
			FROM building	
			LEFT JOIN Parcel 
			USING (RE)
			WHERE (type_descr LIKE 'SFR%') AND property_use = 100
			)
		LEFT JOIN Exemption
		USING (RE)
		) AS sub1
	LEFT JOIN 
		(
		SELECT  RE, building, SUM(baths) AS baths, SUM(bedrooms) AS bedrooms, SUM(stories) AS stories, SUM(rooms) AS rooms
		FROM 
			(
			SELECT	RE,
					building,
					CASE WHEN structure_descr = 'Baths' THEN unit_count
						ELSE 0 END AS baths,
					CASE WHEN structure_descr = 'Bedrooms' THEN unit_count
						ELSE 0 END AS bedrooms,
					CASE WHEN structure_descr = 'Stories' THEN unit_count
						ELSE 0 END AS stories,
					CASE WHEN structure_descr = 'Rooms / Units' THEN unit_count
						ELSE 0 END AS rooms
			FROM Utility
			) 
		GROUP BY RE, building
		) AS sub2
	USING (RE, building)
	GROUP BY RE, building
	)
	LEFT JOIN
	(
	SELECT
		RE, building, trans_id, qualification, instr_descr, deed_descr, (year||'-'||month||'-'||day) AS sale_date, seller, price,
		CAST(price AS FLOAT)/CAST(trans_value AS FLOAT) AS price_value, trans_value, this.just_val
		val_est, lots, parcel_count,
		ROUND(CAST(price AS FLOAT)/CAST(trans_value AS FLOAT) * val_est,0) AS price_est
	FROM
		(
		SELECT  RE, 
				CASE WHEN building IS NULL THEN 0
					ELSE building END AS building, 
				(or_book||'_'||or_page) AS trans_id, qualification, instr_descr, deed_descr,
				CASE WHEN substr(sale_date,2,1) = '/' THEN ('0'||substr(sale_date,1,1))
					ELSE substr(sale_date,1,2) END AS month,
				CASE WHEN (substr(sale_date,2,1) = '/' AND substr(sale_date,4,1) = '/') THEN ('0'||substr(sale_date,3,1))
					WHEN (substr(sale_date,3,1) = '/' AND substr(sale_date,5,1) = '/') THEN ('0'||substr(sale_date,4,1))
					WHEN (substr(sale_date,3,1) = '/' AND substr(sale_date,6,1) = '/') THEN substr(sale_date,4,2)
					ELSE substr(sale_date,3,2) END AS day,
				substr(sale_date,-4,4) AS year,
				price,
				seller,
				just_val
		FROM Sale
		LEFT JOIN Building
		USING (RE)
		LEFT JOIN Parcel
		USING (RE)
		WHERE price > 10000
		) AS this
	LEFT JOIN 
		(
		SELECT  RE, building,
				ROUND((heated_sf * pphsf) + CAST(land_value AS FLOAT)/CAST(lots AS FLOAT),0) AS val_est,
				just_val, 
				lots
		FROM
		(
		SELECT  RE, square_feet, building, heated_sf, total_bldng_val, 
				just_val - total_bldng_val AS land_value,
				CASE WHEN total_heated_sf > 0 THEN CAST(total_bldng_val AS FLOAT)/CAST(total_heated_sf AS FLOAT) 
					ELSE 0 END AS pphsf, 
				lots,
				CAST(square_feet - total_heated_sf AS FLOAT)/CAST(lots AS FLOAT) AS land_sf,
				just_val
				
		FROM
		(
		SELECT  RE, square_feet, just_val,
				CASE WHEN building IS NULL THEN 0
					ELSE building END AS building,
				CASE WHEN heated_sf IS NULL THEN 0
					ELSE heated_sf END AS heated_sf,
				total_bldng_val,
				total_heated_sf,
				lots
		FROM Parcel
		LEFT JOIN building
		USING(RE)
		LEFT JOIN 
			(
			SELECT  RE, 
					CASE WHEN SUM(heated_sf) IS NULL THEN 0
						ELSE SUM(heated_sf) END AS total_heated_sf,
					CASE WHEN MAX(value) NOT NULL THEN MAX(value)
						ELSE 0 END AS total_bldng_val
			FROM Parcel
			LEFT JOIN Building
			USING (RE)
			GROUP BY RE
			)
		USING (RE)
		LEFT JOIN
			(
			SELECT RE, COUNT(*) AS lots
			FROM Parcel
			LEFT JOIN building
			USING (RE)
			GROUP BY RE
			)
		USING (RE)
		)
		)
		)
	USING (RE, building)
	LEFT JOIN 
		(
		SELECT trans_id, COUNT(*) AS parcel_count, SUM(DISTINCT(just_val)) AS trans_value
		FROM
			(
			SELECT RE, (or_book||'_'||or_page) AS trans_id, just_val, value
			FROM Sale
			LEFT JOIN Parcel
			USING (RE)
			LEFT JOIN building
			USING (RE)
			)
		GROUP BY trans_id
		)
	USING (trans_id)
	) AS sales_query
	USING (RE, building)
WHERE price > 6000000

)
GROUP BY trans_id