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
CREATE VIEW City_Classification_PPP
FROM
(
  SELECT
    C.City AS City,
    N.JobType AS JobType,
    P.LoanAmount As LoanAmount
  FROM PPE_table P
  INNER JOIN City_Table C
  ON C.City = P.City AND
     C.Zip = P.Zip
  LEFT JOIN NAICS_Table N
  ON N.NAICSCode = P.NAICS
);

-- Query 3
SELECT
  City,
  JobTitle,
  COUNT(LoanAmount)
FROM PPP_Table
GROUP BY City, JobTitle
ORDER BY COUNT(LoanAmount) DESC;

-- Query 4
SELECT
  City,
  JobTitle,
  AVG(LoanAmount)
FROM PPP_Table
GROUP BY City, JobTitle
ORDER BY AVG(LoanAmount) DESC;

-- Query 5
CREATE VIEW Jobs
FROM
(
  SELECT
    Lender,
    LoanAmount,
    JobsReported,
    MONTH(DateApproved) AS Month,
    (LoanAmount / JobsReported) AS PerJobAmount
  FROM PPP_Table
);

-- Query 6
SELECT
  Lender,
  MonthApproved,
  AVG(LoanAmount / JobsReported) as AvgPerJobAmount
FROM PPP_Table
GROUP BY Lender, MonthApproved
ORDER BY AvgPerJobAmount DESC;

-- Query 7
SELECT
  Lender,
  MonthApproved,
  AVG(JobsReported)
FROM PPP_Table
GROUP BY Lender, MonthApproved
ORDER BY AVG(JobsReported) DESC;

-- write output csv file
.headers on
.mode csv
.output test.csv
select * from tbl1;
.output stdout
