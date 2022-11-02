--szukanie wskaznikow dotyczacych zdrowia
select * from wdiseries w join wdiseries_time wt 
on w.series_code =wt.series_code 
where topic like '%Health%';

--wszystkie wskazniki razem z ich opisem
select w.indicator_code , w.indicator_name , w2.short_definition , w2.long_definition, w2.related_indicators  from wdidata w  join wdiseries w2 on w.indicator_code =w2.series_code group by w.indicator_code , w.indicator_name , w2.short_definition , w2.long_definition, w2.related_indicators;


select *
from wdidata w join wdiseries w3 on w.indicator_code  =w3.series_code 
where w.country_code  in ('CZE', 'BGR', 'ROU', 'POL', 'SVK') and indicator_code in ('SH.DYN.NCOM.ZS','NY.GDP.PCAP.CD','SH.XPD.CHEX.GD.ZS','SH.XPD.GHED.GD.ZS' ,'SH.XPD.OOPC.CH.ZS', 'SH.UHC.OOPC.10.ZS','SH.UHC.OOPC.25.ZS','SH.MED.BEDS.ZS','SH.XPD.CHEX.PP.CD');


--transpozycja danych - rok w jednej kolumnie
select 
w.country_name ,w.country_code ,w.indicator_name ,w.indicator_code ,
unnest(array['1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000', '2001' ,'2002','2003','2004','2005','2006','2007','2008', '2009' ,'2010','2011','2012','2013','2014','2015','2016','2017','2018']) as rok,
unnest(array[w."1990",w."1991",w."1992",w."1993",w."1994",w."1995",w."1996",w."1997",w."1998",w."1999",w."2000" ,w."2001" ,w."2002",w."2003",w."2004" ,w."2005" ,w."2006",w."2007",w."2008",w."2009",w."2010",w."2011",w."2012",w."2013",w."2014" ,w."2015" ,w."2016",w."2017",w."2018"]) as value
from wdidata w 
where w.country_code  in ('CZE', 'BGR', 'ROU', 'POL', 'SVK') and indicator_code in('SH.DYN.NCOM.ZS','NY.GDP.PCAP.CD','SH.XPD.CHEX.GD.ZS','SH.XPD.GHED.GD.ZS' ,'SH.XPD.OOPC.CH.ZS', 'SH.UHC.OOPC.10.ZS','SH.UHC.OOPC.25.ZS','SH.MED.BEDS.ZS','SH.XPD.CHEX.PP.CD') 
order by indicator_code , country_code ;




