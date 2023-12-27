select * from usr_0_sbigi_doc_upload_log where response  like '%0kb%' and application_name = 'HO_UPLOAD'
And Trunc(Process_Date) = (Trunc(Sysdate-4));

select * from usr_0_sbigi_doc_upload_log where response like '%0kb%' and application_name = 'HO_UPLOAD'
order by process_date desc;
