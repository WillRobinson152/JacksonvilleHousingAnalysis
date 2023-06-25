SELECT  RE,
		IFNULL(building,0) AS building,
		MAX(CASE WHEN descr LIKE 'Boat%' THEN units
			ELSE NULL END) AS boat_cv,
		MAX(CASE WHEN descr LIKE 'Boat%' THEN ppu
			ELSE NULL END) AS boatcv_ppu,
		MAX(CASE WHEN descr LIKE 'Boat%' THEN actual_yr_built
			ELSE NULL END) AS boatcv_yr,
		MAX(CASE WHEN descr LIKE 'Carport%' THEN units
			ELSE NULL END) AS carport,
		MAX(CASE WHEN descr LIKE 'Carport%' THEN ppu
			ELSE NULL END) AS carport_ppu,
		MAX(CASE WHEN descr LIKE 'Carport%' THEN actual_yr_built
			ELSE NULL END) AS carport_yr,
		MAX(CASE WHEN descr = 'Cov Patio' THEN units
			ELSE NULL END) AS cov_patio,
		MAX(CASE WHEN descr = 'Cov Patio' THEN ppu
			ELSE NULL END) AS covpatio_ppu,
		MAX(CASE WHEN descr = 'Cov Patio' THEN actual_yr_built
			ELSE NULL END) AS covpatio_yr,
		MAX(CASE WHEN descr = 'Deck Wd' THEN units
			ELSE NULL END) AS deck,
		MAX(CASE WHEN descr = 'Deck Wd' THEN ppu
			ELSE NULL END) AS deck_ppu,
		MAX(CASE WHEN descr = 'Deck Wd' THEN actual_yr_built
			ELSE NULL END) AS deck_yr,
		MAX(CASE WHEN descr LIKE 'Dock%' THEN units
			ELSE NULL END) AS dock,
		MAX(CASE WHEN descr LIKE 'Dock%' THEN ppu
			ELSE NULL END) AS dock_ppu,
		MAX(CASE WHEN descr LIKE 'Dock%' THEN actual_yr_built
			ELSE NULL END) AS dock_yr,
		MAX(CASE WHEN descr LIKE 'Firep%' THEN units
			ELSE NULL END) AS fireplace,
		MAX(CASE WHEN descr LIKE 'Firep%' THEN ppu
			ELSE NULL END) AS fireplace_ppu,
		MAX(CASE WHEN descr LIKE 'Firep%' THEN actual_yr_built
			ELSE NULL END) AS fireplace_yr,
		MAX(CASE WHEN descr = 'Pool' THEN units
			ELSE NULL END) AS pool,
		MAX(CASE WHEN descr = 'Pool' THEN ppu
			ELSE NULL END) AS pool_ppu,
		MAX(CASE WHEN descr = 'Pool' THEN actual_yr_built
			ELSE NULL END) AS pool_yr,
		MAX(CASE WHEN descr = 'Scr Porch' THEN units
			ELSE NULL END) AS scr_porch,
		MAX(CASE WHEN descr = 'Scr Porch' THEN ppu
			ELSE NULL END) AS scrporch_ppu,
		MAX(CASE WHEN descr = 'Scr Porch' THEN actual_yr_built
			ELSE NULL END) AS scrporch_yr,
		MAX(CASE WHEN descr LIKE 'Screen%' THEN units
			ELSE NULL END) AS screen_encl,
		MAX(CASE WHEN descr LIKE 'Screen%' THEN ppu
			ELSE NULL END) AS screenencl_ppu,
		MAX(CASE WHEN descr LIKE 'Screen%' THEN actual_yr_built
			ELSE NULL END) AS screenencl_yr,
		MAX(CASE WHEN descr LIKE 'Shed%' THEN units
			ELSE NULL END) AS shed,
		MAX(CASE WHEN descr LIKE 'Shed%' THEN ppu
			ELSE NULL END) AS shed_ppu,
		MAX(CASE WHEN descr LIKE 'Shed%' THEN actual_yr_built
			ELSE NULL END) AS shed_yr,
		MAX(CASE WHEN descr = 'Sun Room' THEN units
			ELSE NULL END) AS sun_rm,
		MAX(CASE WHEN descr = 'Sun Room' THEN ppu
			ELSE NULL END) AS sunrm_ppu,
		MAX(CASE WHEN descr = 'Sun Room' THEN actual_yr_built
			ELSE NULL END) AS sunrm_yr
FROM
(SELECT RE
FROM Parcel
WHERE property_use = 100)
LEFT JOIN Feature
USING (RE)
GROUP BY RE, building