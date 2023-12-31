--서브쿼리(SUBQUERY) SQL 문제입니다.
--
--문제1.
--평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시요.
--(56건)

SELECT COUNT(*)                       -- 행들의 수 
FROM employees
WHERE salary < (SELECT avg(salary)    -- 월급 < 평균월급
                FROM employees);

--문제2. 
--평균급여 이상, 최대급여 이하의 월급을 받는 사원의 
--직원번호(employee_id), 이름(first_name), 급여(salary), 평균급여, 최대급여를 급여의 오름차순으로 정렬하여 출력하세요 
--(51건)

SELECT  employee_id        "직원번호"
        ,first_name        "이름"
        ,salary            "급여"
        ,round((SELECT avg(salary) 
                FROM employees)) "평균급여"    -- 반올림적용
        ,(SELECT max(salary) 
          FROM employees)  "최대급여"
FROM employees
WHERE salary >=(SELECT avg(salary) 
                FROM employees)
  and salary <=(SELECT max(salary) 
                FROM employees);


--문제3.
--직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소를 알아보려고 한다.
--도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 주(state_province), 나라아이디(country_id) 를 출력하세요
--(1건)
SELECT  lo.location_id
        ,lo.street_address
        ,lo.postal_code
        ,lo.city
        ,lo.state_province
        ,lo.country_id    
FROM employees em,departments de,locations lo
WHERE em.department_id = de.department_id
and de.location_id = lo.location_id
and (em.first_name,em.last_name) in (('Steven','King'));

-- 서브퀘리를 이용 안했었으니 이용해서 다시 풀기

SELECT  lo.location_id
        ,lo.street_address
        ,lo.postal_code
        ,lo.city
        ,lo.state_province
        ,lo.country_id    
FROM departments de, locations lo
where de.location_id = lo.location_id
and de.department_id = (SELECT department_id
                        FROM employees
                        WHERE (first_name,last_name) in (('Steven','King'))) ;

-- 스티븐 킹의 부서번호 구하기
SELECT department_id
FROM employees
WHERE (first_name,last_name) in (('Steven','King'));


--문제4.
--job_id 가 'ST_MAN' 인 직원의 급여보다 작은 직원의 사번,이름,급여를 급여의 내림차순으로 출력하세요  -ANY연산자 사용
--(74건)
 
SELECT  employee_id
        ,first_name
        ,salary    
FROM employees
WHERE salary < any (SELECT salary
                    FROM employees
                    WHERE job_id = 'ST_MAN')
ORDER BY salary desc;

SELECT salary
FROM employees
WHERE job_id = 'ST_MAN';

--문제5. 
--각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name)과 급여(salary) 부서번호(department_id)를 조회하세요 
--단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 
--조건절비교, 테이블조인 2가지 방법으로 작성하세요
--(11건)
SELECT  e.employee_id
        ,e.first_name
        ,e.salary
        ,e.department_id
FROM employees e, (SELECT  department_id
                           ,max(salary) mas
                   FROM employees
                   GROUP BY department_id) d
WHERE (e.department_id,e.salary) in ((d.department_id,d.mas))
ORDER BY e.salary desc;

SELECT  department_id
        ,max(salary)
FROM employees
GROUP BY department_id; 


--문제6.
--각 업무(job) 별로 연봉(salary)의 총합을 구하고자 합니다. 
--연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 조회하시오 
--(19건)

SELECT  job.job_title  "업무명"
        , em.sus       "연봉총합"
FROM jobs job, (SELECT  job_id
                      ,sum(salary) sus
              FROM employees
              GROUP BY job_id) em
WHERE job.job_id =  em.job_id
ORDER BY em.sus desc;
              

SELECT  job_id
        ,sum(salary)    
FROM employees
GROUP BY job_id;

--문제7.
--자신의 부서 평균 급여보다 연봉(salary)이 많은 직원의 직원번호(employee_id), 이름(first_name)과 급여(salary)을 조회하세요 
--(38건)

SELECT  em.employee_id
        ,em.department_id    -- 부서번호도 확인해보기
        ,em.first_name
        ,em.salary    
FROM employees em, (SELECT  department_id
                            ,avg(salary) avs
                    FROM employees
                    GROUP BY department_id) dep
WHERE em.department_id = dep.department_id
and em.salary > dep.avs
ORDER BY  em.department_id asc;
                
                
SELECT  department_id
        ,avg(salary)
FROM employees
GROUP BY department_id;

--문제8.
--직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 급여, 입사일을 입사일 순서로 출력하세요

SELECT em.employee_id
    
FROM employees em, (SELECT  rownum rn
                            ,emp.employee_id "empid"
                            ,emp.hire_date    
                    FROM (SELECT  employee_id
                                  ,hire_date
                          FROM employees
                          ORDER BY hire_date asc) emp) emprn
WHERE em.employee_id = emprn.emp.employee_id;




SELECT  rownum rn
        ,emp.employee_id  "empid"
        ,emp.hire_date    
FROM (SELECT  employee_id
              ,hire_date
      FROM employees
      ORDER BY hire_date asc) emp;


SELECT  employee_id
        ,hire_date
FROM employees
ORDER BY hire_date asc;

