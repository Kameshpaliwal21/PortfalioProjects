---------------------------------------to check the policies available in ddt-------------------------------------------------------
select * from pdbuser where useralive = 'Y'
order by userindex desc;

select  * from USR_0_SBIGI_SUPPORTING_DOC;

select * from issite;

select distinct * from ddt_business where lobname = 'PMCAR02'
order by itemindex desc;
(
'0000000034151919',
'0000000034170891',
'0000000034170922'
);
select name, createddatetime from pdbdocument where name in (SELECT quoteid from POLICY_QUOTE_RECONCILIATION);


--------------------------------------------Lance first created date for Quotes---------------------------------------------------------------
select name, createddatetime, rank() over(partition by pdbdocument.name order by createddatetime) from pdbdocument where name in 
(SELECT quoteid from POLICY_QUOTE_RECONCILIATION);
---------------------------------------------------------------------------------------------------------------------------------------------------

select distinct(policyId), quoteid, documenttype from ddt_business where policyid  in (
'0000000031238813',
'0000000031563179',
'0000000031326453'
);
--)and documenttype ='PAN Card';
select filename, to_char(process_date, 'DD-MM-YY HH:MI:SS AM') from USR_0_SBIGI_DOC_UPLOAD_LOG where STATUS='SUCCESS' and APPLICATION_NAME ='CKYC' and TRUNC(PROCESS_DATE)=TRUNC(sysdate) order by PROCESS_DATE desc;

select distinct(documenttype) from ddt_business where documenttype like 'c%';

select * from USR_0_SBIGI_DOC_UPLOAD_LOG where filename = '98469490_1';
select * from pdbdocument where policyid = 'POPM2W00101417297';
select count(1),q.username,p.userindex from pdbconnection p join pdbuser q on p.userindex=q.userindex where p.usertype='S' group by q.username,p.userindex;

SELECT FILENAME,COUNT(1) FROM USR_0_SBIGI_DOC_UPLOAD_LOG WHERE TRUNC(PROCESS_DATE)
>= TRUNC(SYSDATE-2) GROUP BY FILENAME HAVING COUNT(1) >10;

select filename, to_char(process_date, 'DD-MM-YY HH:MI:SS AM') from USR_0_SBIGI_DOC_UPLOAD_LOG where STATUS='SUCCESS' and APPLICATION_NAME ='EBAO' and TRUNC(PROCESS_DATE)=TRUNC(sysdate) order by PROCESS_DATE desc;

select  distinct(filename),folder_name as Quote_No,'Y' as PF_Availability ,'N' as Other_Doc_Availability, to_char(process_date, 'DD-MM-YYYY HH24:MI:SS') as Timestamp , status, response from usr_0_sbigi_doc_upload_log where filename in (
);

select * from ddt_business where lobname = 'GHLI';

select * from pdbdomainuser;-- where UPPER(USERNAME) = 'KAMESH';

select XMLCONTENT from pdbldapxml;-- where XMLNAME = '?' and domainname= '?';

select * from ddt_business where claimid = 'MVO404937';

select * from pdbdocument;
select name, to_char(accesseddatetime, 'DD-MM-YYYY HH24:MI:SS') from pdbdocument where name = 'Policy_0000000036583315';
select * from usr_0_sbigi_doc_upload_log where filename in (
'0000000095994533_9');--and status = 'SUCCESS';-- order by process_date desc;

select * from ddt_business where policyid in ('0000000036726268',
'0000000036725432',
'0000000036725187',
'0000000036725130',
'0000000036725104',
'0000000036725077',
'0000000036726474');

select * from USR_0_SBIGI_DOC_UPLOAD_LOG where branch = 'KOZIKODE' and APPLICATION_NAME ='AUTO_UPLOAD' and filename = '0000000098329974_6' order by PROCESS_DATE;

-------------------------------------------to find out the renewal notice fron samson of given 7 digit policy---------------------
select * from sbi_gen_quotes(all) where quoteid = '0000000008246794';

select * from pdbuser where username = 'manoj.chamoli@gbkcfashion.com';

