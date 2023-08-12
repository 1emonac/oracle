/*
파일명: ex09-quiz.sql
*/

<<<<<<< HEAD:ex09-quiz.sql
-- 1. 각 직원의 성(last_name)과 해당 직원의 매니저인 직원의 성(last_name) 조회하기
-- 2. 각 직원의 성(last_name)과 해당 직원의 부서 이름(department_name) 조회하기
-- 3. 각 부서의 이름(department_name)과 해당 부서의 평균 급여(avg_salary) 조회하기
-- 4. 각 부서의 이름(department_name)과 해당 부서의 최대 급여(max_salary) 조회하기
-- 5. 각 직원의 성(last_name)과 해당 직원이 속한 부서의 최소 급여(min_salary) 조회하기
-- 6. 각 부서의 이름(department_name)과 해당 부서에 속한 직원 중 가장 높은 급여(highest_salary) 조회하기
-- 7. 각 직원의 성(last_name)과 해당 직원의 매니저의 성(last_name) 및 부서 이름(department_name) 조회하기
-- 8. 각 직원의 성(last_name)과 해당 직원이 속한 부서의 매니저의 성(last_name) 조회하기
-- 9. 각 직원의 성(last_name)과 해당 직원의 보고 상사가 있는 경우 보고 상사의 성(last_name) 조회하기
-- 10. 직원들 중에서 급여(salary)가 10000 이상인 직원들의 성(last_name)과 해당 직원의 부서 이름(department_name) 조회하기
/*
11.
각 부서의 이름(department_name), 해당 부서의 매니저의 ID(manager_id)와 매니저의 성(last_name),
직원의 ID(employee_id), 직원의 성(last_name), 그리고 해당 직원의 급여(salary) 조회하기.
직원들의 급여(salary)가 해당 부서의 평균 급여보다 높은 직원들을 조회합니다.
결과는 부서 이름과 직원의 급여가 높은 순으로 정렬됩니다.
*/
=======
-- 1. 媛� 吏곸썝�쓽 �꽦(last_name)怨� �빐�떦 吏곸썝�쓽 留ㅻ땲����씤 吏곸썝�쓽 �꽦(last_name) 議고쉶�븯湲�
SELECT worker.last_name AS worker_name, manager.last_name AS manager_name
FROM employees worker JOIN employees manager 
ON worker.manager_id = manager.employee_id;

-- 2. 媛� 吏곸썝�쓽 �꽦(last_name)怨� �빐�떦 吏곸썝�쓽 遺��꽌 �씠由�(department_name) 議고쉶�븯湲�
SELECT e.last_name, d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id;

-- 3. 媛� 遺��꽌�쓽 �씠由�(department_name)怨� �빐�떦 遺��꽌�쓽 �룊洹� 湲됱뿬(avg_salary) 議고쉶�븯湲�
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
GROUP BY department_name;

-- 4. 媛� 遺��꽌�쓽 �씠由�(department_name)怨� �빐�떦 遺��꽌�쓽 理쒕�� 湲됱뿬(max_salary) 議고쉶�븯湲�
SELECT d.department_name, MAX(e.salary) AS max_salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
GROUP BY department_name;

-- 5. 媛� 吏곸썝�쓽 �꽦(last_name)怨� �빐�떦 吏곸썝�씠 �냽�븳 遺��꽌�쓽 理쒖냼 湲됱뿬(min_salary) 議고쉶�븯湲�
SELECT last_name, MIN(salary) AS min_salary
FROM employees
GROUP BY department_id, last_name;

SELECT oe.last_name, od.Min_Salary
FROM employees oe
JOIN (
    SELECT d.department_id, MIN(e.salary) AS Min_Salary
    FROM departments d 
    JOIN employees e ON d.department_id = e.department_id
    GROUP BY d.department_id
    ) od
ON oe.department_id = od.department_id
;

-- 6. 媛� 遺��꽌�쓽 �씠由�(department_name)怨� �빐�떦 遺��꽌�뿉 �냽�븳 吏곸썝 以� 媛��옣 �넂��� 湲됱뿬(highest_salary) 議고쉶�븯湲�
SELECT department_name, max(salary) AS highest_salary
FROM employees
JOIN departments USING(department_id)
GROUP BY department_name;

