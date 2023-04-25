select* from "SBAnational";


--top 3,5 and 10  with highest bank balance with their name:

WITH cte AS (
  SELECT name ,ApprovalDate,MIS_Status,GrAppv,
    row_number() over(PARTITION BY MIS_status  ORDER BY GrAppv DESC) AS Rank__
  FROM SBAnational
)
SELECT name ,ApprovalDate,MIS_Status,GrAppv
FROM cte
WHERE ApprovalDate < 2012 and MIS_Status='P I F' limit 5;



--Write out your final query that creates a column in the table (Refer to the commands in C3) which says whether a customer is eligible for a loan or not 
--based on the criterion you set in the previous component.
ALTER TABLE "SBAnational"
ADD COLUMN c3 VARCHAR;
UPDATE "SBAnational"
SET c3 = CASE
         WHEN `MIS_Status` ='CHGOFF'
	 THEN 'Not eligile for loan'
         WHEN `MIS_Status` = 'P I F'
         THEN 'eligible for loan'
         ELSE 'not_defined'
	 END AS Loan_Eligibility
         FROM "SBAnational";
	

