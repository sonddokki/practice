--혼합 SQL 문제입니다.
--
--문제1.
--담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 
--이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
--(45건)
 
SELECT  first_name
        ,manager_id
        ,commission_pct
        ,salary     
FROM employees
WHERE manager_id is not null
and commission_pct is null
and salary > 3000;

--문제2. 
--각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name), 급여(salary), 입사일(hire_date), 전화번호(phone_number), 부서번호(department_id) 를 조회하세요 
---조건절비교 방법으로 작성하세요
---급여의 내림차순으로 정렬하세요
---입사일은 2001-01-13 토요일 형식으로 출력합니다.
---전화번호는 515-123-4567 형식으로 출력합니다.
--(11건)

SELECT  emp.employee_id  "직원번호"
        ,emp.first_name  "이름"
        ,emp.salary  "급여"
        ,to_char(emp.hire_date, 'yyyy-mm-dd day')  "입사일"
        ,replace(emp.phone_number, '.','-') "전화번호"
        ,emp.department_id  "부서번호"    
FROM employees emp,(SELECT  department_id
                            ,max(salary) ms   
                    FROM employees
                    GROUP BY department_id) dep
WHERE (emp.department_id,emp.salary) in ((dep.department_id,dep.ms))
ORDER BY emp.salary desc;

--문제3
--매니저별 담당직원들의 평균급여 최소급여 최대급여를 알아보려고 한다.
---통계대상(직원)은 2005년 이후(2005년 1월 1일 ~ 현재)의 입사자 입니다.
---매니저별 평균급여가 5000이상만 출력합니다.
---매니저별 평균급여의 내림차순으로 출력합니다.
---매니저별 평균급여는 소수점 첫째자리에서 반올림 합니다.
---출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균급여, 매니저별최소급여, 매니저별최대급여 입니다.
--(9건)

SELECT  ma.manager_id
        ,em.first_name
        ,ma.avs
        ,ma.mis
        ,ma.mas
FROM employees em, (SELECT  manager_id 
                            ,round(avg(salary),0) avs
                            ,min(salary) mis
                            ,max(salary) mas  
                     FROM employees
                     where hire_date >= '05/01/01'
                     GROUP BY manager_id) ma
where em.employee_id = ma.manager_id
and ma.avs >= 5000
ORDER BY ma.avs desc;
                     
--문제4.
--각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
--부서가 없는 직원(Kimberely)도 표시합니다.
--(106명)

SELECT  e.employee_id   "사번"
        ,e.first_name   "이름"
        ,d.department_name  "부서명"
        ,m.first_name   "매니저이름"
FROM employees e, employees m, departments d
where e.manager_id = m.employee_id
and nvl(e.department_id,0) = d.department_id(+);

--문제5.
--2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의 
--사번, 이름, 부서명, 급여, 입사일을 입사일 순서로 출력하세요
 
SELECT  emp.employee_id
        ,emp.first_name
        ,d.department_name
        ,emp.salary
        ,emp.hire_date    
FROM employees emp, departments d, (SELECT  ROWNUM rn
                                            ,employee_id
                                            ,first_name
                                            ,hire_date 
                                    FROM (SELECT  employee_id
                                                 ,first_name
                                                 ,hire_date
                                                 FROM employees
                                                 where hire_date > '05.12.31'
                                                 ORDER BY hire_date asc)) rns
where emp.employee_id = rns.employee_id
and nvl(emp.department_id,0) = d.department_id(+)
and rns.rn BETWEEN 11 and 20
ORDER BY rns.rn asc;
 
/*  과정
SELECT  ROWNUM rn
        ,e.first_name
        ,e.hire_date       
FROM employees e ,(SELECT  employee_id
                           ,first_name
                           ,hire_date
                   FROM employees
                   where hire_date > '05.12.31'
                   ORDER BY hire_date asc) hire
where e.employee_id = hire.employee_id;

SELECT  employee_id
        ,first_name
        ,hire_date
FROM employees
where hire_date > '05.12.31'
ORDER BY hire_date asc;
*/

