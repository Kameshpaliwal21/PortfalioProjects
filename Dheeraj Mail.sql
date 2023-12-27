----------Dheeraj Mail----------------

--for success--
select filename, to_char(process_date,'YY-MM-DD HH24:MI:SS') from usr_0_sbigi_doc_upload_log where 
filename like 'RenewalNotice%'
and status = 'SUCCESS'
and process_date  between
to_date('2023-04-27 22:00:00','YYYY-MM-DD HH24:MI:SS')
AND
to_date('2023-04-28 07:00:00','YYYY-MM-DD HH24:MI:SS');

select distinct documenttype from ddt_business;


--for total --
select filename, to_char(process_date,'YY-MM-DD HH24:MI:SS') from usr_0_sbigi_doc_upload_log where 
filename like 'RenewalNotice%'
--and status = 'SUCCESS'
and process_date  between
to_date('2023-04-27 22:00:00','YYYY-MM-DD HH24:MI:SS')
AND
to_date('2023-04-28 07:00:00','YYYY-MM-DD HH24:MI:SS');

select distinct documenttype from ddt_business;

-- for not available renewal for repushing--
select filename, to_char(process_date,'YY-MM-DD HH24:MI:SS') from usr_0_sbigi_doc_upload_log where 
filename like 'RenewalNotice%'
and status != 'SUCCESS'
and process_date  between
to_date('2023-04-27 22:00:00','YYYY-MM-DD HH24:MI:SS')
AND
to_date('2023-04-28 07:00:00','YYYY-MM-DD HH24:MI:SS');

select distinct documenttype from ddt_business;
