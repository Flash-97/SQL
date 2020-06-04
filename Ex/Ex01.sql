select*from employees;

select*from departments;

select employee_id, first_name, last_name from departments;

--사원의 이름(fisrt_name)과 전화번호 입사일 연봉을 출력하세요
select first_name, phone_number, hire_date, salary from employees;

--사원의 이름(first_name)과 성(last_name) 급여, 전화번호, 이메일, 입사일을 출력하세요
select first_name, last_name, salary, phone_number, email, hire_date from employees;

select firet_name,
       last_name,
       salary,
       phone_number,
       email,
       hire_date --마지막 컬럼 콤마(,) 조심
from employees;
    --ctrl+F7은 라인정리입니다, ctrl+z는 되돌리기입니다.
    
/*selcet 문 별명*/
select employee_id as empNo,
       first_name "E-name",
       salary as "급여"
from employees;

--사원의 이름(firet_name)과 전화번호 입사일 급여로 표시되도록 출력하세요
select first_name "이름",
       phone_number "전화번호",
       hire_date "입사일",
       salary "급여"
from employees;

--사원의 사원번호 이름(first name) 성(last_name) 급여 전화번호 이메일 입사일로 표시되도록 출력하세요.
select first_name as "이름",
       last_name as"성",
       salary as "급여",
       phone_number as "전화번호",
       email as "이메일",
       hire_date as "입사일"
from employees;
    
/*select 문 컬럼 합치기*/
select first_name, last_name
from employees;

select first_name || last_name
from employees;

select first_name || ' ' || last_name
from employees;

--혿따옴표 표기
select first_name || ' '' hire date is'' ' || hire_date as empinfo
from employees;
    
/*산술 연산자 사용하기*/
select first_name, salary*12
from employees;

select first_name, salary, salary*12
from employees;

select first_name, salary, salary*12, (salary+300)*12, salary/30
from employees;

select *
from employees;

select job_id*12
from employees;

--전체직원의 정보를 다음과 같이 출력하세요 || = 더하기입니다.
select first_name || '-' || last_name as "성명",
       salary as "급여",
       salary*12 as "연봉",
       salary*12+5000 as "연봉2",
       phone_number as "전화번호"
from employees;

select *
from employees
where department_id = 10;

/*select문 where 절*/
select first_name, salary
from employees
where salary >= 15000;
--이름이 Lex인 직원의 연봉을 출력하세요
select salary
from employees
where first_name = 'Lex';

select first_name, hire_date
from employees
where hire_date >= '07/01/01';

--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where salary <= 14000
or salary >= 17000;

--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
--(between and 사용)
select *
from employees
where salary between 14000 and 17000;


--입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name, hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/13';

select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');

--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오
select first_name || '-' || last_name, salary
from employees
where salary in (2100, 3100, 4100, 5100);

--(like 사용)
select first_name|| ',' || last_name, salary
from employees
where first_name like 'L%'; /*글자수*/

--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select first_name|| ', ' || last_name, salary
from employees
where first_name like '%am%';

--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select first_name|| ', ' || last_name, salary
from employees
where first_name like '_a%'; /*글자수*/

--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name|| ', ' || last_name, salary
from employees
where first_name like '___a%'; /*글자수*/

--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name|| ', ' || last_name, salary
from employees
where first_name like '__a_'; /*글자수*/

/* null */
select first_name, salary, commission_pct, salary*commission_pct
from employees
where salary between 13000 and 15000;

--where commission_pct = null 이 아님
select first_name, salary, commission_pct
from employees
where commission_pct is null; 

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name, salary, commission_pct
from employees
where commission_pct is not null; /* is not == != 이거랑 같습니다.*/

--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select first_name
from employees
where manager_id is not null
and commission_pct is not null;

select first_name, salary
from employees
where salary >= 9000 --큰거부터 나열
order by salary desc, first_name desc; -- asc 오름차순, desc 내림차순

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select first_name, salary, department_id
from employees
order by department_id asc;

--급여가 1000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name, salary
from employees
where salary >= 1000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요  
select first_name, salary, department_id
from employees
order by department_id asc, salary desc;
