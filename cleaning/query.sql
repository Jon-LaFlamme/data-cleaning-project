-- Query 0
SELECT
  Lender,
  AVG(LoanAmount)
FROM PPP_Table
GROUP BY Lender;

-- Query 1
SELECT
  City,
  AVG(LoanAmount)
FROM PPP_Table
GROUP BY City;

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
  JobType,
  COUNT(LoanAmount)
FROM City_Classification_PPP
GROUP BY City, JobType;

-- Query 4
SELECT
  City,
  JobType,
  AVG(LoanAmount)
FROM City_Classification_PPP
GROUP BY City, JobType;

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
  Month,
  AVG(PerJobAmount)
FROM Jobs
GROUP BY Lender, Month;

-- Query 7
SELECT
  Lender,
  Month,
  AVG(JobsReported)
FROM Jobs
GROUP BY Lender, Month;
