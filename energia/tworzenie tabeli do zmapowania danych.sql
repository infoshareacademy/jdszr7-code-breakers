CREATE TABLE public.wdidata_countries_csv (
	"Country Name" varchar(50) NULL,
	"Country Code" varchar(50) NULL,
	"Indicator Name" varchar(256) NULL,
	"Indicator Code" varchar(50) NULL,
	"1960" float4 NULL,
	"1961" float4 NULL,
	"1962" float4 NULL,
	"1963" float4 NULL,
	"1964" float4 NULL,
	"1965" float4 NULL,
	"1966" float4 NULL,
	"1967" float4 NULL,
	"1968" float4 NULL,
	"1969" float4 NULL,
	"1970" float4 NULL,
	"1971" float4 NULL,
	"1972" float4 NULL,
	"1973" float4 NULL,
	"1974" float4 NULL,
	"1975" float4 NULL,
	"1976" float4 NULL,
	"1977" float4 NULL,
	"1978" float4 NULL,
	"1979" float4 NULL,
	"1980" float4 NULL,
	"1981" float4 NULL,
	"1982" float4 NULL,
	"1983" float4 NULL,
	"1984" float4 NULL,
	"1985" float4 NULL,
	"1986" float4 NULL,
	"1987" float4 NULL,
	"1988" float4 NULL,
	"1989" float4 NULL,
	"1990" float4 NULL,
	"1991" float4 NULL,
	"1992" float4 NULL,
	"1993" float4 NULL,
	"1994" float4 NULL,
	"1995" float4 NULL,
	"1996" float4 NULL,
	"1997" float4 NULL,
	"1998" float4 NULL,
	"1999" float4 NULL,
	"2000" float4 NULL,
	"2001" float4 NULL,
	"2002" float4 NULL,
	"2003" float4 NULL,
	"2004" float4 NULL,
	"2005" float4 NULL,
	"2006" float4 NULL,
	"2007" float4 NULL,
	"2008" float4 NULL,
	"2009" float4 NULL,
	"2010" float4 NULL,
	"2011" float4 NULL,
	"2012" float4 NULL,
	"2013" float4 NULL,
	"2014" float4 NULL,
	"2015" float4 NULL,
	"2016" float4 NULL,
	"2017" float4 NULL,
	"2018" varchar(50) NULL
);

select count(*) from wdidata_countries_csv wcc ;
select count(distinct(wcc."Country Code")) from wdidata_countries_csv wcc ;


select * from wdidata_countries_csv wcc where lower(wcc."Indicator Name") like '%energy%';

--polska, czechy, s�owacja, rumunia, bu�garia
--energetyka, ewentualnie, edukacja

