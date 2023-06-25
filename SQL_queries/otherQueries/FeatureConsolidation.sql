SELECT  RE,
		building,
		SUM(bkhd) AS bkhd, SUM(bkhd_units) AS bkhd_units, SUM(bkhd_ppu) AS bkhd_ppu, MAX(bkhd_yr_built) AS bkhd_yr_built,
		SUM(boatcv) AS boatcv, SUM(boatcv_units) AS boatcv_units, SUM(boatcv_ppu) AS boatcv_ppu, MAX(boatcv_yr_built) AS boatcv_yr_built,
		SUM(candet) AS candet, SUM(candet_units) AS candet_units, SUM(candet_ppu) AS candet_ppu, MAX(candet_yr_built) AS candet_yr_built,
		SUM(carport) AS carport, SUM(carport_units) AS carport_units, SUM(carport_ppu) AS carport_ppu, MAX(carport_yr_built) AS carport_yr_built,
		SUM(covpatio) AS covpatio, SUM(covpatio_units) AS covpatio_units, SUM(covpatio_ppu) AS covpatio_ppu, MAX(covpatio_yr_built) AS covpatio_yr_built,
		SUM(deck) AS deck, SUM(deck_units) AS deck_units, SUM(deck_ppu) AS deck_ppu, MAX(deck_yr_built) AS deck_yr_built,
		SUM(dock) AS dock, SUM(dock_units) AS dock_units, SUM(dock_ppu) AS dock_ppu, MAX(dock_yr_built) AS dock_yr_built,
		SUM(elevstp) AS elevstp, SUM(elevstp_units) AS elevstp_units, SUM(elevstp_ppu) AS elevstp_ppu, MAX(elevstp_yr_built) AS elevstp_yr_built,
		SUM(elevator) AS elevator, SUM(elevator_units) AS elevator_units, SUM(elevator_ppu) AS elevator_ppu, MAX(elevator_yr_built) AS elevator_yr_built,
		SUM(fence) AS fence, SUM(fence_units) AS fence_units, SUM(fence_ppu) AS fence_ppu, MAX(fence_yr_built) AS fence_yr_built,
		SUM(fireplace) AS fireplace, SUM(fireplace_units) AS fireplace_units, SUM(fireplace_ppu) AS fireplace_ppu, MAX(fireplace_yr_built) AS fireplace_yr_built,
		SUM(lightfix) AS lightfix, SUM(lightfix_units) AS lightfix_units, SUM(lightfix_ppu) AS lightfix_ppu, MAX(lightfix_yr_built) AS lightfix_yr_built,
		SUM(ltpole) AS ltpole, SUM(ltpole_units) AS ltpole_units, SUM(ltpole_ppu) AS ltpole_ppu, MAX(ltpole_yr_built) AS ltpole_yr_built,
		SUM(mezz) AS mezz, SUM(mezz_units) AS mezz_units, SUM(mezz_ppu) AS mezz_ppu, MAX(mezz_yr_built) AS mezz_yr_built,
		SUM(pave) AS pave, SUM(pave_units) AS pave_units, SUM(pave_ppu) AS pave_ppu, MAX(pave_yr_built) AS pave_yr_built,
		SUM(pool) AS pool, SUM(pool_units) AS pool_units, SUM(pool_ppu) AS pool_ppu, MAX(pool_yr_built) AS pool_yr_built,
		SUM(scrporch) AS scrporch, SUM(scrporch_units) AS scrporch_units, SUM(scrporch_ppu) AS scrporch_ppu, MAX(scrporch_yr_built) AS scrporch_yr_built,
		SUM(screncl) AS screncl, SUM(screncl_units) AS screncl_units, SUM(screncl_ppu) AS screncl_ppu, MAX(screncl_yr_built) AS screncl_yr_built,
		SUM(shed) AS shed, SUM(shed_units) AS shed_units, SUM(shed_ppu) AS shed_ppu, MAX(shed_yr_built) AS shed_yr_built
