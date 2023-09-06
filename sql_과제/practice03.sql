--테이블간 조인(JOIN) SQL 문제입니다.

--문제1.
--직원들의 사번(employee_id), 이름(firt_name), 성(last_name)과 부서명(department_name)을 조회하여 부서이름(department_name) 오름차순, 사번(employee_id) 내림차순 으로 정렬하세요.
--(106건)
SELECT  e.employee_id  "사번"
        ,e.first_name  "이름"
        ,e.last_name  "성"
        ,d.department_name  "부서명"
FROM employees e, departments d
WHERE e.department_id = d.department_id
ORDER BY d.department_name asc, e.employee_id desc;

--문제2.
--employees 테이블의 job_id는 현재의 업무아이디를 가지고 있습니다.
--직원들의 사번(employee_id), 이름(firt_name), 급여(salary), 부서명(department_name), 현재업무(job_title)를 사번(employee_id) 오름차순 으로 정렬하세요.
--부서가 없는 Kimberely(사번 178)은 표시하지 않습니다.
--(106건)

SELECT  e.employee_id  "사번"
        ,e.first_name  "이름"
        ,e.salary  "급여"
        ,d.department_name  "부서명"
        ,j.job_title  "현재업무"
        
FROM employees e
    ,departments d
    ,jobs j 
    
WHERE e.job_id = j.job_id
and e.department_id = d.department_id

ORDER BY e.employee_id asc;


--문제2-1.
--문제2에서 부서가 없는 Kimberely(사번 178)까지 표시해 보세요
--(107건)

SELECT  e.employee_id  "사번"
        ,e.first_name  "이름"
        ,e.salary  "급여"
        ,d.department_name  "부서명"
        ,j.job_title  "현재업무"
        
FROM employees e left outer join departments d
ON e.department_id = d.department_id 
left outer join jobs j  -- 테이블 3개 조인시 기준이 되는 한 테이블에 대한 조건을 완료하고 새로운 테이블을 옆에 또 붙인다
ON e.job_id = j.job_id

ORDER BY e.employee_id asc;

-- whara 써서 풀기 (오라클에서 쓸 수 있는 (+)기호 사용)

SELECT  e.employee_id  "사번"
        ,e.first_name  "이름"
        ,e.salary  "급여"
        ,d.department_name  "부서명"
        ,j.job_title  "현재업무"
        
FROM employees e, departments d, jobs j -- 테이블 그대로 삽입
WHERE e.department_id = d.department_id(+) -- null값의 표현이 필요한쪽에 (+)를 붙인다
and e.job_id = j.job_id -- null값이 없으므로 건드릴 필요 없음

ORDER BY e.employee_id asc;


--문제3.
--도시별로 위치한 부서들을 파악하려고 합니다.
--도시아이디, 도시명, 부서명, 부서아이디를 도시아이디(오름차순)로 정렬하여 출력하세요 
--부서가 없는 도시는 표시하지 않습니다.
--(27건)

SELECT  lo.location_id  "도시아이디"
        ,lo.city  "도시명"
        ,de.department_name  "부서명"
        ,de.department_id  "부서아이디"
FROM departments de, locations lo
WHERE de.location_id = lo.location_id
ORDER BY lo.location_id asc;

-- 해당하는 도시아이디 확인
SELECT location_id
FROM departments
GROUP BY location_id
order by location_id asc;

--문제3-1.
--문제3에서 부서가 없는 도시도 표시합니다. 
--(43건)
SELECT  lo.location_id  "도시아이디"
        ,lo.city  "도시명"
        ,de.department_name  "부서명"
        ,de.department_id  "부서아이디"
FROM departments de, locations lo
WHERE de.location_id(+) = lo.location_id
-- 오른쪽에 있는 값을 모두 표현하기 위해 조건에 만족하지 않아도 null로 표현해서 보여주기 
ORDER BY lo.location_id asc;

SELECT  lo.location_id  "도시아이디"
        ,lo.city  "도시명"
        ,de.department_name  "부서명"
        ,de.department_id  "부서아이디"
FROM departments de RIGHT outer JOIN locations lo  
-- 오른쪽을 기준으로 조인하여 조건에 만족하지 않아도 null로 표현해서 보여주기 
on de.location_id = lo.location_id
ORDER BY lo.location_id asc;

--문제4.
--지역(regions)에 속한 나라들을 지역이름(region_name), 나라이름(country_name)으로 출력하되 지역이름(오름차순), 나라이름(내림차순) 으로 정렬하세요.
--(25건)
SELECT  reg.region_name "지역이름"
        ,cou.country_name "나라이름"        
