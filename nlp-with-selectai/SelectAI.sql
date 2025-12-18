-- https://www.linkedin.com/pulse/how-use-oracle-select-ai-cohere-openai-generate-sqls-from-rao-zabjf/

-- Login as ADMIN user and run the following commands to grant necessary privileges to DEMOUSER

GRANT execute ON DBMS_CLOUD TO DEMOUSER;
GRANT execute ON DBMS_CLOUD_AI TO DEMOUSER;
COMMIT;

-- Get Cohere Key with GitHub Login
-- ZOVaFifg0RioKsQ1632GpKwZEmJijY1ILLFWXMC6

BEGIN  
    DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
         host => 'api.cohere.ai',
         ace  => xs$ace_type(privilege_list => xs$name_list('http'),
                             principal_name => 'DEMOUSER',
                             principal_type => xs_acl.ptype_db)
   );
END;
/
COMMIT;

select * from SH.CUSTOMERS;

-- LOGIN as DEMOUSER and run the following command to create a copy of the sample table

CREATE TABLE DEMOUSER.CUSTOMERS AS
SELECT * FROM SH.CUSTOMERS;

-- LOGIN as DEMOUSER and run the following commands to create AI Profile and Credential

BEGIN
    DBMS_CLOUD.create_credential('COHERE_CRED', 'COHERE', 'ZOVaFifg0RioKsQ1632GpKwZEmJijY1ILLFWXMC6');
END;

-- Verify the created AI Profile and Credential

SELECT * FROM USER_CREDENTIALS;

-- Create AI Profile for Cohere

BEGIN
  DBMS_CLOUD_AI.create_profile(
      'COHERE',
      '{"provider": "COHERE",
        "credential_name": "COHERE_CRED",
        "object_list": [{"owner": "DEMOUSER", "name": "CUSTOMERS"}]
       }');
end;
/  

-- Set the AI Profile to COHERE

EXEC DBMS_CLOUD_AI.set_profile('COHERE');

-- Generate SQL Query using SelectAI

SELECT DBMS_CLOUD_AI.GENERATE(prompt       => 'what is the total number of customers',
                              profile_name => 'COHERE',
                              action       => 'showsql') as query
FROM dual;

-- SELECT COUNT(*) AS total_customers FROM "DEMOUSER"."CUSTOMERS" cWHERE c."CUST_VALID" = 'Y'

SELECT DBMS_CLOUD_AI.GENERATE(prompt       => 'what is the total number of customers',
                              profile_name => 'COHERE',
                              action       => 'narrate') as query
FROM dual;

-- The total number of customers is obtained by counting all records in the CUSTOMERS 
-- table where the CUST_VALID column is marked as 'Y', indicating valid customers.

SELECT DBMS_CLOUD_AI.GENERATE(prompt       => 'How many customers are married?',
                              profile_name => 'COHERE',
                              action       => 'narrate') as query
FROM dual;

SELECT DBMS_CLOUD_AI.GENERATE(prompt       => 'How many customers are married?',
                              profile_name => 'COHERE',
                              action       => 'showsql') as showsql
FROM dual;

SELECT DBMS_CLOUD_AI.GENERATE(prompt       => 'How many customers are married?',
                              profile_name => 'COHERE',
                              action       => 'showsql') as showsql
FROM dual;  

-- Expected Output:

SELECT COUNT(*) AS married_customers
FROM "DEMOUSER"."CUSTOMERS" c
WHERE UPPER(c."CUST_MARITAL_STATUS") = 'MARRIED';