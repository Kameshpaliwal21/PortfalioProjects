select folder_name, filename, application_name, status, response, to_char(process_date, 'DD-MM-YYYY HH24:MI:SS') as TimeStamp from usr_0_sbigi_doc_upload_log where process_date between '25-JUL-2023' and '27-JUL-2023' and application_name = 'HO_UPLOAD' and  response like '%PDF File is Corrupted and Size is of 0kb%' and status = 'FAILURE' order by process_date desc;


select folder_name, filename, application_name, status, response, to_char(process_date, 'DD-MM-YYYY HH24:MI:SS') as TimeStamp from usr_0_sbigi_doc_upload_log where filename in (
'0000000095037357_6'
);