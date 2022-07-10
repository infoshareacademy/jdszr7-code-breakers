--tworzy widok dla "Current health expenditure per capita (current US$)" - rok w jednej kolumnie

create or replace view gdp_health as
select 
w.country_name ,w.country_code ,w.indicator_name ,w.indicator_code ,
unnest(array['2000', '2001' ,'2002','2003','2004','2005','2006','2007','2008', '2009' ,'2010','2011','2012','2013','2014','2015','2016']) as rok,
unnest(array[w."2000" ,w."2001" ,w."2002",w."2003",w."2004" ,w."2005" ,w."2006",w."2007",w."2008",w."2009",w."2010",w."2011",w."2012",w."2013",w."2014" ,w."2015" ,w."2016"]) as value
from wdidata w 
where w.country_code  in ('CZE', 'BGR', 'ROU', 'POL', 'SVK') and indicator_code ='SH.XPD.CHEX.PC.CD'
order by indicator_code , country_code ;

--tworzy YoY dla poszczególnych krajów  
select 
	country_name
,	rok
,	value as obecny
,	lag(value) over (partition by country_name order by rok) as zmiana
,	value - lag(value) over (partition by country_name order by rok) as przyrost
,	100 * (value - lag(value) over (partition by country_name order by rok)) / (lag(value) over (partition by country_name order by rok)) as "przyrost%"
from gdp_health gh ;

--srednia z rocznych przyrostów dla krajow
with przyrost_GDP_health as
(select 
	country_name
,	rok
,	value as obecny
,	lag(value) over (partition by country_name order by rok) as zmiana
,	value - lag(value) over (partition by country_name order by rok) as przyrost
,	100 * (value - lag(value) over (partition by country_name order by rok)) / (lag(value) over (partition by country_name order by rok)) as "przyrost%"
from gdp_health gh)
select 
country_name , avg("przyrost%") as sredni_przyrost_gdp_for_health
from przyrost_GDP_health
group by country_name 
order by country_name ;

---SH.XPD.OOPC.PC.CD
-----Out-of-pocket expenditure per capita (current US$)
-----Health expenditure through out-of-pocket payments per capita in USD.  Out of pocket payments are spending on health directly out of pocket by households in each country.
--tworzy widok dla "Out-of-pocket expenditure per capita (current US$)" - rok w jednej kolumnie
create or replace view health_expenditure as
select 
w.country_name ,w.country_code ,w.indicator_name ,w.indicator_code ,
unnest(array['2000', '2001' ,'2002','2003','2004','2005','2006','2007','2008', '2009' ,'2010','2011','2012','2013','2014','2015','2016']) as rok,
unnest(array[w."2000" ,w."2001" ,w."2002",w."2003",w."2004" ,w."2005" ,w."2006",w."2007",w."2008",w."2009",w."2010",w."2011",w."2012",w."2013",w."2014" ,w."2015" ,w."2016"]) as value
from wdidata w 
where w.country_code  in ('CZE', 'BGR', 'ROU', 'POL', 'SVK') and indicator_code ='SH.XPD.OOPC.PC.CD'
order by indicator_code , country_code ;

--tworzy YoY dla poszczególnych krajów  
select 
	country_name
,	rok
,	value as obecny
,	lag(value) over (partition by country_name order by rok) as zmiana
,	value - lag(value) over (partition by country_name order by rok) as przyrost
,	100 * (value - lag(value) over (partition by country_name order by rok)) / (lag(value) over (partition by country_name order by rok)) as "przyrost%"
from health_expenditure he ;

--srednia z rocznych przyrostów dla krajow
with przyrost_health_exp as
(select 
	country_name
,	rok
,	value as obecny
,	lag(value) over (partition by country_name order by rok) as zmiana
,	value - lag(value) over (partition by country_name order by rok) as przyrost
,	100 * (value - lag(value) over (partition by country_name order by rok)) / (lag(value) over (partition by country_name order by rok)) as "przyrost%"
from health_expenditure)
select 
country_name , avg("przyrost%") as sredni_przyrost_health_exp
from przyrost_health_exp
group by country_name 
order by country_name ;

--?rednia Out-of-pocket expenditure per capita (current US$)
select country_name ,avg(value)
from health_expenditure he 
group by country_name 
order by country_name ;

--SP.DYN.CDRT.IN
-----Death rate, crude (per 1,000 people)
with death_rate as
(select 
w.country_name ,w.country_code ,w.indicator_name ,w.indicator_code ,
unnest(array['2000', '2001' ,'2002','2003','2004','2005','2006','2007','2008', '2009' ,'2010','2011','2012','2013','2014','2015','2016']) as rok,
unnest(array[w."2000" ,w."2001" ,w."2002",w."2003",w."2004" ,w."2005" ,w."2006",w."2007",w."2008",w."2009",w."2010",w."2011",w."2012",w."2013",w."2014" ,w."2015" ,w."2016"]) as value
from wdidata w 
where w.country_code  in ('CZE', 'BGR', 'ROU', 'POL', 'SVK') and indicator_code ='SP.DYN.CDRT.IN'
order by indicator_code , country_code)
select death_rate.country_name, avg(death_rate.value)
from death_rate
group by death_rate.country_name;


--zale?no?? mi?dzy GDP for capita a current helath expenditure per capita

select country_name , corr(gchec."GDP per capita (current US$)",gchec."Current health expenditure per capita (current US$)") 
from gdp_current_health_exp_csv gchec 
group by country_name ;