select * from sbi_gen_policy(all) where policyid in (
'0000000003106437'
);

select * from ddt_business where lobname = 'TBHI002' order by itemindex desc;

select * from sbi_gen_policy(all) where quoteid = '0000000008501574';

select * from pdbdocument;
select claimid from ddt_business where claimid in (
'MVO1934090'
);





select QUOTEID from DDT_BUSINESS
where DOCUMENTTYPE='QuoteRenewal' and QUOTEID in(
select Quote_no from GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO WHERE last_policy_id in (select policy_id from GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO WHERE Policy_no in 
('POOPDH00100193906',
'0000000028996457',
'0000000086366246',
'0000000026680804',
'0000000020294911',
'0000000023252051')));
--------------------------------------------------to check the pdbuser is alive or not----------------------------------------------------

select * from pdbuser where username in ('95503');


select distinct(documenttype) from ddt_business;

select * from usr_0_sbigi_doc_upload_log;

select * from usr_0_sbigi_doc_upload_log where application_name = 'AutoUpload1' and branch = 'Bangalore' ;

-----------------------------------------------------secureb team mail------------------------------------------
select filename, response, status, to_char(process_date, 'DD-MM-YY HH:MI:SS AM') from usr_0_sbigi_doc_upload_log where filename in (
'93323611_1'
);-- and status= 'FAILURE';

select filename, response, status, to_char(process_date, 'DD-MM-YYYY HH:MI:SS AM') from usr_0_sbigi_doc_upload_log where application_name = 'EBAO' order by process_date desc;

-------------------------------------------------------to check the PF in usr--------------------------------------------------------------------
select * from usr_0_sbigi_doc_upload_log where filename in (
'95976626_1'
) and status = 'SUCCESS';

select filename, status, to_char(process_date, 'DD-MM-YY HH:MI:SS AM'), response from USR_0_SBIGI_DOC_UPLOAD_LOG where filename in (
'95980212_1'
);


select distinct(quoteid) from ddt_business where policyid in(
'0000000034863287'
);-- and documenttype = 'Policy';

select * from ddt_business where documenttype = 'EndorsementSchedule';

select distinct(documenttype) from ddt_business where documenttype like 'e%';

------------------------------to check the product code of CCM L2 Group for Not Available Policies-----------------------------------------
select a.policy_no, b.product_code from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.policy_no in (
'0000000034123393'
);


-------------------------------------------------'0000000005460939',
'0000000136737076',
'0000000004447737',
'0000000003555478'--------------OldBulkUtility-----------------------------
select * from sbi_gen_policy_s where policyid in (

);

------------------CCM L2 Product Code---------------------------
/*
MLT2W01
HHDC001
PMCAR01
PMCAR02
HOMLT01
LOAN001
PACC001
GSB001
ASAN001
PRMSV01
CVE001
SHIP001
CRP001
MOP0002
MARSV01
SMEP01
BURG001
FIRSP02
MOP001
MSTOP01
CKP001
SURE001
GSA001
CMVGC01
TBHI001
HGLI0001
SUHE001
BGRP01
VBT001
KSB001
BGRP02
HGIND01
PM2W001
PM2W002
MBD0001
Glass01
SIGN001
FGI0001
PLI0001
PLA0001
BURG001
AR00001
BAG001
CAR0001
PEEI0001
WC00001
MONEY01

*/



select * from pdbdocument where name in (
'0000000073202800_1',
'0000000075738429_1',
'QGSA001000000004587_1',
'0000000085559320_1',
'0000000082383737_1',
'0000000075887145_1',
'0000000080248198_1',
'0000000073774713_1',
'0000000080378255_1',
'QOPDH001000001072047_1',
'0000000085425345_1',
'0000000084214677_1',
'0000000088641488_1'
); 

select distinct(policyid) from ddt_business where policyid in (
'0000000032249150',
'0000000032249139',
'0000000032249149',
'0000000032249137',
'0000000032249142',
'0000000032249142'


) ;

