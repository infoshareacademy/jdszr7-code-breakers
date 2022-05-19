select
	*
from
	wdidata_countries_csv wcc where 
	(wcc."Country Name" in ('Poland', 'Bulgaria', 'Czech Republic', 'Romania', 'Slovak Republic'))	
	--and (upper(wcc."Indicator Name") like '%ENERG%'	or upper(wcc."Indicator Name") like '%ELECTRIC%')
	--and (upper(wcc."Indicator Name") like '%KWH%'	or upper(wcc."Indicator Name") like '%KWH%')
	and (upper(wcc."Indicator Name") like '%CO2%')
	and wcc."Indicator Name" not in (
	'Alternative and nuclear energy (% of total energy use)',
	'Alternative and nuclear energy (% of total energy use)',
	'Electricity production from coal sources (% of total)',
	'Electricity production from hydroelectric sources (% of total)',--1
	'Electricity production from natural gas sources (% of total)',
	'Electricity production from nuclear sources (% of total)',
	'Electricity production from oil sources (% of total)',
	'Electricity production from oil, gas and coal sources (% of total)',--1
	'Electricity production from renewable sources, excluding hydroelectric (% of total)',--1
	'Electricity production from renewable sources, excluding hydroelectric (kWh)',--1
	--
	'Energy use (kg of oil equivalent per capita)',---2
	'Energy use (kg of oil equivalent) per $1,000 GDP (constant 2011 PPP)',---2
	'Renewable electricity output (% of total electricity output)',
	'Renewable energy consumption (% of total final energy consumption)',---2
	'Electric power consumption (kWh per capita)',---2
	'Fossil fuel energy consumption (% of total)',
	'Combustible renewables and waste (% of total energy)',
	--
	'Energy related methane emissions (% of total)',
	'Nitrous oxide emissions in energy sector (% of total)',
	'Methane emissions in energy sector (thousand metric tons of CO2 equivalent)',--3
	'Nitrous oxide emissions in energy sector (thousand metric tons of CO2 equivalent)',--3
	'CO2 emissions from electricity and heat production, total (% of total fuel combustion)',
	'CO2 intensity (kg per kg of oil equivalent energy use)',--3
	--
	'GDP per unit of energy use (PPP $ per kg of oil equivalent)',--4
	'GDP per unit of energy use (constant 2011 PPP $ per kg of oil equivalent)',--4
	--
	'Electric power transmission and distribution losses (% of output)')
	order by wcc."Indicator Name" 
	
	
--1. emisje szkodliwych zwiazkow przez lata a produkcja ze Ÿróde³ odnawialnych
--2. emisje szkodliwych zwiazkow przez lata a produkcja ze Ÿróde³ nieodnawialnych
--3. zmiany udzialu ró¿nych zrodel energii w ca³oœci produkcji przez lata
--4. zu¿ycie energii a sumaryczna produkcja energii 
--5. zu¿ycie energii a produkcja energii w podziale na odnawialne i nieodnawialne
--6. sprawnoœæ (% traconej energii)?

-- Bu³garia, Czechy, Polska, Rumunia, S³owacja
	
-- Korelacje:
--1. wydajnosc gospodarki per 1000 vs emisyjnosc co2
--2. producka energii odnawialnej kWh a emisyjnosc 
--3. wydajnoœæ gospodarki ! a zapotrzebowanie na energie a
	