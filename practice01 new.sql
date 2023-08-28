--기본 SQL 문제입니다.

--문제8
--사원의 이름(fisrt_name)과 성(last_name)을 붙여서 '성 명' 이라는 1개의 이름으로(이름과 성은 1개의 공백으로 구분), 그리고 전화번호 입사일 연봉 부서번호를 부서번호 올림차순으로 출력하세요. 부서번호가 같은경우 입사일이 늦은 사람부터 출력하세요
--단 부서번호가 없는 사람은 부서번호를 0으로 표시합니다.
SELECT  first_name||' '||last_name "성명"
        ,phone_number "전화번호"
        ,hire_date "입사일"
        ,salary  "연봉"
        ,nvl(department_id,0)  "부서번호"
FROM employees
ORDER BY nvl(department_id,0) asc, hire_date desc;

--문제12
--연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회하세요.
--연봉이 높은사람부터 출력하고 연봉이 같으면 입사일이 빠른 사람부터 출력하세요
SELECT  '***** ' || last_name  "성"
        ,to_char(salary,'$99,999')  "연봉"
        ,to_char(hire_date, 'YYYY"년"MM"월"DD"일" DAY')  "입사일"
FROM employees
WHERE salary >= 12000
ORDER BY salary desc, hire_date asc;

--문제13
--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
--입사일은 03-07-2007 과 같이  일, 월, 년도(서양식) 로 출력하세요
--이름은 모두 대문자로 출력하세요
SELECT  upper(first_name||' '||last_name)  "성명"
        ,to_char(hire_date, 'DD-MM-YYYY' ) "입사일"
FROM employees
WHERE hire_date > '07/01/01'
ORDER BY hire_date desc;

--문제15
--사원번호가 100번대인 사람의 사번 LAST_NAME 과 부서 번호를 조회한다.
--(100~199번)
SELECT employee_id "사원번호"
       ,last_name  "이름"
       ,nvl(department_id,0)  "부서번호"
FROM employees
WHERE employee_id BETWEEN 100 and 199
ORDER BY employee_id asc ;

--문제16
--연봉이 5000 에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회힌다.
--(연봉이 5000 인 사람과 12000 인 사람은 출력하지 않습니다.)
SELECT  last_name
        ,salary
FROM employees 
WHERE salary < 5000
or salary > 12000
ORDER BY salary desc;


--문제17
--07년도에 고용된 모든 사람들의 LAST_NAME 및 입사일을 조회한다.
--입사일이 늦은순으로 출력하세요 입사일은  2007-06-17 과 같이 출력하세요
SELECT  last_name
        ,to_char(hire_date, 'YYYY-MM-DD' ) "입사일"
FROM employees
WHERE hire_date BETWEEN '07-01-01' and '07-12-31'  -- 입사일값이 '07-01-01' 부터 '07-12-31'까지에 속하는지 확인하는 조건
ORDER BY hire_date desc;
-- =================================================
SELECT  last_name
        ,to_char(hire_date, 'YYYY-MM-DD' ) "입사일"
FROM employees
where hire_date like '07%' -- 입사일값에 07값이 있는지 확인하는 조건 (%기호로 오른쪽 공백을 둠 왼쪽에는 붙임)
ORDER BY hire_date desc;

--문제21
--연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 과 ST_CLERK  인 사람 모두를 구하시요
-- 틀린답  
SELECT  last_name 
        ,salary
        ,job_id
FROM employees
where salary != 2500
  and salary != 3500
  and salary != 7000
  and job_id = 'SA_REP'
   or job_id = 'ST_CLERK';
-- 이것은 연봉이 2500,3500,7000이 아니면서 직업이 SA_REP인 사람 또는 연봉 상관없이 직업이 ST_CLERK인 사람을 출력하게 된다.

-- 정답
SELECT  last_name 
        ,salary
        ,job_id
FROM employees
where (salary != 2500
  and salary != 3500
  and salary != 7000)
  and (job_id = 'SA_REP'
   or job_id = 'ST_CLERK');
 -- 연봉이 2500,3500,7000이 아니며 직업이 SA_REP 또는 ST_CLERK인 사람을 출력한다' (문제와 같다)
   

--문제22
--부서번호가 20 번 또는 50 번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서 번호를 알파벳순으로 조회한다. (a->z)
SELECT  last_name
        ,department_id
FROM employees
WHERE department_id = 20
OR department_id = 50
ORDER BY last_name asc;


--문제24
--first_name 에 a 및(OR) e 글자가 있는 사원들의 first_name 과 사번을 조회한다.
SELECT  first_name
        ,employee_id    
FROM employees
where first_name like '%a%'
or first_name like '%e%';

-- 대문자 A와 E까지 조회하기

SELECT  first_name
        ,employee_id  
FROM employees
where first_name like '%A%'
   or first_name like '%a%'
   or first_name like '%E%'
   or first_name like '%e%';  -- 모조리 검열하기
   
SELECT  first_name
        ,employee_id  
