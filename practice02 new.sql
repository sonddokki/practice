--집계(통계) SQL 문제입니다.
--
--문제1.
--매니저가 있는 직원은 몇 명입니까? 아래의 결과가 나오도록 쿼리문을 작성하세요
SELECT count(employee_id)    
FROM employees
WHERE manager_id is not null;

--문제2. 
--직원중에 최고임금(salary)과  최저임금을 “최고임금, “최저임금”프로젝션 타이틀로 함께 출력해 보세요. 두 임금의 차이는 얼마인가요?  “최고임금 – 최저임금”이란 타이틀로 함께 출력해 보세요.
SELECT  max(salary) "최고임금"
        ,min(salary) "최저임금"
        ,max(salary) - min(salary) "최고임금-최저임금"
FROM employees;


--문제3.
--마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
--예) 2014년 07월 10일
SELECT to_char(max(hire_date), 'YYYY"년 "MM"월 "DD"일"') hire_date
FROM employees;


--문제4.
--부서별로 평균임금, 최고임금, 최저임금을 부서아이디(department_id)와 함께 출력합니다.
--정렬순서는 부서번호(department_id) 내림차순입니다.
SELECT  nvl(department_id,0) "부서번호"
        ,TO_CHAR(avg(salary), '99,999') "평균임금"
        ,TO_CHAR(MAX(salary), '99,999') "최고임금"
        ,TO_CHAR(MIN(salary), '99,999') "최저임금"
FROM employees
GROUP BY department_id
order by nvl(department_id,0) desc;



--문제5.
--업무(job_id)별로 평균임금, 최고임금, 최저임금을 업무아이디(job_id)와 함께 출력하고 정렬순서는 최저임금 내림차순, 평균임금(소수점 반올림), 오름차순 순입니다.
--(정렬순서는 최소임금 2500 구간일때 확인해볼 것)
SELECT  job_id
        ,round(avg(salary),0) "평균임금"
        ,TO_CHAR(MAX(salary), '99,999') "최고임금"
        ,TO_CHAR(MIN(salary), '99,999') "최저임금"
FROM employees
GROUP by job_id
order by MIN(salary) desc ,avg(salary) asc;


--문제6.
--가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
--예) 2001-01-13 토요일 
SELECT to_char(min(hire_date), 'YYYY-MM-DD day')   "입사일" 
FROM employees;


--문제7.
--평균임금과 최저임금의 차이가 2000 미만인 부서(department_id), 평균임금, 최저임금 그리고 (평균임금 – 최저임금)를 (평균임금 – 최저임금)의 내림차순으로 정렬해서 출력하세요.
SELECT  department_id "부서"
        ,ROUND(avg(salary),0) "평균임금"
        ,min(salary) "최저임금"
        ,ROUND(avg(salary)-min(salary),0) "평균임금 – 최저임금"
FROM employees
GROUP BY department_id
HAVING avg(salary) - min(salary) < 2000
ORDER BY avg(salary)-min(salary) desc;


--문제8.
--업무(JOBS)별로 최고임금과 최저임금의 차이를 출력해보세요.
--차이를 확인할 수 있도록 내림차순으로 정렬하세요? 
SELECT  job_title "업무"
        ,max_salary "최고임금"
        ,min_salary "최저임금"
        ,max_salary-min_salary "최저차이"
FROM jobs
order by max_salary-min_salary desc;

--===============================================
-- 직원테이블로 작성

SELECT  job_id  "업무아이디"
        ,max(salary) "최고임금"
        ,min(salary) "최저임금"
        ,max(salary) - min(salary) "최저차이"
FROM employees
GROUP BY job_id
order by 최저차이 desc;


--문제9
--2005년 이후 입사자중 관리자별로 평균급여 최소급여 최대급여를 알아보려고 한다.
--출력은 관리자별로 평균급여가 5000이상 중에 평균급여 최소급여 최대급여를 출력합니다.
--평균급여의 내림차순으로 정렬하고 평균급여는 소수점 첫째짜리에서 반올림 하여 출력합니다.
SELECT   manager_id
        ,round(avg(salary),0) "평균급여"
        ,min(salary)
        ,max(salary)
FROM employees
where hire_date > '05/01/01'
GROUP BY manager_id
HAVING avg(salary) > 5000
ORDER BY 평균급여 DESC ;

--문제10
--아래회사는 보너스 지급을 위해 직원을 입사일 기준으로 나눌려고 합니다. 
--입사일이 02/12/31일 이전이면 '창립맴버, 03년은 '03년입사’, 04년은 ‘04년입사’ 
--이후입사자는 ‘상장이후입사’ optDate 컬럼의 데이터로 출력하세요.
--정렬은 입사일로 오름차순으로 정렬합니다.

SELECT  employee_id "직원아이디"
        ,salary "급여"
        ,CASE WHEN hire_date < '02/12/31' THEN '창립맴버'
              WHEN hire_date BETWEEN '03/01/01' and '03/12/31' THEN '03년입사'
              WHEN hire_date BETWEEN '04/01/01' and '04/12/31' THEN '04년입사'
              ELSE '상장이후입사'
	     END optDate  
        ,hire_date "입사일"  
FROM employees
ORDER BY hire_date asc;