FROM countries cou LEFT OUTER JOIN regions reg
ON reg.region_id = cou.region_id
ORDER BY reg.region_name asc, cou.country_name desc;

--문제5. 
--자신의 매니저보다 채용일(hire_date)이 빠른 사원의 
--사번(employee_id), 이름(first_name)과 채용일(hire_date), 매니저이름(first_name), 매니저입사일(hire_date)을 조회하세요.
--(37건)
SELECT  em.employee_id "사번"
        ,em.first_name "사원이름"
        ,em.hire_date "채용일"
        ,ma.employee_id "매니저번호"
        ,ma.first_name "매니저이름"
        ,ma.hire_date "매니저 입사일"
FROM employees em, employees ma 
WHERE em.manager_id = ma.employee_id -- 첫번째로 쓸 테이블의 매니저아이디와 두번째로 쓸 테이블의 사원아이디가 일치하는것만 출력 (매니저가 존재하는 사원만 출력)
and em.hire_date < ma.hire_date -- 그중에 첫번째 테이블(사원)의 입사일이 두번째 테이블(매니저)의 입사일보다 빠른것을 (숫자상으로 작으면) 출력
ORDER BY em.employee_id asc; -- 사원번호로 오름차순 정렬

--문제6.
--나라별로 어떠한 부서들이 위치하고 있는지 파악하려고 합니다.
--나라명, 나라아이디, 도시명, 도시아이디, 부서명, 부서아이디를 나라명(오름차순)로 정렬하여 출력하세요.
--값이 없는 경우 표시하지 않습니다.
--(27건)
SELECT  c.country_name  "나라명"
        ,c.country_id  "나라아이디"
        ,l.city  "도시명"
        ,l.location_id  "도시아이디"
        ,d.department_name  "부서명"
        ,d.department_id  "부서아이디를"
FROM countries c, locations l, departments d
WHERE c.country_id = l.country_id
and l.location_id = d.location_id
ORDER BY c.country_name asc;

--문제7.
--job_history 테이블은 과거의 담당업무의 데이터를 가지고 있다.
--과거의 업무아이디(job_id)가 ‘AC_ACCOUNT’로 근무한 사원의 사번, 이름(풀네임), 업무아이디, 시작일, 종료일을 출력하세요.
--이름은 first_name과 last_name을 합쳐 출력합니다.
--(2건)
SELECT  em.employee_id  "사번"
        ,em.first_name || ' ' || em.last_name  "이름(풀네임)"
        ,em.job_id "현재업무"
        ,jh.job_id "이전업무"
        ,jh.start_date "시작일"
        ,jh.end_date "종료일"
FROM employees em, job_history jh  -- 직원테이블과 과거업무테이블을 삽입
WHERE em.employee_id = jh.employee_id -- 직원의 아이디 기록 매칭
and jh.job_id = 'AC_ACCOUNT'; -- 과거업무에서 업무아이디가 AC_ACCOUNT인 직원 선별

--문제8.
--각 부서(department)에 대해서 부서번호(department_id), 부서이름(department_name), 
--매니저(manager)의 이름(first_name), 위치(locations)한 도시(city), 나라(countries)의 이름(countries_name) 그리고 지역구분(regions)의 이름(resion_name)까지 전부 출력해 보세요.
--(11건)
SELECT dd.department_id "부서번호"
       ,dd.department_name  "부서이름"
       ,ee.first_name  "매니저이름"
       ,ll.city "도시이름"
       ,cc.country_name "나라이름"
       ,rr.region_name "지역이름"
FROM departments dd, employees ee, locations ll, countries cc, regions rr
WHERE dd.manager_id = ee.employee_id
and dd.location_id = ll.location_id
and ll.country_id = cc.country_id
and cc.region_id = rr.region_id;


--문제9.
--각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
--부서가 없는 직원(Kimberely)도 표시합니다.
--(106명)
SELECT  em.employee_id "사번"
        ,em.first_name "이름"
        ,de.department_id "부서번호"
        ,de.department_name "부서명"
        ,ma.employee_id "매니저사번"
        ,ma.first_name "매니저이름"
FROM  employees em, employees ma, departments de
WHERE em.department_id = de.department_id(+)
and em.manager_id = ma.employee_id
ORDER BY em.employee_id asc;


SELECT
    *
FROM employees;
