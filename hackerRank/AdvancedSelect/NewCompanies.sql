SELECT c.company_code, c.founder,
       COUNT(DISTINCT lm.lead_manager_code) AS lead_manager_number,
       COUNT(DISTINCT sm.senior_manager_code) AS senior_manager_number,
       COUNT(DISTINCT m.manager_code) AS manager_number,
       COUNT(DISTINCT e.employee_code) AS employee_number
FROM Company c LEFT JOIN Lead_Manager lm ON c.company_code = lm.company_code
               LEFT JOIN Senior_Manager sm ON lm.lead_manager_code = sm.lead_manager_code
               LEFT JOIN Manager m ON sm.senior_manager_code = m.senior_manager_code
               LEFT JOIN Employee e ON m.manager_code = e.manager_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;