select * from usr_0_sbigi_doc_upload_log where filename = '0000000098420395_1',
'0000000098304493_1',
'0000000099238455_1',
'0000000099233148_1',
'0000000095340502_1',
'0000000099253855_1',
'0000000097839524_1',
'0000000098412765_1',
'0000000098411934_1',
'0000000098027449_1',
'0000000098715555_1',
'0000000099224459_1',
'0000000099226887_1',
'0000000099250888_1',
'0000000099227360_1',
'0000000097818828_1',
'0000000099229256_1',
'0000000095379586_1',
'0000000099080260_1',
'0000000099234256_1',
'0000000099152623_1',
'0000000099250107_1',
'0000000099231862_1',
'0000000099238358_1',
'0000000097778203_1',
'0000000098734436_1',
'0000000099138414_1',
'0000000098940102_1',
'0000000098918399_1',
'0000000099237651_1',
'0000000099234395_1',
'0000000099246975_1',
'0000000095172194_1',
'0000000098400022_1',
'0000000099256163_1',
'0000000099241911_1',
'0000000099236501_1',
'0000000098576873_1',
'0000000098928770_1',
'0000000098944338_1',
'0000000099238691_1',
'0000000099242998_1',
'0000000097933225_1',
'0000000098539582_1',
'0000000099226488_1',
'0000000099226426_1',
'0000000099251514_1',
'0000000099254037_1',
'0000000099242427_1',
'0000000099254458_1',
'0000000099251444_1',
'0000000099227052_1',
'0000000094640911_1',
'0000000099229218_1',
'0000000099254014_1',
'0000000099253664_1',
'0000000099253321_1'
) and status = 'SUCCESS';

select distinct(quoteid),DOCUMENTTYPE from ddt_business where quoteid in ( '0000000083516739',
'0000000082498660',
'0000000082444002',
'0000000083491238',
'0000000083151592',
'0000000082696800',
'0000000082703612',
'0000000082703279',
'0000000082699688',
'0000000082713397',
'0000000083138688',
'0000000083063209',
'0000000083334407',
'0000000083040306',
'0000000082331582',
'0000000081381641',
'0000000082445148',
'0000000082715773',
'0000000083191102',
'0000000083137723',
'0000000083505514',
'0000000083433936',
'0000000083071281',
'0000000083061535',
'0000000082495163',
'0000000083491285',
'0000000081687749',
'0000000080953808',
'0000000080938451',
'0000000085988957',
'0000000081999174',
'0000000081646123',
'0000000081748703',
'0000000082058437',
'0000000082095508',
'0000000082639959',
'0000000082336363',
'0000000082415333',
'0000000082412406',
'0000000082395323',
'0000000082591304',
'0000000082384907',
'0000000082385375',
'0000000081241585',
'0000000081363768',
'0000000083149807',
'0000000083136562',
'0000000085281358',
'0000000083266776',
'0000000082488650',
'0000000082952248',
'0000000082484336',
'0000000082826893',
'0000000082441749',
'0000000083135967',
'0000000083110277',
'0000000083148408',
'0000000083034337',
'0000000083212524',
'0000000083221900',
'0000000083223292',
'0000000082953310',
'0000000083109251',
'0000000083225682',
'0000000083207727',
'0000000083434579',
'0000000083129999',
'0000000083324717',
'0000000083194533',
'0000000083269926',
'0000000083382133',
'0000000086025431',
'0000000083494969',
'0000000083325620',
'0000000083504770',
'0000000083505043',
'0000000082284046',
'0000000082322147',
'0000000083517735',
'0000000083504204' ) and documenttype = 'QuoteRenewal';


select * from usr_0_sbigi_dc_mapping_table where dc_attr_name like 'D%';




select * from usr_0_sbigi_doc_upload_log where application_name = 'HO_UPLOAD'
order by process_date desc;


select * from pdbuser where username in ('26445'); 


select * from  ddt_business;

select * from usersecurity;

select * from pdbconnection;





