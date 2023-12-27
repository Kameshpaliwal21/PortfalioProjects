select filename, status, to_char(process_date, 'DD-MM-YY HH:MI:SS AM'), response from USR_0_SBIGI_DOC_UPLOAD_LOG where APPLICATION_NAME ='EBAO' and TRUNC(PROCESS_DATE)=TRUNC(sysdate) order by PROCESS_DATE desc;
select * from USR_0_SBIGI_DOC_UPLOAD_LOG where STATUS='SUCCESS' and APPLICATION_NAME ='EBAO' and TRUNC(PROCESS_DATE)=TRUNC(sysdate) order by PROCESS_DATE desc;
select * from USR_0_SBIGI_DOC_UPLOAD_LOG where STATUS='SUCCESS' and APPLICATION_NAME ='AUTO_UPLOAD' and TRUNC(PROCESS_DATE)=TRUNC(sysdate) order by PROCESS_DATE desc;
select * from USR_0_SBIGI_DOC_UPLOAD_LOG where STATUS ='SUCCESS' and APPLICATION_NAME ='AUTO_UPLOADWOI' and TRUNC(PROCESS_DATE) = TRUNC(sysdate) order by PROCESS_DATE desc;
select * from USR_0_SBIGI_DOC_UPLOAD_LOG where STATUS='SUCCESS' AND application_name='Surveyor' AND trunc(process_date)=trunc(SYSDATE)order by PROCESS_DATE desc;;
SELECT * FROM usr_0_sbigi_doc_upload_log WHERE status='SUCCESS' AND application_name='HO_UPLOAD' AND trunc(process_date)=trunc(SYSDATE);

SELECT filename,count(1) FROM usr_0_sbigi_doc_upload_log WHERE status = 'SUCCESS' AND trunc(process_date)
= TRUNC(sysdate) group by FILENAME having COUNT(1) >10;

select distinct(BRANCH) from USR_0_SBIGI_DOC_UPLOAD_LOG where STATUS = 'SUCCESS' and APPLICATION_NAME = 'AUTO_UPLOAD'
and TRUNC(PROCESS_DATE)=trunc(sysdate);

select a.policy_no,a.product_id,b.product_code from GENERALSYSTEM.t_policy_general@OMINI_EBAO a, GENERALSYSTEM.t_product_general@OMINI_EBAO b
where policy_no in ('0000000015878613-01') and b.product_id = a.product_id ;

SELECT A.POLICY_NO,c.PRODUCT_CODE,A.Issue_date FROM GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO A inner JOIN  
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO C ON A.PRODUCT_ID = C.PRODUCT_ID   LEFT JOIN DDT_22 B ON A.POLICY_NO= B.FIELD_28
WHERE B.FIELD_28 IS NULL AND A.STATUS_ID ='120' AND TRUNC(A.ISSUE_DATE) >= TRUNC((SYSDATE-29)); 

SELECT * FROM usr_0_sbigi_doc_upload_log WHERE  application_name='EBAO' AND trunc(process_date)=trunc(SYSDATE -9) AND process_date
BETWEEN '15-03-21 17:00' AND '15-03-21 17:15';
SELECT personalname,username FROM pdbuser where useralive='Y'; WHERE username = '15239';
SELECT value FROM usr_0_documentdownloadlogtable WHERE uploadfilename='GPA_31_03_2021' and status = 'Failure';

select count(1),q.username,p.userindex from pdbconnection p join pdbuser q on p.userindex=q.userindex where p.usertype='S' group by q.username,p.userindex;
alter SESSION set NLS_DATE_FORMAT = 'DD-MM-YYYY HH24:MI' ;
select  * from pdbconnectionhistory
order by logintime desc;

