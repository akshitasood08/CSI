WITH DepartmentStats AS (
    SELECT 
        d.Name AS DepartmentName,
        AVG(e.Salary) AS AverageSalary,
        COUNT(e.EmployeeID) AS NumberOfEmployees
    FROM 
        Employees e
    JOIN 
        Departments d ON e.DepartmentID = d.DepartmentID
    GROUP BY 
        d.Name
),
OverallAvg AS (
    SELECT AVG(Salary) AS OverallAverageSalary FROM Employees
)
SELECT 
    ds.DepartmentName,
    ds.AverageSalary,
    ds.NumberOfEmployees
FROM 
    DepartmentStats ds, OverallAvg oa
WHERE 
    ds.AverageSalary > oa.OverallAverageSalary;