-- 7. 媛� 吏곸썝�쓽 �꽦(last_name)怨� �빐�떦 吏곸썝�쓽 留ㅻ땲����쓽 �꽦(last_name) 諛� 遺��꽌 �씠由�(department_name) 議고쉶�븯湲�
SELECT emp.last_name AS emp_name, mgr.last_name AS mgr_name, d.department_name AS department_name
FROM employees emp, employees mgr, departments d
WHERE emp.department_id = d.department_id
AND emp.manager_id = mgr.employee_id;

SELECT e.last_name AS WORKER_LAST_NAME , m.last_name AS MANAGER_LAST_NAME, d.department_name
FROM employees e 
JOIN employees m ON e.manager_id = m.employee_id
JOIN departments d ON e.department_id = d.department_id;

-- 8. 媛� 吏곸썝�쓽 �꽦(last_name)怨� �빐�떦 吏곸썝�씠 �냽�븳 遺��꽌�쓽 留ㅻ땲����쓽 �꽦(last_name) 議고쉶�븯湲�
SELECT oe.last_name AS W_LAST_NAME , om.last_name AS M_LAST_NAME
FROM (
    SELECT e.last_name , d.department_id, d.manager_id
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
) oe 
JOIN employees om ON oe.manager_id = om.employee_id
;

-- 9. 吏곸썝�뱾 以묒뿉�꽌 湲됱뿬(salary)媛� 10000 �씠�긽�씤 吏곸썝�뱾�쓽 �꽦(last_name)怨� �빐�떦 吏곸썝�쓽 遺��꽌 �씠由�(department_name) 議고쉶�븯湲�
SELECT e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE salary >= 10000

/*
10.
媛� 遺��꽌�쓽 �씠由�(department_name), �빐�떦 遺��꽌�쓽 留ㅻ땲����쓽 ID(manager_id)��� 留ㅻ땲����쓽 �꽦(last_name),
吏곸썝�쓽 ID(employee_id), 吏곸썝�쓽 �꽦(last_name)10, 洹몃━怨� �빐�떦 吏곸썝�쓽 湲됱뿬(salary) 議고쉶�븯湲�.
吏곸썝�뱾�쓽 湲됱뿬(salary)媛� �빐�떦 遺��꽌�쓽 �룊洹� 湲됱뿬蹂대떎 �넂��� 吏곸썝�뱾�쓣 議고쉶�빀�땲�떎.
寃곌낵�뒗 遺��꽌 �씠由꾧낵 吏곸썝�쓽 湲됱뿬媛� �넂��� �닚�쑝濡� �젙�젹�맗�땲�떎.
*/

*/
SELECT d.department_id, d.department_name, d.manager_id, m.last_name AS M_LAST_NAME,
    e.employee_id, e.last_name AS W_LAST_NAME, e.salary
FROM departments d
JOIN employees m ON d.manager_id = m.employee_id
JOIN employees e ON d.department_id = e.department_id
WHERE 1 = 1
--AND d.department_id > 100
AND e.salary > (
            -- 媛� 遺��꽌�쓽 �룊洹� 湲됱뿬 
            SELECT AVG(e1.salary)
            FROM employees e1
            WHERE e1.department_id = d.department_id
            )
ORDER BY d.department_name, e.salary DESC
;

SELECT d.department_id, d.department_name, d.manager_id, m.last_name AS M_LAST_NAME,
    e.employee_id, e.last_name AS W_LAST_NAME, e.salary
FROM departments d
JOIN employees m ON d.manager_id = m.employee_id
JOIN employees e ON d.department_id = e.department_id
JOIN (
    SELECT department_id, AVG(salary) AS Avg_Salary
    FROM employees 
    GROUP BY department_id
    ) da
ON d.department_id = da.department_id
WHERE e.salary > da.Avg_Salary
ORDER BY d.department_name, e.salary DESC
;
>>>>>>> a1609e248560b6bcfb4c1968aa65c10146a749bc:ex09-quiz2.sql
