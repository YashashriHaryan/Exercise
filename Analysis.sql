select * from dbo.Community_Development_Public_Service_Program_Activities_by_Neighborhood;

--This query shows us which race's people who are under 16 and 65+ have not been helped with the MOHCD funds
--With these results we can focus on such people with will help them financially and housing stability
--This will result in more number of people being provided house and stability in finance 
select count(*) as Count_per_race, Race_Ethnicity from dbo.Community_Development_Public_Service_Program_Activities_by_Neighborhood
where Income_Level like 'Extremely Low Income' and Age_Category = '65+' or Age_Category='Under 16'
group by Race_Ethnicity 
order by count(*) DESC;

--For the Fiscal year 2018-19, I am finding which neighborhood was funded well with different Program areas  
--This analysis will help us in comparing the neighborhoods which were neglected by the MOHCD funds and we can focus on
--their wellbeing in the next fiscal year  

select Neighborhood, count(Program_Area) as NumberofClients, Program_Area 
from dbo.Community_Development_Public_Service_Program_Activities_by_Neighborhood
where Fiscal_Year = '2018-19' 
group by Program_Area, Neighborhood
order by count(Program_Area) DESC;

--In the above query's result we can see that Tenderloin has the highest number of clients in the Workforce Development
--So I am extracting all the program areas for this particular neighborhood 
select Neighborhood, count(Program_Area) as NumberofClients, Program_Area 
from dbo.Community_Development_Public_Service_Program_Activities_by_Neighborhood
where Fiscal_Year = '2018-19' and Neighborhood ='Tenderloin'
group by Program_Area, Neighborhood
order by count(Program_Area) DESC;

select Neighborhood, count(Program_Area) as NumberofClients, Program_Area 
from dbo.Community_Development_Public_Service_Program_Activities_by_Neighborhood
where Fiscal_Year = '2018-19' and Neighborhood ='Mission'
group by Program_Area, Neighborhood
order by count(Program_Area) DESC;

--If we check which is the neighborhood that has lowest clientele and find out how many program areas are implemented
--in that area, then we can focus on that area in the coming fiscal year which will help them to be somewhat in
--a better condition

select Neighborhood, count(Program_Area) as NumberofClients, Program_Area 
from dbo.Community_Development_Public_Service_Program_Activities_by_Neighborhood
where Fiscal_Year = '2018-19' 
group by Program_Area, Neighborhood
order by count(Program_Area);

-- I am considering the first neighborhood on the result, Twin Peaks
select Neighborhood, count(Program_Area) as NumberofClients, Program_Area 
from dbo.Community_Development_Public_Service_Program_Activities_by_Neighborhood
where Fiscal_Year = '2018-19' and Neighborhood ='Twin Peaks'
group by Program_Area, Neighborhood
order by count(Program_Area) DESC;

--For each fiscal year which neighbourhood had more numbers of clients 
select fiscal_year, Neighborhood, count(Client_Record_ID) as Clientele 
from dbo.Community_Development_Public_Service_Program_Activities_by_Neighborhood
group by fiscal_year, Neighborhood
order by fiscal_year, count(Client_Record_ID) desc;
--4895,11529,4587,6370
