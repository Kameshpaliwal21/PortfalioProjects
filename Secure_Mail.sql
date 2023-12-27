select distinct(filename) as QuoteId, status as Status, application_name, branch, response as Response, to_char(process_date, 'DD-MM-YY HH:MI:SS AM') as Timestamp 
from usr_0_sbigi_doc_upload_log where filename in (
'0000000100150816_1',
'0000000100154018_1',
'0000000100173964_1',
'0000000095899325_1',
'0000000100153438_1',
'0000000100162552_1',
'0000000100168553_1',
'0000000095888268_1',
'0000000100150912_1',
'0000000095998272_1',
'0000000100173960_1'
);--and status ='SUCCESS';
--order by  filename, timestamp desc


select distinct(filename) as QuoteId, status as Status, response as Response, to_char(process_date, 'DD-MM-YY HH:MI:SS AM') as Timestamp from usr_0_sbigi_doc_upload_log where filename in (
'0000000096380616_1'
) and status ='SUCCESS';






select filename as QuoteId, status as Status, response as Response, to_char(process_date, 'DD-MM-YY HH:MI:SS AM') as Timestamp , rank() over(partition by usr_0_sbigi_doc_upload_log.filename order by process_date) 
from usr_0_sbigi_doc_upload_log where filename in (SELECT QUOTEID from my_recon_tbl);


select * from ddt_business where policyid in (
'0000000024258832-02',
'0000000036108340',
'0000000036158909',
'0000000036159083',
'0000000036281222',
'0000000036310838',
'0000000026111600-02');






select * from usr_0_sbigi_doc_upload_log where filename in (
'Policy_0000000034524377',
'Policy_0000000034523857'

);


select c.name, to_char(c.createddatetime,'DD_MM_YYY HH24:MI:SS') from my_recon_tbl1 a 
inner join ddt_business b on a.policyid = b.policyid
inner join pdbdocument c on b.itemindex = c.documentindex
where b.documenttype = 'Policy';