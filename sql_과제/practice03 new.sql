--테이블간 조인(JOIN) SQL 문제입니다.

--문제1.
--직원들의 사번(employee_id), 이름(firt_name), 성(last_name)과 부서명(department_name)을 조회하여 부서이름(department_name) 오름차순, 사번(employee_id) 내림차순 으로 정렬하세요.
--(106건)
SELECT  emp.employee_id
        ,emp.first_name
        ,emp.last_name
        ,dep.department_name  
FROM employees emp, departments dep
WHERE emp.department_id = dep.department_id
ORDER BY dep.department_name asc, emp.employee_id desc;


--문제2.
--employees 테이블의 job_id는 현재의 업무아이디를 가지고 있습니다.
--직원들의 사번(employee_id), 이름(firt_name), 급여(salary), 부서명(department_name), 현재업무(job_title)를 사번(employee_id) 오름차순 으로 정렬하세요.
--부서가 없는 Kimberely(사번 178)은 표시하지 않습니다.
--(106건)

SELECT  emp.employee_id
        ,emp.first_name
        ,emp.salary
        ,dep.department_name
        ,job.job_title    
FROM employees emp
     ,departments dep
     ,jobs job
WHERE emp.department_id = dep.department_id
  and emp.job_id = job.job_id
ORDER BY emp.employee_id asc;


--문제2-1.
--문제2에서 부서가 없는 Kimberely(사번 178)까지 표시해 보세요
--(107건)

SELECT  emp.employee_id
        ,emp.first_name
        ,emp.salary
        ,dep.department_name
        ,job.job_title    
FROM employees emp
     ,departments dep
     ,jobs job
WHERE emp.department_id = dep.department_id(+)
  and emp.job_id = job.job_id
ORDER BY emp.employee_id asc;

-- left outer join 을 써서 해보기
SELECT  emp.employee_id
        ,emp.first_name
        ,emp.salary
        ,dep.department_name
        ,job.job_title
FROM (employees emp left outer join departments dep           -- ( 직원테이블 /왼쪽 테이블의 모든 row를 출력함/ 부서테이블
      ON emp.department_id = dep.department_id)               -- on 같은 칼럼 매칭)
      left outer join jobs job ON emp.job_id = job.job_id     -- 왼쪽 테이블의 모든 row를 출력함/ 직업테이블 on 같은 칼럼 매칭
ORDER BY emp.employee_id asc;

--문제3.
--도시별로 위치한 부서들을 파악하려고 합니다.
--도시아이디, 도시명, 부서명, 부서아이디를 도시아이디(오름차순)로 정렬하여 출력하세요 
--부서가 없는 도시는 표시하지 않습니다.
--(27건)

SELECT  loc.location_id
        ,loc.city
        ,dep.department_name
        ,dep.department_id    
FROM locations loc, departments dep
WHERE loc.location_id = dep.location_id
ORDER BY loc.location_id asc;


--문제3-1.
--문제3에서 부서가 없는 도시도 표시합니다. 
--(43건)

SELECT  loc.location_id
        ,loc.city
        ,dep.department_name
        ,dep.department_id    
FROM locations loc, departments dep
WHERE loc.location_id = dep.location_id(+)
ORDER BY loc.location_id asc;


--문제4.
--지역(regions)에 속한 나라들을 지역이름(region_name), 나라이름(country_name)으로 출력하되 지역이름(오름차순), 나라이름(내림차순) 으로 정렬하세요.
--(25건)
SELECT  reg.region_name     "지역이름"
        ,cou.country_name   "나라이름"
FROM regions reg, countries cou
WHERE reg.region_id = cou.region_id
ORDER BY reg.region_name asc, cou.country_name desc;

--문제5. 
--자신의 매니저보다 채용일(hire_date)이 빠른 사원의 
--사번(employee_id), 이름(first_name)과 채용일(hire_date), 매니저이름(first_name), 매니저입사일(hire_date)을 조회하세요.
--(37건)

SELECT  em.employee_id   "사번"
        ,em.first_name   "이름"
        ,em.hire_date    "채용일"
        ,ma.first_name   "매니저이름"
        ,ma.hire_date    "매니저입사일"
FROM employees em, employees ma
WHERE em.manager_id = ma.employee_id
and ma.hire_date > em.hire_date;

--문제6.
--나라별로 어떠한 부서들이 위치하고 있는지 파악하려고 합니다.
--나라명, 나라아이디, 도시명, 도시아이디, 부서명, 부서아이디를 나라명(오름차순)로 정렬하여 출력하세요.
--값이 없는 경우 표시하지 않습니다.
--(27건)
SELECT  cou.country_name     "나라명"
        ,loc.country_id      "나라아이디"
        ,loc.city            "도시명"
        ,loc.location_id     "도시아이디"
        ,dep.department_name "부서명"
        ,dep.department_id   "부서아이디"
FROM countries cou, locations loc, departments dep
WHERE loc.country_id = cou.country_id
and loc.location_id = dep.location_id
ORDER BY cou.country_name asc;


--문제7.
--job_history 테이블은 과거의 담당업무의 데이터를 가지고 있다.
--과거의 업무아이디(job_id)가 ‘AC_ACCOUNT’로 근무한 사원의 사번, 이름(풀네임), 업무아이디, 시작일, 종료일을 출력하세요.
--이름은 first_name과 last_name을 합쳐 출력합니다.
--(2건)
SELECT  em.employee_id   "사번"
        ,em.first_name || ' ' || em.last_name  "이름"
        ,jh.job_id       "업무아이디"
        ,jh.start_date   "시작일"
        ,jh.end_date     "종료일" 
FROM job_history jh, employees em 
WHERE jh.employee_id = em.employee_id 
and jh.job_id = 'AC_ACCOUNT';

--문제8.
--각 부서(department)에 대해서 부서번호(department_id), 부서이름(department_name), 
--매니저(manager)의 이름(first_name), 위치(locations)한 도시(city), 나라(countries)의 이름(countries_name) 그리고 지역구분(regions)의 이름(resion_name)까지 전부 출력해 보세요.
--(11건)

SELECT  dep.department_id      "부서번호"
        ,dep.department_name   "부서이름"
        ,dep.manager_id        "매니저아이디"
        ,emp.first_name        "매니저이름"
        ,loc.location_id       "위치ID"
        ,loc.city              "도시명"
        ,cou.country_id        "국가ID"
        ,cou.country_name      "국가"
        ,reg.region_id         "지역ID" 
        ,reg.region_name       "지역이름"
FROM departments dep
    ,employees emp
    ,locations loc
    ,countries cou
    ,regions reg
WHERE dep.manager_id = emp.employee_id
and dep.location_id = loc.location_id
and loc.country_id = cou.country_id
and cou.region_id = reg.region_id;


--문제9.
--각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
--부서가 없는 직원(Kimberely)도 표시합니다.
--(106명)
SELECT  em.employee_id   "사번"
        ,em.first_name   "이름"
        ,de.department_name "부서명"
        ,ma.employee_id  "매니저번호"
        ,ma.first_name   "매니저이름"
FROM employees em, departments de, employees ma
WHERE em.department_id = de.department_id(+)         -- null값 포함시키기
and em.manager_id = ma.employee_id;

--

SELECT  em.employee_id   "사번"
        ,em.first_name   "이름"
        ,de.department_name "부서명"
        ,ma.employee_id  "매니저번호"
        ,ma.first_name   "매니저이름"
FROM employees em left outer join departments de 
on em.department_id = de.department_id , employees ma
where em.manager_id = ma.employee_id;
