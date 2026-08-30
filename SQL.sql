create database HR_DB;
USE HR_DB;

-- Q1 COUNT TOTAL EMPLOYEES 

 SELECT COUNT(*) AS TOTAL_EMPLOYEES 
 FROM HR ;

-- Q2 Find Total Employees by Department

select count(*) as total_employee,
department from hr
group by department
order by total_employee desc
;

-- Q3 Find Average Salary by Department

select round(avg(salary)) as average_salery,
department from hr 
group by department
order by average_salery desc;



-- Q4 Top 10 Highest Paid Employees

select concat(First_Name," ",Last_Name) as Full_Name ,
salary, age, department from hr 
order by salary desc 
limit 10;

-- Q5 Top 10 Lowest Paid Employees

select concat(First_Name," ",Last_Name) as Full_Name ,
salary, age, department from hr 
order by salary asc 
limit 10;

-- Q6 Department-wise Salary Statistics

SELECT DEPARTMENT,
round(avg(SALARY)) AS AVERAGE_SALARY,
max(SALARY) AS MAX_SALARY,
MIN(SALARY) AS MIN_SALARY
FROM HR 
group by DEPARTMENT ;

-- Q7 Gender Distribution

SELECT GENDER, 
COUNT(*)AS TOTAL_EMPLOYEES 
FROM HR 
GROUP BY GENDER;


-- Q8 Attrition Analysis


SELECT ATTRITION,
count(*) AS EMPLOYEE
FROM HR 
GROUP BY ATTRITION;


-- Q9 Attrition by Department

SELECT DEPARTMENT,
sum(CASE  WHEN ATTRITION = "YES" THEN 1 ELSE 0 END)
AS ATTRITION_COUNT
FROM hr
GROUP BY DEPARTMENT
ORDER BY ATTRITION_COUNT DESC ;

-- Q10 Promotion Analysis

SELECT * FROM HR LIMIT 10
;

SELECT  PROMOTION,count(*)AS EMPLOYEE 
FROM HR 
GROUP BY PROMOTION ;
     --   OR   
     
SELECT department,
       promotion,
       COUNT(*) AS employees
FROM HR
GROUP BY department, promotion
ORDER BY department, promotion;

-- Q11 Average Performance Rating

SELECT round(AVG(PERFORMANCE_RATING),1)AS AVERAGE_RATING
FROM HR ;



-- Q12  Best Performing Departments


SELECT DEPARTMENT,round(AVG(PERFORMANCE_RATING),1)AS AVERAGE_RATING
FROM HR 
GROUP BY DEPARTMENT
ORDER BY AVERAGE_RATING DESC LIMIT 1;

-- Q13 Average Satisfaction Score

SELECT department ,avg(SATISFACTION_SCORE) AS AVG_SATISFACTION_SCORE
FROM HR
GROUP BY DEPARTMENT;

-- Q14 Top 10 Employees by Performance

SELECT EMPLOYEE_ID,
concat(FIRST_NAME, " " ,LAST_NAME) AS FULLNAME
,PERFORMANCE_RATING AS PERFORMANCE ,
DEPARTMENT
FROM HR 
ORDER BY PERFORMANCE DESC LIMIT 10 ;


-- Q15 Employees with High Salary but Low Performance

SELECT EMPLOYEE_ID,
concat(FIRST_NAME, " " ,LAST_NAME) AS FULLNAME,
SALARY , DEPARTMENT 
FROM HR
WHERE SALARY > ( SELECT avg(SALARY) FROM HR)
AND PERFORMANCE_RATING < 3;

