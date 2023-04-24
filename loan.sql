select* from "SBAnational";


--top 3,5 and 10  with highest bank balance with their name:
SELECT *
FROM (
    SELECT *,
        ROW_NUMBER() OVER (ORDER BY "BalanceGross" DESC) AS rank
    FROM "SBAnational"
    WHERE "ChgOffDate" IS NULL
        AND "DisbursementDate" >= CURRENT_DATE - INTERVAL '2 years'
) AS subquery
WHERE rank <= 3;

SELECT *
FROM (
    SELECT *,
        ROW_NUMBER() OVER (ORDER BY "BalanceGross" DESC) AS rank
    FROM "SBAnational"
    WHERE "ChgOffDate" IS NULL
        AND "DisbursementDate" >= CURRENT_DATE - INTERVAL '2 years'
) AS subquery
WHERE rank <= 5;


SELECT *
FROM (
    SELECT *,
        ROW_NUMBER() OVER (ORDER BY "BalanceGross" DESC) AS rank
    FROM "SBAnational"
    WHERE "ChgOffDate" IS NULL
        AND "DisbursementDate" >= CURRENT_DATE - INTERVAL '2 years'
) AS subquery
WHERE rank <= 10;



--Write out your final query that creates a column in the table (Refer to the commands in C3) which says whether a customer is eligible for a loan or not 
--based on the criterion you set in the previous component.
ALTER TABLE "SBAnational"
ADD COLUMN c3 VARCHAR;
UPDATE "SBAnational"
SET c3 = CASE
         WHEN  "DisbursementDate" >= CURRENT_DATE - INTERVAL '2 years' 
		 THEN eligible
          ELSE ineligible
                      END;