select c.name, to_char(c.createddatetime,'DD_MM_YYY HH24:MI:SS') from my_recon_tbl1 a 
inner join ddt_business b on a.quoteid = b.quoteid
inner join pdbdocument c on b.itemindex = c.documentindex
where b.documenttype = 'Proposal Form';

select * from my_recon_tbl1 a 
inner join ddt_business b on a.quoteid = b.quoteid
inner join pdbdocument c on b.itemindex = c.documentindex
where b.documenttype = 'Proposal Form';



select filename as "Quote No",folder_name, status as Status,response as Response, branch, to_char(process_date,'DD_MM_YYY HH24:MI:SS') as TimSstamp from usr_0_sbigi_doc_upload_log where filename in (
'94653809_1'
);--and status = 'SUCCESS';


select status,response from usr_0_sbigi_doc_upload_log where filename in (
'94653809_1'
);

select c.name, to_char(c.createddatetime,'DD_MM_YYY HH24:MI:SS') from my_recon_tbl1 a 
inner join ddt_business b on a.quoteid = b.quoteid
inner join pdbdocument c on b.itemindex = c.documentindex
where b.documenttype = 'Proposal Form';


select a.policy_no, b.product_code from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.policy_no in (

'0000000026335392-01'



);


select * from usr_0_sbigi_doc_upload_log where filename in (
'84632770_1'
);

select * from usr_0_sbigi_doc_upload_log where filename in (
'0000000003261987_9'
);



------------------------------to check the product code of CCM L2 Group for Not Available Policies-----------------------------------------
select a.policy_no, b.product_code from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.policy_no in (

'0000000026335392-01'
);

------------------CCM L2 Product Code---------------------------
/*
MLT2W01
HHDC001
PMCAR01
PMCAR02
HOMLT01
LOAN001
PACC001
GSB001
ASAN001
PRMSV01
CVE001
SHIP001
CRP001
MOP0002
MARSV01
SMEP01
BURG001
FIRSP02
MOP001
MSTOP01
CKP001
SURE001
GSA001
CMVGC01
TBHI001
HGLI0001
SUHE001
BGRP01
VBT001
KSB001
BGRP02
HGIND01
PM2W001
PM2W002
MBD0001
Glass01
SIGN001
FGI0001
PLI0001
PLA0001
BURG001
AR00001
BAG001
CAR0001
PEEI0001
WC00001
MONEY01

*/

----------Dheeraj Mail----------------

--for success--
select filename, to_char(process_date,'YY-MM-DD HH24:MI:SS') from usr_0_sbigi_doc_upload_log where 
filename like '%RenewalNotice%'
and status = 'SUCCESS'
and process_date  between
to_date('2023-05-28 22:00:00','YYYY-MM-DD HH24:MI:SS')
AND
to_date('2023-05-29 07:00:00','YYYY-MM-DD HH24:MI:SS');

select distinct documenttype from ddt_business;

----User Connection

select count(1),q.username,p.userindex from pdbconnection p join pdbuser q on p.userindex=q.userindex where p.usertype='S' group by q.username,p.userindex;





--for total --
select filename, to_char(process_date,'YY-MM-DD HH24:MI:SS') from usr_0_sbigi_doc_upload_log where 
filename like 'RenewalNotice%'
--and status = 'SUCCESS'
and process_date  between
to_date('2023-05-28 22:00:00','YYYY-MM-DD HH24:MI:SS')
AND
to_date('2023-05-29 07:00:00','YYYY-MM-DD HH24:MI:SS');

select distinct documenttype from ddt_business;

-- for not available renewal for repushing--
select filename, to_char(process_date,'YY-MM-DD HH24:MI:SS') from usr_0_sbigi_doc_upload_log where 
filename like 'RenewalNotice%'
and status != 'SUCCESS'
and process_date  between
to_date('2023-05-28 22:00:00','YYYY-MM-DD HH24:MI:SS')
AND
to_date('2023-05-29 07:00:00','YYYY-MM-DD HH24:MI:SS');

select distinct documenttype from ddt_business;


select filename, to_char(process_date,'YY-MM-DD HH24:MI:SS') from usr_0_sbigi_doc_upload_log order by process_date desc;
