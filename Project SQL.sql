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

--// write a query to join personal table city name or cid column
select * from project..personal p INNER JOIN project..city c ON p.city = c.cid
INNER JOIN project..department d
ON p.Department_no = d.d_id;
  
--// write a query not see to F12 CITY OR CID column
select p.Empno,p.Emp_name,p.salary,p.Emp_phoneno,p.joining_date,p.Emp_job,
p.Emp_accountno,p.Emp_email_id,p.Emp_address,p.Emp_department,p.Department_no,
c.cityname 
from project..personal p INNER JOIN project..city c 
ON p.city = c.cid;

-- write a query to see how many employs in Delhi
select p.Empno,p.Emp_name,p.salary,p.Emp_phoneno,p.joining_date,p.Emp_job,
p.Emp_accountno,p.Emp_email_id,p.Emp_address,p.Emp_department,p.Department_no,
c.cityname 
from project..personal p INNER JOIN project..city c 
ON p.city = c.cid
Where c.cityname = 'Delhi';

-- write a query to see how many employs in Data analyst
select p.Empno,p.Emp_name,p.salary,p.Emp_phoneno,p.joining_date,p.Emp_job,
p.Emp_accountno,p.Emp_email_id,p.Emp_address,p.Emp_department,p.Department_no,
c.cityname 
from project..personal p INNER JOIN project..city c 
ON p.city = c.cid
where p.Emp_job = 'Data analyst';

--// write a query to personal table Emp_name in ascending order
select p.Empno,p.Emp_name,p.salary,p.Emp_phoneno,p.joining_date,p.Emp_job,
p.Emp_accountno,p.Emp_email_id,p.Emp_address,p.Emp_department,p.Department_no,
c.cityname 
from project..personal p INNER JOIN project..city c 
ON p.city = c.cid
ORDER BY p.Emp_name;

--// DIFFERENCE LEFT JOIN & INNER JOIN
select s.stu_id,s.name,s.fees,s.mobile,s.[time ],s.course,s.roll_no,
s.email_id,s.department,d.d_name,d.d_location
from project..students s LEFT JOIN project..department d
ON s.department = d.d_name;

select s.stu_id,s.name,s.fees,s.mobile,s.[time ],s.course,s.roll_no,
s.email_id,s.department,d.d_name,d.d_location
from project..students s INNER JOIN project..department d
ON s.department = d.d_name;

-- Write a query to details analytics department
select s.stu_id,s.name,s.fees,s.mobile,s.[time ],s.course,s.roll_no,
s.email_id,s.department,d.d_name,d.d_location
from project..students s INNER JOIN project..department d
ON s.department = d.d_name
where s.department = 'analytics';

--write a query to change name martialstatus relationship & hoursperweek and how many genders are male in ascending order
select w.age,w.workclass,w.education,w.maritalstatus AS Martial_Status,
w.occupation,w.relationship AS Relation_Ship,w.race,w.gender,
w.hoursperweek AS Hoursper_Week,w.income,c.cityname
from project..work w INNER JOIN project..city c 
ON w.city = c.cid
where w.gender = 'Male'
ORDER BY age;

-- RIGHT JOIN
select s.stu_id,s.name,s.fees,s.mobile,s.[time ],s.course,s.roll_no,
s.email_id,s.department,d.d_name
from project..students s RIGHT JOIN project..department d
ON s.department = d.d_name;

--CROSS JOIN
select *
from project..personal CROSS JOIN project..city;

--Write a query to change Emp_name & cityname and see how many employs are city in bhopal
select p.Empno,p.Emp_name AS Name,p.salary,p.Emp_phoneno,
p.joining_date,p.Emp_job,p.Emp_accountno,p.Emp_email_id,
p.Emp_address,p.Emp_department,p.Department_no,
c.cityname AS City
from project..personal p CROSS JOIN project..city c
where c.cityname = 'Bhopal';

--Join Multiple tables
select * from project..personal p INNER JOIN project..city c 
ON p.city = c.cid
INNER JOIN
project..department d
ON p.Department_no = d.d_id;

--write a query to How many employes cityname in Agra & order by department name ascending order in three tables
select p.Empno,p.Emp_name AS Name,p.salary,p.Emp_phoneno AS Phone_Number,
p.joining_date,p.Emp_job AS Employ_Post,p.Emp_accountno,p.Emp_email_id AS Email_ID,
p.Emp_address,p.Emp_department,p.Department_no,c.cityname AS City,d.d_id,
d.d_name AS Department_Name,d.d_location AS Department_Location
FROM project..personal p INNER JOIN project..city c 
ON p.city = c.cid
INNER JOIN
project..department d
ON p.Department_no = d.d_id
WHERE cityname = 'Agra'
ORDER BY Department_no;

--write a query to join four tables & order by course name in ascending order
select p.Empno AS Employ_ID,p.Emp_name AS Employ_Name,p.salary AS Employ_Salary,
p.Emp_phoneno AS Emp_Contact_No,p.joining_date AS Join_Date,p.Emp_job,
p.Emp_accountno AS Emp_Account_Details,p.Emp_email_id,p.Emp_address,
p.Emp_department,p.Department_no,cr.course_name,d.d_name,d.d_location,
c.cityname AS City
from project..personal p INNER JOIN project..courses cr 
ON p.city = cr.course_id  
INNER JOIN
project..department d
ON p.Department_no = d.d_id
INNER JOIN
project..city c
ON p.city = c.cid
ORDER BY course_name;

--write a query to count AGRA BHOPAL AND DELHI
select c.cityname, COUNT(p.city) AS Total
FROM project..personal p INNER JOIN project..city c
ON p.city = c.cid
GROUP BY cityname;

--write a query to hours per week age greater than 25
select w.hoursperweek, COUNT(s.stu_id) AS Total
FROM project..work w INNER JOIN project..students s
ON s.stu_id = w.city
WHERE age>40
GROUP BY hoursperweek
ORDER BY Total;

--Write a query to which city is less than 4
select c.cityname AS CITY, COUNT(p.city) AS TOTAL
FROM project..personal p INNER JOIN project..city c
ON p.city = c.cid
GROUP BY cityname
HAVING COUNT(p.city) <4
ORDER BY TOTAL;

--UNION
select * from project..Professor
UNION
select * from project..Lecturers

--UNION QUERY
select name,age from project..Professor 
Where city = 1
UNION ALL
select name,age from project..Lecturers 
Where city = 2

--write a query to add a cityname in this table & find to delhi records
select P.id,P.name,P.age,P.gender,c.cityname
from Project..Professor P INNER JOIN Project..city c
ON P.city = c.cid
Where c.cityname = 'Delhi'
UNION ALL 
select L.id,L.name,L.age,L.gender,c.cityname
from Project..Lecturers L INNER JOIN Project..city c
ON L.city = c.cid
Where c.cityname = 'Delhi'
ORDER BY id,age;

--write a query to how many students are in btech
select name from project..professor p 
where course = (select course_id from project..courses c where course_name = 'Btech');

--write a query to how many students are fees in submit and due
SELECT stu_id,name,fees,mobile,time,course,roll_no,email_id,address,department,
IIF(fees >=40000, 'FEES SUBMITTED', 'FEES DUE')
AS FEESTATUS
FROM project..students;

--write a query how many students are in admission status
SELECT stu_id,name,fees,
CASE
When fees >=50000 AND fees <=60000
Then 'Direct Admission'
When fees >=40000 AND fees <=60000
Then 'Direct Admission'
When fees >=30000 AND fees <=60000
Then 'Sport Kota'
When fees <10000 Then 'Fail'
Else 'Scholar ship'

End As Grade
From project..students;
