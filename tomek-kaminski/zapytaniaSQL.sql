select *from wdidata_countries_csv wcc where "Country Code" in ('ROU','BGR','CZE','SVK','POL') and "Indicator Code" ='NV.IND.EMPL.KD' --Industry value added per worker (constant 2010 US$)

select * from wdidata_countries_csv wcc where "Indicator Code" ='NY.GDP.MKTP.KD' and "Country Code" in ('DEU','LVA','CZE','SVK','POL')

select "Table Name" , "Income Group" , "Currency Unit" , "External debt Reporting status" , "System of trade" as HANDLOWY ,"Latest household survey"as Najn_badanie_gosp_dom   from wdicountry_csv wc where "Country Code"  in ('ROU','BGR','CZE','SVK','POL')

select * from wdicountry_series_csv wsc where countrycode  in ('ROU','BGR','CZE','SVK','POL')and  seriescode  ='NY.GDP.MKTP.KD'

--selekcjonujê wybrane kraje

with wdi as (
select "Country Name" ,"Country Code", wcc."Indicator Name", "Indicator Code",wc."Statistical concept and methodology" , "1989", "1990", "1991","1992","1993","1994","1995","1996","1997","1998","1999"
,"2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018" ,wsc.description ,wc.topic ,wc."Unit of measure" ,wc."Aggregation method"  from wdidata_countries_csv as wcc 
join wdicountry_series_csv as wsc 
on wcc."Country Code"  =wsc.countrycode
join wdiseries_csv as wc on wsc.seriescode =wc."Series Code" )
select *from wdi where "Country Code"  in ('ROU','BGR','CZE','SVK','POL')

select "Country Code", "Indicator Name", "Indicator Code", "1989", "1990", "1991","1992","1993","1994","1995","1996","1997","1998","1999"
,"2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018" 
from wdidata_countries_csv where "Country Code"  in ('ROU','BGR','CZE','SVK','POL')

--wyliczam wskaŸnik przyrostu dla wybranego identyfikatora

with przyrost_poland as
	(select column1 ,poland as biezacy, lag(poland) over (order by column1) as previous 
	,poland-lag(poland) over (order by column1) as przyrost
	,100*(poland-lag(poland) over (order by column1))/lag(poland) over (order by column1)
	as percent_przyrost from aktywnosc_zaw_csv azc) 
select count(*), sum(percent_przyrost), sum(percent_przyrost)/count(*)as sredni_przyrost_poland 
from przyrost_poland

with przyrost_bulgaria as
	(select column1 ,bulgaria  as biezacy, lag(bulgaria) over (order by column1) as previous 
	,bulgaria-lag(bulgaria) over (order by column1) as przyrost
	, 100*(bulgaria-lag(bulgaria) over (order by column1))/lag(bulgaria) over (order by column1)
	as percent_przyrost from aktywnosc_zaw_csv azc) 
select count(*), sum(percent_przyrost), sum(percent_przyrost)/count(*) as sredni_przyrost_bulgaria 
from przyrost_bulgaria 

--transpozycja danych dla poszczególnych lat

select "Country Name" ,"Country Code" ,"Indicator Name" ,"Indicator Code" , 
unnest(array['1989', '1990', '1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017' ]) as rok,
unnest(array["1989", "1990", "1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017" ]) as value
from wdidata_countries_csv wcc where "Country Code"  in ('ROU','BGR','CZE','SVK','POL')

select * from wdiseries_csv wc where "Series Code" ='SI.POV.LMIC.GP'