--문제6.
--가장 늦게 입사한 직원의 이름(first_name last_name)과 연봉(salary)과 근무하는 부서 이름(department_name)은?

SELECT  e.first_name || ' ' || e.last_name  "이름"
        ,e.salary  "연봉"
        ,d.department_name  "부서명"    
        ,e.hire_date "입사일"
FROM employees e, departments d
where e.hire_date = (SELECT max(hire_date)
                     FROM employees)
and e.department_id = d.department_id;

--문제7.
--평균연봉(salary)이 가장 높은 부서 직원들의 직원번호(employee_id), 이름(firt_name), 성(last_name)과  업무(job_title), 연봉(salary)을 조회하시오.


SELECT  e.employee_id
        ,e.first_name
        ,e.last_name
        ,j.job_title    
        ,e.salary
FROM employees e, jobs j 
where department_id = (SELECT  department_id
                       FROM employees
                       GROUP BY department_id
                       having avg(salary) = (SELECT max(avg(salary))
                                             FROM employees
                                             GROUP BY department_id))
and e.job_id = j.job_id;


--문제8.
--평균 급여(salary)가 가장 높은 부서는? 

SELECT e.department_id        "부서아이디"
       ,d.department_name     "부서명"   
       ,round(avg(e.salary))  "평균급여"
FROM employees e, departments d
WHERE e.department_id = d.department_id
GROUP BY e.department_id,d.department_name 
HAVING round(avg(e.salary),0) = (SELECT max(round(avg(salary),0))  -- 테이블별명과 칼럼명,평균을 낼 위치,반올림할 위치를 잘 생각해서 써야함
                                 FROM employees
                                 GROUP BY department_id);


--문제9.
--평균 급여(salary)가 가장 높은 지역은? 
SELECT  e.department_id          "부서아이디"
        ,d.department_name       "부서명"
        ,re.region_name          "지역이름"
        ,round(avg(e.salary),0)  "평균급여"
FROM employees e, departments d, locations lo, countries co, regions re
WHERE e.department_id = d.department_id
and d.location_id = lo.location_id
and lo.country_id = co.country_id
and co.region_id = re.region_id
GROUP BY e.department_id
         ,re.region_name
         ,d.department_name
HAVING avg(e.salary) = (SELECT max(avg(salary))
                        FROM employees
                        GROUP BY department_id);


-- 제일 높은 평균급여의 금액을 구함
SELECT max(avg(salary))
FROM employees
GROUP BY department_id;




--문제10.
--평균 급여(salary)가 가장 높은 업무는? 

SELECT  j.job_title    "업무이름"          -- 그룹지어서 출력가능
        ,j.job_id      "업무아이디"        -- 그룹짓지 않아서 출력불가능했었음 (그룹지어줌)
        ,avg(e.salary) "업무의 평균급여"   -- 평균값이라 바로 출력가능
FROM employees e, jobs j
WHERE e.job_id = j.job_id
GROUP BY j.job_title, j.job_id     -- 그룹지은 칼럼만 명확하게 출력가능 그 외 가능한것은 값의 수(count)나 값의 합(sum),평균(avg),최댓값(max),최저값(min) 같은것들
-- 사원테이블(employees)에서 업무(job_id)로 그룹지어 평균연봉(avg(e.salary))을 나타냄 = 사원테이블(employees)에서 업무(job_id)로 그룹지어 평균연봉중 가장 높은 연봉(max(avg(salary))을 나타냄
                                                                 -- (이 둘이 일치하는 업무만 출력)
HAVING avg(e.salary) = (SELECT  max(avg(salary))   
                        FROM employees         
                        GROUP BY job_id);


-- 직업아이디 직업별 평균연봉 확인 (직업명도 확인해보기)
SELECT  job_id
        ,avg(salary)
FROM employees
GROUP BY job_id
ORDER BY avg(salary) desc;