FROM employees
where upper(first_name) like '%A%'  -- 이름값을 대문자로 전부 바꾸고 A 검열
   or lower(first_name) like '%e%'; -- 이름값을 소문자로 전부 바꾸고 e 검열
   
--문제25
-- first_name 이 J로 시작하고 n으로 끝나는 사람의 first_name 과 사번 연봉을 조회한다*/
SELECT  first_name
        ,employee_id
        ,salary    
FROM employees
where first_name like 'J%'
and first_name like '%n';

/*문제26
first_name 이 J로 시작하고 n으로 끝나는 사람 중 
이름이 4글자인사람의 first_name 사번 연봉 전화번호를 조회한다*/
SELECT  first_name
        ,employee_id
        ,salary
FROM employees
where first_name like 'J__n';


--문제28
--매니저가 있는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
SELECT  last_name
        ,job_id    
FROM employees
where manager_id is not null;

--문제29
--사번(employeed_id) 이름(first_name)  연봉(salary)  10년연봉(salay10)을 연봉이 높은 사람부터 출력하세요
--출컬럼명은 사번, 이름, 연봉, 10년연봉 이며  연봉과 10년연봉은 천단위에 콤마를 표시합니다.
SELECT  employee_id  "사번"
        ,first_name  "이름"
        ,to_char(salary,'99,999')  "연봉"
        ,to_char(salary*10,'999,999') "10년 연봉"
FROM employees
order by salary desc;

--문제30
--사번(employeed_id) 이름(first_name) 연봉(salary)  월급 세금  실수령액을 출력하세요.
--출력컬럼명과 계산식은 사번, 이름, 연봉, 월급(연봉/12), 세금(연봉/12*3.3%), 실수령액(월급-세금) 이며 천단위에 콤마를 출력합니다..
SELECT  employee_id "사번"
        ,first_name "이름"
        ,to_char(salary, '9,999,999') "연봉"
        ,to_char(salary/12, '9,999,999') "월급"
        ,to_char((salary/12)*(3.3/100), '9,999,999') "세금"
        ,to_char(salary/12-((salary/12)*(3.3/100)), '9,999,999') "실수령액"
FROM employees;

--문제31
--업무(jobs)별로 업무이름(job_title)과 최고월급(max_salary)을 최고월급의 내림차순(DESC)로 정렬하세요.
SELECT  job_title
        ,max_salary
FROM jobs
ORDER BY max_salary desc;

--문제32
--담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 이름, 매니저아이디, 커미션 비율, 연봉 을 출력하세요.
SELECT  first_name "이름"
        ,manager_id "매니저아이디"
        ,commission_pct "커미션비율"
        ,salary "연봉"
FROM employees
where manager_id is not null
and commission_pct is null
and salary > 3000;

-- =========================================
-- 추가로 사원번호와 매니저이름도 출력해보시오 (같은 테이블 조인하기)
SELECT  em.employee_id "사원번호"
        ,em.first_name "이름"
        ,em.manager_id "매니저아이디"
        ,ma.first_name "매니저이름"
        ,em.commission_pct "커미션비율"
        ,em.salary "연봉"
FROM employees em, employees ma
where em.manager_id = ma.employee_id
and em.manager_id is not null
and em.commission_pct is null
and em.salary > 3000;

--문제33
--최고월급(max_salary)이 10000 이상인 업무의 이름(job_title)과 최고월급(max_salary)을 최고월급의(max_salary) 내림차순(DESC)로 정렬하여 출력하세요.    
SELECT  job_title
        ,max_salary
FROM jobs
where max_salary >= 10000
order by max_salary desc;

--문제35
--부서번호가 10, 90, 100 인 직원의 이름, 연봉, 입사일, 부서번호를 나타내시오
--입사일은 2007-12-22 12:00:00 (년-월) 와 같이 표시하시오
--(시간은 12:00:00 으로 표현됩니다)
SELECT  first_name "이름"
        ,salary "연봉"
        ,to_char(hire_date, 'YYYY-MM-DD HH:MI:SS') "입사일"
        ,department_id  "부서번호"  
FROM employees
where department_id in (10,90,100);


--문제37
--전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세요.
SELECT  department_name   "부서이름"
        ,length(department_name) "부서이름 글자 수"
FROM departments
order by length(department_name) desc; -- 문자열 길이변환 함수


--문제38
--지사가 있을 것으로 예상되는 나라들을 나라이름을 대문자로 출력하고
--올림차순(ASC)으로 정렬해 보세오.
SELECT upper(country_name)    
FROM countries
ORDER BY country_name asc;

--문제39
--입사일이 03/12/31 일 이전 입사한 직원의 이름, 연봉, 전화 번호, 입사일을 출력하세요
--전화번호는 545-343-3433 과 같은 형태로 출력하시오.
SELECT  first_name
        ,salary
        ,replace(phone_number, '.', '-') "phone_number"  -- replace(바꾸다) 특정문자를 다른문자로 바꿔주는 함수
        ,hire_date
FROM employees
where hire_date < '03/12/31'
