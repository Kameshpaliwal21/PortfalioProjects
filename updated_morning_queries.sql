---Morning steps to follow.
--step -1 :In outlook mail check if any alert is there regarding ODDU and Wrapper.(Go to 172.16.110.242/243 check wrapper running or not.)
--step -2 :In 243 server winscp,/print_vendor/processed/DMS_Processed check if feed file is generated or not.If, not mail to Vineel (3I SBI PA Team)
--step -3 :Go to console and check if Managed servers are in stuck thread (Warning Mode).
--step -4 :Go to server status and fill the server Space details.

-----Mails activity to be started.
----MAIL 1-----
------------Auto Upload fails  on previous day.............................
SELECT distinct(filename), application_name,status,response,process_date,branch FROM USR_0_SBIGI_DOC_UPLOAD_LOG WHERE FILENAME NOT IN 
  (SELECT FILENAME FROM USR_0_SBIGI_DOC_UPLOAD_LOG 
    WHERE STATUS = 'SUCCESS' 
    And Trunc(Process_Date) = (Trunc(Sysdate -1)) 
    AND (APPLICATION_NAME='AUTO_UPLOAD' OR APPLICATION_NAME= 'AUTO_UPLOADWOI') )
AND TRUNC(PROCESS_DATE) = (TRUNC(SYSDATE -1)) AND STATUS = 'FAILURE' 
And Response Not Like ('%not found as file or resource%')
AND (APPLICATION_NAME='AUTO_UPLOAD' Or Application_Name= 'AUTO_UPLOADWOI')
Order By Branch;

------------Auto Upload success on previous 7 day.............................
SELECT DISTINCT(FILENAME),TO_CHAR(PROCESS_DATE,'DD-MM-YY')AS PROCESS_DATE,BRANCH FROM USR_0_SBIGI_DOC_UPLOAD_LOG WHERE STATUS = 'SUCCESS'
And Length(Folder_Name)='16' And Filename Like '%_1' And (Application_Name='AUTO_UPLOAD' Or Application_Name='AUTO_UPLOADWOI' or
APPLICATION_NAME='HO_UPLOAD')And Trunc(Process_Date)>= (TRUNC(SYSDATE -7));

----MAIL 2------
-----------------------new zero kb query----------------------------

SELECT a.filename,
c.product_code
FROM USR_0_SBIGI_DOC_UPLOAD_LOG a,
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO b,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO C
where b.PRODUCT_ID = C.PRODUCT_ID
and a.folder_name=b.quote_no
and a.STATUS    ='FAILURE'
AND a.RESPONSE LIKE '%0kb%'
AND A.APPLICATION_NAME    ='EBAO'
AND TRUNC(a.Process_Date) = (TRUNC(SYSDATE))
MINUS (SELECT a.filename,
c.product_code
FROM USR_0_SBIGI_DOC_UPLOAD_LOG a,
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO b,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO C
where b.PRODUCT_ID = C.PRODUCT_ID
AND A.FOLDER_NAME=B.QUOTE_NO AND A.STATUS='SUCCESS'
AND A.APPLICATION_NAME='EBAO');


---MAIL 3 ------
------------------new Failed documents List query------------------------------------------------------------------------------------------
Select distinct(filename) From Usr_0_Sbigi_Doc_Upload_Log  Where Status = 'FAILURE' 
And (Filename Like 'Quote%' Or Filename Like 'Endo%' Or Filename Like 'Policy%')
and (RESPONSE like '%PDF%') 
AND RESPONSE NOT LIKE '%0kb%' AND APPLICATION_NAME='EBAO'
And Trunc(Process_Date) = (Trunc(Sysdate -1)) minus (select filename from usr_0_sbigi_doc_upload_log where status='SUCCESS'
AND application_name='EBAO')
ORDER BY filename;
---NOTE : For production report Failure count just check the result of this query and Note the count

----MAIL 4 ---------------GPA MAIL-------------------
----MAIl 5 --------
------------new Recon Data not available query ------------------------------------------
SELECT A.POLICY_NO,C.PRODUCT_CODE FROM GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO A inner JOIN  
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO C ON A.PRODUCT_ID = C.PRODUCT_ID   LEFT JOIN DDT_22 B ON A.POLICY_NO= B.FIELD_28
where B.FIELD_28 is null and a.STATUS_ID ='120' and TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1));


----MAIL 6 -----------
----Production Report -------
-----------------Success documents count------------------------------------------------------------------------------------
SELECT COUNT(DISTINCT(FILENAME)) FROM USR_0_SBIGI_DOC_UPLOAD_LOG WHERE STATUS = 'SUCCESS' AND TRUNC(PROCESS_DATE) = (TRUNC(SYSDATE - 1)); 
---Auto Upload count (Execute through putty)-----------------------------
---find /AutoUpload1/Branch_* -name "*.pdf" >> /u01/Auto_27092023_1.csv
-- find /AutoUpload1/branch_* -name "*.pdf" >> /u01/Auto_27092023_2.csv
-----------------Failed documents count-------------------------------------------------------------------------------------------------------------------
-----------Refer failed document list count--------
----------SAN EBAO COUNT (PDF  and XML with same name) in 243 server WINSCP.
--------HO_Upload Failure Count Automail at 8:45 - 8:50 If found any records send mail to CHETAN SHENAI------
-------Check last Processed Count of UAT and Earth Environments in WINSCP /SAN/ebao/office.

-----Mail 6 ------
---SME all data query--
SELECT distinct(a.policy_no) FROM GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO A inner JOIN  
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO C on a.PRODUCT_ID = C.PRODUCT_ID   left join DDT_22 B on a.POLICY_NO= B.FIELD_28
where a.STATUS_ID ='120' and a.PRODUCT_ID = '900001060' and TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1));

--SME not available data query--
SELECT distinct(a.policy_no) FROM GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO A inner JOIN  
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO C ON A.PRODUCT_ID = C.PRODUCT_ID   LEFT JOIN DDT_22 B ON A.POLICY_NO= B.FIELD_28
where B.FIELD_28 is null and a.STATUS_ID ='120' and A.product_id = '900001060' and TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1));


SELECT DISTINCT(A.POLICY_NO), 
CASE A.PRODUCT_ID 
  WHEN 900001060 THEN 'SME'
  WHEN 900002241 THEN 'BGPR' 
  WHEN 900002041 THEN 'KSB'
  ELSE 'NA'
END AS APP_NAME
FROM GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO A 
INNER JOIN  GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO C ON A.PRODUCT_ID = C.PRODUCT_ID   
LEFT JOIN DDT_22 B ON A.POLICY_NO= B.FIELD_28
WHERE B.FIELD_28 IS NULL AND A.STATUS_ID ='120' 
AND TRUNC(A.ISSUE_DATE) = TRUNC((SYSDATE-1)) 
AND A.PRODUCT_ID IN ( '900001060', '900002241', '900002041');


------Renewal Notice Query--------

select filename, to_char(process_date,'YY-MM-DD HH24:MI:SS') from usr_0_sbigi_doc_upload_log where
filename like 'RenewalNotice%'
and status = 'SUCCESS'
and process_date  between
to_date('2023-05-21 22:00:00','YYYY-MM-DD HH24:MI:SS')
AND
to_date('2023-05-22 07:00:00','YYYY-MM-DD HH24:MI:SS');


