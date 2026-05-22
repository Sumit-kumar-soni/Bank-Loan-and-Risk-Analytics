-- Create the Database:

CREATE DATABASE Banking_risk_DB;
GO

-- Use the above Database

USE Banking_risk_DB;
GO

-- Creating the loan table

CREATE TABLE Loan_Default (
    ID INT PRIMARY KEY,
    year INT,
    loan_limit VARCHAR(50),
    Gender VARCHAR(50),
    approv_in_adv VARCHAR(50),
    loan_type VARCHAR(50),
    loan_purpose VARCHAR(50),
    Credit_Worthiness VARCHAR(50),
    open_credit VARCHAR(50),
    business_or_commercial VARCHAR(50),
    loan_amount INT,
    rate_of_interest FLOAT,
    Interest_rate_spread FLOAT,
    Upfront_charges FLOAT,
    term FLOAT,
    Neg_ammortization VARCHAR(50),
    interest_only VARCHAR(50),
    lump_sum_payment VARCHAR(50),
    property_value FLOAT,
    construction_type VARCHAR(50),
    occupancy_type VARCHAR(50),
    Secured_by VARCHAR(50),
    total_units VARCHAR(50),
    income FLOAT,
    credit_type VARCHAR(50),
    Credit_Score INT,
    co_applicant_credit_type VARCHAR(50),
    age VARCHAR(50),
    submission_of_application VARCHAR(50),
    LTV FLOAT,
    Region VARCHAR(50),
    Security_Type VARCHAR(50),
    Status INT,
    dtir1 FLOAT
);
GO

-- After the import flat file, Transform the data into perfect Table
-- Move the data from the raw staging table into our structured table
INSERT INTO Loan
SELECT * FROM Loan_Default_Raw;

-- Drop the import flat file table, i.e, Loan_Default_Raw
DROP TABLE Loan_Default_Raw;