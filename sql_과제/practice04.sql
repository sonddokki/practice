--서브쿼리(SUBQUERY) SQL 문제입니다.

--문제1.
--평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시요.
--(56건)

SELECT COUNT(salary)
FROM employees 
where salary < (SELECT avg(salary)    
                FROM employees);

--문제2. 
--평균급여 이상, 최대급여 이하의 월급을 받는 사원의 
--직원번호(employee_id), 이름(first_name), 급여(salary), 평균급여, 최대급여를 급여의 오름차순으로 정렬하여 출력하세요 
--(51건)

SELECT employee_id "직원번호"
       ,first_name  "이름"
       ,salary "급여"
       ,round((SELECT avg(salary)    
               FROM employees),0 ) "평균급여"
       ,(SELECT max(salary)    
         FROM employees) "최대급여"
FROM employees
where salary >= (SELECT avg(salary)    
                 FROM employees)
and   salary <= (SELECT max(salary)    
                 FROM employees)
ORDER BY salary asc;              

--문제3.
--직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소를 알아보려고 한다.
--도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 주(state_province), 나라아이디(country_id) 를 출력하세요
--(1건)

SELECT  location_id
        ,street_address
        ,postal_code
        ,city
        ,state_province
        ,country_id    
FROM locations
WHERE location_id = (SELECT location_id
                     FROM departments
                     WHERE department_id = (SELECT department_id    
                                            FROM employees
                                            WHERE (first_name,last_name) in (('Steven','King'))));
                                            
--문제4.
--job_id 가 'ST_MAN' 인 직원의 급여보다 작은 직원의 사번,이름,급여를 급여의 내림차순으로 출력하세요  -ANY연산자 사용
--(74건)

SELECT  employee_id
        ,first_name
        ,salary   
FROM employees
WHERE salary < any (SELECT salary    
                     FROM employees
                     WHERE job_id = 'ST_MAN')  -- 이쪽에 속해있는 최대급여 보다만 낮으면 되므로 ANY
ORDER BY salary desc;

--문제5. 
--각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name)과 급여(salary) 부서번호(department_id)를 조회하세요 
--단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 
--조건절비교, 테이블조인 2가지 방법으로 작성하세요
--(11건)

SELECT  emp.employee_id
        ,emp.first_name
        ,emp.salary
        ,emp.department_id    
FROM employees emp , (SELECT  department_id
                              ,max(salary) sa
                      FROM employees
                      GROUP BY department_id) sal
WHERE (emp.department_id,emp.salary) in ((sal.department_id,sal.sa))
ORDER BY emp.salary desc;

--문제6.
--각 업무(job) 별로 연봉(salary)의 총합을 구하고자 합니다. 
--연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 조회하시오 
--(19건)

SELECT job.job_title  
        ,sal.sumSal
FROM jobs job,(SELECT job_id
                      ,sum(salary) sumSal   
               FROM employees
               GROUP BY job_id) sal
WHERE job.job_id = sal.job_id 
ORDER BY sumSal desc;            

--문제7.
--자신의 부서 평균 급여보다 연봉(salary)이 많은 직원의 직원번호(employee_id), 이름(first_name)과 급여(salary)을 조회하세요 
--(38건)

SELECT  emp.employee_id
        ,emp.first_name
        ,emp.salary  
FROM employees emp,(SELECT department_id
                           ,avg(salary) avgSal 
                    FROM employees
                    GROUP BY department_id) dep
WHERE emp.department_id = dep.department_id
and emp.salary > dep.avgSal;

--문제8.
--직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 급여, 입사일을 입사일 순서로 출력하세요


SELECT  emp.rn
        ,emp.employee_id
        ,emp.first_name
        ,emp.salary
        ,emp.hire_date
FROM ( SELECT  rownum rn
               ,employee_id
               ,first_name
               ,salary
               ,hire_date
       FROM (SELECT  employee_id
                     ,first_name
                     ,salary
                     ,hire_date
             FROM employees
             ORDER BY hire_date asc)) emp
WHERE emp.rn BETWEEN 11 and 15;




SELECT  rownum rn
        ,employee_id
        ,first_name
        ,salary
        ,hire_date
FROM (SELECT  employee_id
              ,first_name
              ,salary
              ,hire_date
      FROM employees
      ORDER BY hire_date asc);







SELECT  employee_id
        ,first_name
        ,salary
        ,hire_date
FROM employees
ORDER BY hire_date asc;


