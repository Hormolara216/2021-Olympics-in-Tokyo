SELECT TOP (100) [Name]
,[NOC]
,[Discipline]
 FROM [OlympicsDb].[dbo].[Athelets];

 SELECT TOP (100) [Name]
,[NOC]
,[Discipline]
,[Event]
 FROM [OlympicsDb].[dbo].[Coaches];

 --count of the number of athletes from each country
 select 
 NOC,
 count(*) as count_atheltes 
 from Athelets 
 group by NOC 
 order by count_atheltes DESC;

--Total number of medal won by each country
select 
Team, 
sum(Gold) sum_gold, 
sum(Silver) sum_silver,
sum(Bronze) sum_bronze
from medals
group by Team
order by sum_gold DESC;

--Total number of gold and silver medals won by Nerthlands
select 
Team, 
sum(Gold) sum_gold, 
sum(Silver) sum_silver,
from medals
where Team="Nerthlands"
order by sum_gold,sum_silver DESC;

--average number of entires by gender for each discipline
select 
Discipline,
AVG(Female) average_female, 
AVG(Male) average_female 
from EntriesGender
group by Discipline;

--number of female and male athletes, along with the total gold medals won by teams in each discipline during the Olympics
select t.NOC,
e.Discipline,
Female, 
Male, 
Sum(Gold) as total_gold 
from entriesgender e
inner join teams t 
on e.Discipline=t.Discipline
inner join medals m 
on t.NOC=m.Team
group by t.Noc,e.Discipline,Female, Male;



