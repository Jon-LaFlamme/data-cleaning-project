-- Query 0
SELECT
  Lender,
  AVG(LoanAmount)
FROM PPP_Table
GROUP BY Lender
ORDER BY AVG(LoanAmount) DESC;

-- Query 1
SELECT
  City,
  AVG(LoanAmount)
FROM PPP_Table
GROUP BY City
ORDER BY AVG(LoanAmount) DESC;

-- Query 2
SELECT
  City,
  JobTitle,
  COUNT(LoanAmount)
FROM PPP_Table
GROUP BY City, JobTitle
ORDER BY COUNT(LoanAmount) DESC;

-- Query 3
SELECT
  City,
  JobTitle,
  AVG(LoanAmount)
FROM PPP_Table
GROUP BY City, JobTitle
ORDER BY AVG(LoanAmount) DESC;

-- Query 4
SELECT
  Lender,
  MonthApproved,
  AVG(LoanAmount / JobsReported) as AvgPerJobAmount
FROM PPP_Table
GROUP BY Lender, MonthApproved
ORDER BY AvgPerJobAmount DESC;

-- Query 5
SELECT
  Lender,
  MonthApproved,
  AVG(JobsReported)
FROM PPP_Table
GROUP BY Lender, MonthApproved
ORDER BY AVG(JobsReported) DESC;

-- PPP_Table and zipcode joins
select
  p.*,
  (
    select city
    from zipcode as z
    where z.zipcode = p.zip
    limit 1
  ) as CleanedCity
from ppp_naics as p;
