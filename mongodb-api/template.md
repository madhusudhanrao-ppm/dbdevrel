# Working with JSON Relational Duality in Oracle AI Database and Google Colab Notebooks. 
 
## Introduction

TBD.

<!-- ![JD](images/json.jpeg) -->
      
Estimated Time: 5 mins.  
 
### Objectives

TBD.  
   
### Prerequisites

This lab assumes you have:

* Oracle cloud account and privileges to create & manage Oracle Autonomous AI Database
* Oracle Autonomous AI database wallet has been downloaded into local filesystem. 
* Source code has been downloaded.
 
### Source code download
 
```
<copy>
-- Clone the GitHub Repo
git clone https://github.com/madhusudhanrao-ppm/dbdevrel.git

-- Colab Notebook on GitHub
https://github.com/madhusudhanrao-ppm/dbdevrel/blob/main/source-codes/colab-code/json-relational-duality.ipynb

</copy>
``` 
 
## Task 1: Enable ACL

1. A

    <!-- ![JD](images/enable-acl1.png) -->

## Task 8: Close Connection

2. Close the database connection:

    ```
    <copy>
    # Close database connection
    if conn:
        try:
            conn.close()
            print("✓ Database connection closed")
        except Exception as e:
            print(f"✗ Error closing connection: {e}")
    </copy>
    ```

## Learn More & Downloads
 
* [JSON Relational Duality Views Documentation](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/json-relational-duality-views.html) 
* [Autonomous AI Database for Developers](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/autonomous-database-for-developers.html) 
* [Source Code - JSON Relational Duality Notebook](https://github.com/madhusudhanrao-ppm/dbdevrel/blob/main/source-codes/colab-code/json-relational-duality.ipynb)
* [Download All Source Code](https://github.com/madhusudhanrao-ppm/dbdevrel/tree/main/source-codes)
* [Direct ORM Deployment Link](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://objectstorage.us-phoenix-1.oraclecloud.com/p/jtfUsV33KtLR937hWybAgrq8qtuQQuAaIw1K_VBThhlUF6Z1HYF0Ai50sQlp06bQ/n/oradbclouducm/b/medical_transcripts/o/Terraform/oracle-lakehouse-devedition-stack.zip)
* [Autonomous AI Database for Developers Billing Information](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/autonomous-database-for-developers-billing.html)

## Acknowledgements

* **Author** - Madhusudhan Rao, Principal Product Manager, Oracle Database DevRel 
* **Last Updated By/Date** - December 16, 2025
