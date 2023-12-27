select count(userindex), username from pdbuser A
inner join pdbconnection B
on A.userindex  = b.userindex
group by username;

select * from usr_0_sbigi_doc_upload_log where filename = '84966639_9';

select  count(b.randomnumber), a.username, a.userindex,b.usertype from pdbuser A
inner join pdbconnection B
on a.userindex = b.userindex
group by a.username, a.userindex, b.usertype;

select * from pdbconnection where userindex  = '24';
select * from pdbuser where userindex = '24';
on A.userindex  = b.userindex;


select * from pdbuser where commnt  = 'ADMINISTRATOR';


select filename, to_char(process_date,'YY-MM-DD HH24:MI:SS') from usr_0_sbigi_doc_upload_log where 
filename like 'RenewalNotice%'
and status = 'SUCCESS'
and process_date  between
to_date('2023-01-23 22:00:00','YYYY-MM-DD HH24:MI:SS')
AND
to_date('2023-01-24 07:00:00','YYYY-MM-DD HH24:MI:SS');

select distinct documenttype from ddt_business;


select filename, to_char(process_date,'YY-MM-DD HH24:MI:SS') from usr_0_sbigi_doc_upload_log where
filename like 'RenewalNotice%'
and status != 'SUCCESS'
and process_date  between
to_date('2023-01-27 22:00:00','YYYY-MM-DD HH24:MI:SS')
AND
to_date('2023-01-28 07:00:00','YYYY-MM-DD HH24:MI:SS');



