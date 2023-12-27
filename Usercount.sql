
------user count------
select count(1), q.username, p.userindex from pdbconnection p join pdbuser q 
on p.userindex=q.userindex where p.usertype='S' group by q.username, p.userindex;

select to_char(logintime, 'DD_MM_YYYY HH24:MI:SS'), noofconcurrentusers from pdbconnectionhistory 
where TRUNC(logintime)=TRUNC(sysdate)
order by logintime desc;

select * from pdbconnectionhistory order by logintime desc;

select * from usr_0_sbigi_doc_upload_log where filename = '100377306_1';
select * from pdbuser where username in ('25114', '25403', '25280', '25302', '25068', '25298', '25276');

select min(documentsize),max(documentsize)
 from pdbdocument where name in (
SELECT filename FROM usr_0_sbigi_doc_upload_log WHERE status='SUCCESS' AND application_name='TCS') order by documentsize desc;

select filename, status, to_char(process_date, 'DD-MM-YY HH:MI:SS AM'), response from USR_0_SBIGI_DOC_UPLOAD_LOG where APPLICATION_NAME ='EBAO' and TRUNC(PROCESS_DATE)=TRUNC(sysdate) order by PROCESS_DATE desc;