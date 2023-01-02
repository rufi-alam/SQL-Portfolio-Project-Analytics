select * from Project..data1;

select * from Project..data2;

select * from project..employ;

--number of rows into our dataset 1
select COUNT(*) from Project..data1

--number of rows into our dataset 2
select COUNT(*) from Project..data2

--dataset1 for state Andhra Pradesh, bihar and assam
select * from Project..data1 where State in ('Andhra Pradesh','Bihar','Assam')

--dataset2 for District agra, bangalore and chitrakoot
select * from Project..data2 where District in ('Agra','Bangalore','chitrakoot')

--dataset2 total population of india
select sum(Population) as Population from Project..data2

--dataset1 total sex_ratio of india
select sum(sex_ratio)as sex_ratio from Project..data1

--dataset1 avg growth
select AVG(Growth)*100 as Growth from Project..data1

--dataset1 state avg growth of percentage
select state,AVG(Growth)*100 as Growth from Project..data1 group by state

--dataset1 state avg sex ratio of percentage
select state,AVG(sex_ratio) as sex_ratio from Project..data1 group by state

--dataset1 state avg sex ratio of round number
select state,round(AVG(sex_ratio),0) as sex_ratio from Project..data1 group by state


--dataset1 state avg sex ratio of round number from descending order
select state,round(AVG(sex_ratio),0) as sex_ratio from Project..data1 group by state order by sex_ratio desc

--dataset1 avg literacy of round number from descending order
select state,round(AVG(Literacy),0) as Literacy from Project..data1 group by state order by Literacy desc

--dataset1 avg literacy ratio greater than 90
select state,round(AVG(literacy),0) literacy from Project..data1 
group by state having round(Avg(literacy),0)>90 order by literacy desc

--dataset1 district avg sex_ratio of percentage
select district,AVG(Sex_Ratio)/100 sex_ratio from Project..data1 group by district

--top 3 state highest growth ratio
select top 3 state,AVG(Growth)*100 as Growth from Project..data1 group by state order by Growth desc

--top 5 state highest population ratio
select top 5 state,AVG(Population) as Population from Project..Data2 group by state order by Population desc

--top 5 state lowest population ratio
select top 5 state,AVG(Population) as Population from Project..Data2 group by state order by Population asc

--top 10 district highest literacy ratio
select top 3 District,AVG(Literacy) as Literacy from Project..data1 group by District order by Literacy desc

--bottom 4 state lowest sex ratio
select top 4 state,AVG(sex_ratio) as sex_ratio from Project..data1 group by state order by sex_ratio asc

--top and bottom 3 states in literacy state
select top 3 state,AVG(literacy)as literacy from Project..data1 group by state order by literacy desc
select top 4 state,AVG(literacy)as literacy from Project..data1 group by state order by literacy asc

----top and bottom 3 states in literacy state use union operator
select * from(
select top 3 state,AVG(literacy)as literacy from Project..data1 group by state order by literacy desc) a

union

select * from(
select top 3 state,AVG(literacy)as literacy from Project..data1 group by state order by literacy asc) b

--top and bottom 5 district in sex_ratio use union operator
select * from(
select top 5 District,AVG(sex_ratio) as sex_ratio from Project..data1 group by District order by sex_ratio desc) a

union

select * from(
select top 5 District,AVG(sex_ratio) as sex_ratio from Project..data1 group by District order by sex_ratio asc) b

--states starting with letter a data
select * from Project..data1 where state like'a%'

--show only state name 
select state from project..data1 where state like 'a%'

--show only state name with distinct function
select distinct state from Project..data1 where state like'a%'

--select state with letter m or k
select * from Project..data1 where state like'm%' or state like'k%'

select state from Project..data1 where state like'm%' or state like'k%'

select distinct state from project..data1 where state like'm%' or state like'k%'

-- // write a query to findout the highest salary in the organization
select max(salary) from project..employ

-- // write a query to get the second highest salary in the organization
select max(salary) from project..employ where salary < (select max(salary) from project..employ);

-- // write a query to get details of the employees whose is earning the highest salary
select * from project..employ where salary = (select max(salary) from project..employ);

-- // write a query to find 3rd, 2nd or 1st  highest salary
select * from project..employ e
where 3= (select count(distinct salary) from project..employ  e1
where e1.salary > e.salary )