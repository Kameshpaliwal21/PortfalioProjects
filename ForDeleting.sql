SELECT FILENAME,COUNT(1) FROM USR_0_SBIGI_DOC_UPLOAD_LOG WHERE TRUNC(PROCESS_DATE) = TRUNC(SYSDATE-1) GROUP BY FILENAME HAVING COUNT(1) >10; 


select itemindex  from ddt_business where quoteid in(
'0000000096784797'
);

delete from ddt_business where itemindex in (
'0000000089401962'
);


select itemindex from ddt_business where quoteid='0000000096784797' and documenttype='PAN Card'
order by itemindex desc;


select max(itemindex), quoteid from ddt_business where quoteid in ( 
'0000000094803943'
) and documenttype = 'Proposal Form' group by quoteid; 


delete from ddt_business where quoteid in ( 
'0000000094803943'
)and documenttype = 'Proposal Form'  

and itemindex not in ( 
'257924882'
); 

select quoteid from ddt_business where quoteid in ( 
'0000000094800084'
)and documenttype = 'Proposal Form';


