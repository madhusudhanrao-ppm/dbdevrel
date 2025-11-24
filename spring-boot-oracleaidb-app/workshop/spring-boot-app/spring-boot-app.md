# Create Spring Boot Application with Oracle Autonomous AI Database 
 
## Introduction

Autonomous AI Database for Developers provides you with low cost instances for developers and others to build and test new Autonomous AI Database applications.
 
Autonomous AI Database for Developers are low-cost, fixed shape databases intended for development and testing uses cases, and are not recommended for production use cases. When you need more compute or storage resources or you want to take advantage of additional Autonomous AI Database features, you can upgrade your Autonomous AI Database for Developers instance to a full paid service instance.

With Oracle Autonomous AI Database you can work on many tools such as 

* Oracle APEX
* Database Actions
* Graph Studio
* Oracle Machine Learning user interface
* Data Transforms
* Web Access (ORDS)
* MongoDB API 
* Data Lake Accelerator  
* SODA Drivers

Estimated Time: 2 to 5 minutes (max).  
 
### Objectives

In this short sprint, you will:
 
* Create an Oracle Autonomous AI Database for Developers using Oracle Resource Manager Stack.
* View Oracle Autonomous AI Database and Developer Tools.
* (Optional) Create Oracle Autonomous AI Database for Developers using Oracle Terraform Command Line Interface CLI.
* (Optional) Download Database Wallet, Note Connection Details and Create Database User
* Cleanup the resources created.

    [Demo video on Create Oracle Autonomous AI Database](youtube:V2PETW_F7XI:large) 

### Prerequisites

This lab assumes you have:

* Oracle cloud account and privileges to create & manage Oracle Autonomous AI Database
* Option 1: [Direct ORM deployment link](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://objectstorage.us-phoenix-1.oraclecloud.com/p/jtfUsV33KtLR937hWybAgrq8qtuQQuAaIw1K_VBThhlUF6Z1HYF0Ai50sQlp06bQ/n/oradbclouducm/b/medical_transcripts/o/Terraform/oracle-lakehouse-devedition-stack.zip)
* Option 2: Download the source code from the following GitHub location or use this [.zip file direct download link](https://objectstorage.us-phoenix-1.oraclecloud.com/p/jtfUsV33KtLR937hWybAgrq8qtuQQuAaIw1K_VBThhlUF6Z1HYF0Ai50sQlp06bQ/n/oradbclouducm/b/medical_transcripts/o/Terraform/oracle-lakehouse-devedition-stack.zip)

    ```
    -- Clone the GitHub Repo
    git clone https://github.com/madhusudhanrao-ppm/dbdevrel.git
 
    -- GitHub Repo
    https://github.com/madhusudhanrao-ppm/dbdevrel/tree/main/create-oracleaidb26ai-devrel
    ```

The **source code** folder has two subfolders 

1. The folder **oracle-lakehouse-devedition-cli** has source code for Terraform command line interface, 
2. The folder **oracle-lakehouse-devedition-stack** has source code Oracle Resource Manager zip file. you can also directly upload **oracle-lakehouse-devedition-stack.zip** file which has preconfigured values.

 
## Entity
  
1. Create an Autonomous AI Database using the Resource Manager Stack.

    > Please Note: Billing for Autonomous AI Database for Developers databases is hourly per instance. please see more info section

    ![Navigation](images/01-navigation.png )
   
## Controller

1.   From the left navigation, select **Oracle AI Database** and **Oracle Autonomous AI Database**
    
    ![ADB view](images/11-adb2.png )
        
    ```
    % brew update && brew install oci-cli

    -- Verify installation
    % oci -v
    3.62.1
    ```
  
    Refer [OCI CLI Terraform for Database Creation](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/database_autonomous_database)
           
5. Start with Terraform initialisation

 
    ```
    terraform init
    ``` 

    ![Plan](images/17-tfplan.png )

    ```
    terraform plan -out=myplan.tfplan
    ```

    ![Apply](images/18-tfapply.png )

    ```
    terraform apply "myplan.tfplan"
    ```

    ![Logs](images/19-tfviewlogs.png )

    The script has completed resource creation in approximately 3 minutes. Once you have completed using the Oracle Autonomous AI Database 26ai environment. You can destroy the environment
  
    > Please note: This approach will be slightly slower than running it through the Oracle resource manager stack zip file upload. as you are connecting from your local laptop to OCI using using terraform command line interface.
  
## (Optional) Download database wallet, Note connection details and Create database user

1. From the top right navigation menu click on **Database Connection** button

    ![DB Conn](images/db-conn.png  )

2. Download wallet

    ![Wallet](images/download-wallet.png  ) 

    Provide wallet password and save the wallet.

3. Copy and save TNS Name, which would be of the following format, where database name and region will change. we will need this details for database connection. 

    ```
    devdbhs556l_high = (description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.us-phoenix-1.oraclecloud.com))(connect_data=(service_name=wkrfs4xeqva1jcu_devdbhs556l_high.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))
    ```

    <!-- ```
    devdbhs7g6l_high = (description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.us-phoenix-1.oraclecloud.com))(connect_data=(service_name=wkrfs4xeqva1jcu_devdbhs7g6l_high.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))

    DEMOUSER/Welcome123456#
    ``` -->

4. Create Database user by clicking on **Database Actions** Menu and **Database Users**

    ![Create User](images/create-user.png  )

    Click on create user button 

    ![Create User2](images/create-user2.png  )

    Provide user name and password and select user options

    ![Destroy](images/user-options.png  )
  
5.  Update **Granted Roles** as required by your application and **Apply Changes** . 
  
    ![Destroy](images/role-grants.png  )

## Cleanup resources created

1. Destroy the resources created if you have used using Oracle Stack by clicking on the  **Destroy** button.
 
    ![Destroy](images/15-destroy.png  )

    View Confirmation message logs

    ![Confirm](images/16-destroyconfirm.png )

2. If you have used Terraform CLI then run 

    ```
    terraform destroy
    ```

    ![Destroy](images/20-destroy.png ) 
 
    -- Enter yes for confirmation 
 

## (Optional) Try Live SQL
 
<livesql-button src="https://livesql.oracle.com/next/worksheet?tutorial=json-duality-views-quick-start-D3wdHG&share_key=jCX1875rL3">

<b>Live SQL Execution:</b> Sign-In Required</br>
<b>Duration:</b> 2 minutes 
   
## Learn More & Downloads
 
* [Autonomous AI Database for Developers](https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/autonomous-database-for-developers.html) 
* [Download Source code](https://github.com/madhusudhanrao-ppm/dbdevrel/tree/main/create-oracleaidb26ai-devrel/sourcecodes)
* [Direct ORM deployment link](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://objectstorage.us-phoenix-1.oraclecloud.com/p/jtfUsV33KtLR937hWybAgrq8qtuQQuAaIw1K_VBThhlUF6Z1HYF0Ai50sQlp06bQ/n/oradbclouducm/b/medical_transcripts/o/Terraform/oracle-lakehouse-devedition-stack.zip)
* [See Autonomous AI Database for Developers Billing and Tenancy Service Limit for details] (https://docs.oracle.com/en-us/iaas/autonomous-database-serverless/doc/autonomous-database-for-developers-billing.html)

## Acknowledgements

* **Author** - Madhusudhan Rao, Principal Product Manager, Oracle Database DevRel 
* **Last Updated By/Date** - 5th Nov, 2025
