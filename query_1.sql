--delete it

CREATE TABLE Companies (
    company_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    industry VARCHAR(50),
    website VARCHAR(100)
);


INSERT INTO Companies (name, location, industry, website)
VALUES 
('Innovatech Labs', 'Bangalore', 'IT Services', 'https://www.innovatechlabs.com'),
('Green Energy Corp', 'Pune', 'Renewable Energy', 'https://www.greenenergycorp.com'),
('FinWise Solutions', 'Hyderabad', 'Finance', 'https://www.finwisesolutions.com'),
('HealthPlus Pvt Ltd', 'Chennai', 'Healthcare', 'https://www.healthplus.com'),
('EduSmart Technologies', 'Delhi', 'Education Technology', 'https://www.edusmarttech.com');


SELECT * FROM companies;

SELECT name,location FROM companies
WHERE location='Pune';


-- Define a CTE for companies
WITH CompanyCTE AS (
    SELECT name, location
    FROM Companies
)
-- Use the CTE to filter
SELECT *
FROM CompanyCTE
WHERE location = 'Pune';


ALTER TABLE Companies
ADD COLUMN salary VARCHAR(50);

UPDATE Companies
SET salary = '50000-80000'
WHERE name = 'Innovatech Labs';

UPDATE Companies
SET salary = '60000-90000'
WHERE name = 'Green Energy Corp';

UPDATE Companies
SET salary = '70000-100000'
WHERE name = 'FinWise Solutions';

UPDATE Companies
SET salary = '55000-85000'
WHERE name = 'HealthPlus Pvt Ltd';

UPDATE Companies
SET salary = '45000-70000'
WHERE name = 'EduSmart Technologies';



select * from companies;

-- Add a new numeric column for minimum salary
ALTER TABLE Companies
ADD COLUMN min_salary INT;

-- Update values
UPDATE Companies
SET min_salary = 50000 WHERE name='Innovatech Labs';
UPDATE Companies
SET min_salary = 60000 WHERE name='Green Energy Corp';
UPDATE Companies
SET min_salary = 70000 WHERE name='FinWise Solutions';
UPDATE Companies
SET min_salary = 55000 WHERE name='HealthPlus Pvt Ltd';
UPDATE Companies
SET min_salary = 45000 WHERE name='EduSmart Technologies';

-- Now you can query
SELECT * FROM Companies
WHERE min_salary > 60000;