FROM
(SELECT 
	RE,
	building,
	CASE WHEN descr LIKE 'Bkhd%' THEN 1
		ELSE NULL END AS bkhd,
	CASE WHEN descr LIKE 'Bkhd%' THEN units
		ELSE NULL END AS bkhd_units,
	CASE WHEN descr LIKE 'Bkhd%' THEN ppu
		ELSE NULL END AS bkhd_ppu,
	CASE WHEN descr LIKE 'Bkhd%' THEN actual_yr_built
		ELSE NULL END AS bkhd_yr_built,
	CASE WHEN descr LIKE 'Bkhd%' THEN deprec_val
		ELSE NULL END AS bkhd_deprec_val,
	CASE WHEN descr LIKE 'Boat Cv' THEN 1
		ELSE NULL END AS boatcv,
	CASE WHEN descr LIKE 'Boat Cv' THEN units
		ELSE NULL END AS boatcv_units,
	CASE WHEN descr LIKE 'Boat Cv' THEN ppu
		ELSE NULL END AS boatcv_ppu,
	CASE WHEN descr LIKE 'Boat Cv' THEN actual_yr_built
		ELSE NULL END AS boatcv_yr_built,
	CASE WHEN descr LIKE 'Boat Cv' THEN deprec_val
		ELSE NULL END AS boatcv_deprec_val,
	CASE WHEN descr LIKE 'Can Det%' THEN 1
		ELSE NULL END AS candet,
	CASE WHEN descr LIKE 'Can Det%' THEN units
		ELSE NULL END AS candet_units,
	CASE WHEN descr LIKE 'Can Det%' THEN ppu
		ELSE NULL END AS candet_ppu,
	CASE WHEN descr LIKE 'Can Det%' THEN actual_yr_built
		ELSE NULL END AS candet_yr_built,
	CASE WHEN descr LIKE 'Can Det%' THEN deprec_val
		ELSE NULL END AS candet_deprec_val,
	CASE WHEN descr LIKE 'Carport%' THEN 1
		ELSE NULL END AS carport,
	CASE WHEN descr LIKE 'Carport%' THEN units
		ELSE NULL END AS carport_units,
	CASE WHEN descr LIKE 'Carport%' THEN ppu
		ELSE NULL END AS carport_ppu,
	CASE WHEN descr LIKE 'Carport%' THEN actual_yr_built
		ELSE NULL END AS carport_yr_built,
	CASE WHEN descr LIKE 'Carport%' THEN deprec_val
		ELSE NULL END AS carport_deprec_val,
	CASE WHEN descr LIKE 'Cov Pa%' THEN 1
		ELSE NULL END AS covpatio,
	CASE WHEN descr LIKE 'Cov Pat%' THEN units
		ELSE NULL END AS covpatio_units,
	CASE WHEN descr LIKE 'Cov Pat%' THEN ppu
		ELSE NULL END AS covpatio_ppu,
	CASE WHEN descr LIKE 'Cov Pat%' THEN actual_yr_built
		ELSE NULL END AS covpatio_yr_built,
	CASE WHEN descr LIKE 'Cov Pat%' THEN deprec_val
		ELSE NULL END AS covpatio_deprec_val,
	CASE WHEN descr = 'Deck Wd' THEN 1
		ELSE NULL END AS deck,
	CASE WHEN descr = 'Deck Wd' THEN units
		ELSE NULL END AS deck_units,
	CASE WHEN descr = 'Deck Wd' THEN ppu
		ELSE NULL END AS deck_ppu,
	CASE WHEN descr = 'Deck Wd' THEN actual_yr_built
		ELSE NULL END AS deck_yr_built,
	CASE WHEN descr = 'Deck Wd' THEN deprec_val
		ELSE NULL END AS deck_deprec_val,
	CASE WHEN descr LIKE 'Dock%' THEN 1
		ELSE NULL END AS dock,
	CASE WHEN descr LIKE 'Dock%' THEN units
		ELSE NULL END AS dock_units,
	CASE WHEN descr LIKE 'Dock%' THEN ppu
		ELSE NULL END AS dock_ppu,
	CASE WHEN descr LIKE 'Dock%' THEN actual_yr_built
		ELSE NULl END AS dock_yr_built,
	CASE WHEN descr LIKE 'Dock%' THEN deprec_val
		ELSE NULL END AS dock_deprec_val,
	CASE WHEN descr LIKE 'Elev Stp%' THEN 1
		ELSE NULL END AS elevstp,
	CASE WHEN descr LIKE 'Elev Stp%' THEN units
		ELSE NULL END AS elevstp_units,
	CASE WHEN descr LIKE 'Elev Stp%' THEN ppu
		ELSE NULL END AS elevstp_ppu,
	CASE WHEN descr LIKE 'Elev Stp%' THEN actual_yr_built
		ELSE NULL END AS elevstp_yr_built,
	CASE WHEN descr LIKE 'Elev Stp%' THEN deprec_val
		ELSE NULL END AS elevstp_deprec_val,
	CASE WHEN descr LIKE 'Elevator%' THEN 1
		ELSE NULL END AS elevator,
	CASE WHEN descr LIKE 'Elevator%' THEN units
		ELSE NULL END AS elevator_units,
	CASE WHEN descr LIKE 'Elevator%' THEN ppu
		ELSE NULL END AS elevator_ppu,
	CASE WHEN descr LIKE 'Elevator%' THEN actual_yr_built
		ELSE NULL END AS elevator_yr_built,
	CASE WHEN descr LIKE 'Elevator%' THEN deprec_val
		ELSE NULL END AS elevator_deprec_val,
	CASE WHEN descr LIKE 'Fence%' THEN 1
		ELSE NULL END AS fence,
	CASE WHEN descr LIKE 'Fence%' THEN units
		ELSE NULL END AS fence_units,
	CASE WHEN descr LIKE 'Fence%' THEN ppu
		ELSE NULL END AS fence_ppu,
	CASE WHEN descr LIKE 'Fence%' THEN actual_yr_built
		ELSE NULL END AS fence_yr_built,
	CASE WHEN descr LIKE 'Fence%' THEN deprec_val
		ELSE NULL END AS fence_deprec_val,
	CASE WHEN descr LIKE 'Firep%' THEN 1
		ELSE NULL END AS fireplace,
	CASE WHEN descr LIKE 'Firep%' THEN units
		ELSE NULL END AS fireplace_units,
	CASE WHEN descr LIKE 'Firep%' THEN ppu
		ELSE NULL END AS fireplace_ppu,
	CASE WHEN descr LIKE 'Firep%' THEN actual_yr_built
		ELSE NULL END AS fireplace_yr_built,
	CASE WHEN descr LIKE 'Firep%' THEN deprec_val
		ELSE NULL END AS fireplace_deprec_val,
	CASE WHEN descr LIKE 'Light%' THEN 1
		ELSE NULL END AS lightfix,
	CASE WHEN descr LIKE 'Light%' THEN units
		ELSE NULL END AS lightfix_units,
	CASE WHEN descr LIKE 'Light%' THEN ppu
		ELSE NULL END AS lightfix_ppu,
	CASE WHEN descr LIKE 'Light%' THEN actual_yr_built
		ELSE NULL END AS lightfix_yr_built,
	CASE WHEN descr LIKE 'Light%' THEN deprec_val
		ELSE NULL END AS lightfix_deprec_val,
	CASE WHEN descr LIKE 'Lt Pole%' THEN 1
		ELSE NULL END AS ltpole,
	CASE WHEN descr LIKE 'Lt Pole%' THEN units
		ELSE NULL END AS ltpole_units,
	CASE WHEN descr LIKE 'Lt Pole%' THEN ppu
		ELSE NULL END AS ltpole_ppu,
	CASE WHEN descr LIKE 'Lt Pole%' THEN actual_yr_built
		ELSE NULL END AS ltpole_yr_built,
	CASE WHEN descr LIKE 'Lt Pole%' THEN deprec_val
		ELSE NULL END AS ltpole_deprec_val,
	CASE WHEN descr LIKE 'Mezz%' THEN 1
		ELSE NULL END AS mezz,
	CASE WHEN descr LIKE 'Mezz%' THEN units
		ELSE NULL END AS mezz_units,
	CASE WHEN descr LIKE 'Mezz%' THEN ppu
		ELSE NULL END AS mezz_ppu,
	CASE WHEN descr LIKE 'Mezz%' THEN actual_yr_built
		ELSE NULL END AS mezz_yr_built,
	CASE WHEN descr LIKE 'Mezz%' THEN deprec_val
		ELSE NULL END AS mezz_deprec_val,
	CASE WHEN descr LIKE 'Pav%' THEN 1
		ELSE NULL END AS pave,
	CASE WHEN descr LIKE 'Pav%' THEN units
		ELSE NULL END AS pave_units,
	CASE WHEN descr LIKE 'Pav%' THEN ppu
		ELSE NULL END AS pave_ppu,
	CASE WHEN descr LIKE 'Pav%' THEN actual_yr_built
		ELSE NULL END AS pave_yr_built,
	CASE WHEN descr LIKE 'Pav%' THEN deprec_val
		ELSE NULL END AS pave_deprec_val,
	CASE WHEN descr = 'Pool' THEN 1
		ELSE NULL END AS pool,
	CASE WHEN descr = 'Pool' THEN units
		ELSE NULL END AS pool_units,
	CASE WHEN descr = 'Pool' THEN ppu
		ELSE NULL END AS pool_ppu,
	CASE WHEN descr = 'Pool' THEN actual_yr_built
		ELSE NULL END AS pool_yr_built,
	CASE WHEN descr = 'Pool' THEN deprec_val
		ELSE NULL END AS pool_deprec_val,
	CASE WHEN descr LIKE 'Scr Po%' THEN 1
		ELSE NULL END AS scrporch,
	CASE WHEN descr LIKE 'Scr Po%' THEN units
		ELSE NULL END AS scrporch_units,
	CASE WHEN descr LIKE 'Scr Po%' THEN ppu
		ELSE NULL END AS scrporch_ppu,
	CASE WHEN descr LIKE 'Scr Po%' THEN actual_yr_built
		ELSE NULL END AS scrporch_yr_built,
	CASE WHEN descr LIKE 'Scr Po%' THEN deprec_val
		ELSE NULL END AS scrporch_deprec_val,
	CASE WHEN descr LIKE 'Screen%' THEN 1
		ELSE NULL END AS screncl,
	CASE WHEN descr LIKE 'Screen%' THEN units
		ELSE NULL END AS screncl_units,
	CASE WHEN descr LIKE 'Screen%' THEN ppu
		ELSE NULL END AS screncl_ppu,
	CASE WHEN descr LIKE 'Screen%' THEN actual_yr_built
		ELSE NULL END AS screncl_yr_built,
	CASE WHEN descr LIKE 'Screen%' THEN deprec_val
		ELSE NULL END AS screncl_deprec_val,
	CASE WHEN descr LIKE 'Shed%' THEN 1
		ELSE NULL END AS shed,
	CASE WHEN descr LIKE 'Shed%' THEN units
		ELSE NULL END AS shed_units,
	CASE WHEN descr LIKE 'Shed%' THEN ppu
		ELSE NULL END AS shed_ppu,
	CASE WHEN descr LIKE 'Shed%' THEN actual_yr_built
		ELSE NULL END AS shed_yr_built,
	CASE WHEN descr LIKE 'Shed%' THEN deprec_val
		ELSE NULL END AS shed_deprec_val
FROM Feature)
GROUP BY RE, building