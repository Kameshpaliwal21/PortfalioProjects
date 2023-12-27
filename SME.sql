col spoolname new_value spoolname
set serveroutput on
set heading off
set lines 300
set pages 0
set feedback off
set echo off
set trims off
set trimspool on
set head on
SET NUM 24
select  to_char(sysdate,'DDMMYYYY') spoolname from dual;
spool '/u01/GPA/app_script/SME/SME001_&spoolname'
select 'PolicyId' from dual;
SELECT distinct(a.policy_no) FROM GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO A inner JOIN  
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO C on a.PRODUCT_ID = C.PRODUCT_ID   left join DDT_22 B on a.POLICY_NO= B.FIELD_28
where a.STATUS_ID ='120' and a.PRODUCT_ID = '900001060' and TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1));
spool off;

spool '/u01/GPA/app_script/BGRP/BGRP001_&spoolname'
select 'PolicyId' from dual;
SELECT distinct(a.policy_no) FROM GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO A inner JOIN  
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO C on a.PRODUCT_ID = C.PRODUCT_ID   left join DDT_22 B on a.POLICY_NO= B.FIELD_28
where a.STATUS_ID ='120' and a.PRODUCT_ID = '900002241' and TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1));
spool off;

spool '/u01/GPA/app_script/BGRP02/BGRP02_&spoolname'
select 'PolicyId' from dual;
select policy_no from generalsystem.T_Policy_General@OMINI_EBAO where
product_id = '900002580' and
TRUNC(ISSUE_DATE) = TRUNC((sysdate-1)) and policy_no is not null;
spool off;

spool '/u01/GPA/app_script/KSB/KSB001_&spoolname'
select 'PolicyId' from dual;
SELECT distinct(a.policy_no) FROM GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO A inner JOIN  
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO C on a.PRODUCT_ID = C.PRODUCT_ID   left join DDT_22 B on a.POLICY_NO= B.FIELD_28
where a.STATUS_ID ='120' and a.PRODUCT_ID = '900002041' and TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1));
spool off;

spool '/u01/GPA/app_script/Sukshma/Sukshma_FIRSP001_&spoolname'
select 'PolicyId' from dual;
SELECT distinct(a.policy_no) FROM
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO A,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO B,
GENERALSYSTEM.T_GS_RESERVE_TB_900000844@OMINI_EBAO c
WHERE A.PRODUCT_ID=B.PRODUCT_ID AND
a.status_id ='120' and ( c.field7='3') and
a.product_id = '700001003' and
A.POLICY_ID = C.FIELD9 AND
trunc(A.ISSUE_DATE)=trunc(sysdate -1);
spool off;

spool '/u01/GPA/app_script/Laghu/Laghu_FIRSP001_&spoolname'
select 'PolicyId' from dual;
SELECT distinct(a.policy_no) FROM
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO A,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO B,
GENERALSYSTEM.T_GS_RESERVE_TB_900000844@OMINI_EBAO c
WHERE A.PRODUCT_ID=B.PRODUCT_ID AND
a.status_id ='120' and ( c.field7='4') and
a.product_id = '700001003' and
A.POLICY_ID = C.FIELD9 AND
trunc(A.ISSUE_DATE)=trunc(sysdate -1);
spool off;

spool '/u01/GPA/app_script/SUKSHMA_BP0001/Sukshma_BP0001_&spoolname'
select 'PolicyId' from dual;
SELECT distinct(a.policy_no) FROM
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO A,
GENERALSYSTEM.T_GS_RESERVE_TB_900000909@OMINI_EBAO B,
GENERALSYSTEM.T_SUB_PRODUCT_SMEP01@OMINI_EBAO C,
GENERALSYSTEM.t_product_general@OMINI_EBAO d
where
A.POLICY_ID=B.FIELD25 AND
a.status_id ='120' and b.FIELD2= c.id and b.FIELD2 = '6' AND
a.product_id=d.product_id and
A.PRODUCT_ID = '900001200' AND
TRUNC(A.ISSUE_DATE)=TRUNC(SYSDATE - 1);
spool off;

spool '/u01/GPA/app_script/LAGHU_BP0001/Laghu_BP0001_&spoolname'
select 'PolicyId' from dual;
SELECT distinct(a.policy_no) FROM
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO A,
GENERALSYSTEM.T_GS_RESERVE_TB_900000909@OMINI_EBAO B,
GENERALSYSTEM.T_SUB_PRODUCT_SMEP01@OMINI_EBAO C,
GENERALSYSTEM.t_product_general@OMINI_EBAO d
where
A.POLICY_ID=B.FIELD25 AND
a.status_id ='120' and b.FIELD2= c.id and b.FIELD2 = '7' AND
a.product_id=d.product_id and
A.PRODUCT_ID = '900001200' AND
TRUNC(A.ISSUE_DATE)=TRUNC(SYSDATE - 1);
spool off;


spool '/u01/GPA/app_script/GPA_55613/GPA_55613_&spoolname'
select 'PolicyId' from dual;
select a.policy_no from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '55613'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_58212/GPA_58212_&spoolname'
select 'PolicyId' from dual;
select a.policy_no from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '58212'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_58768/GPA_58768_&spoolname'
select 'PolicyId' from dual;
select a.policy_no from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '58768'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_78509/GPA_78509_&spoolname'
select 'PolicyId' from dual;
select a.policy_no from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '78509'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_76478/GPA_76478_&spoolname'
select 'PolicyId' from dual;
select a.policy_no from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '76478'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_81823/GPA_81823_&spoolname'
select 'PolicyId' from dual;
select a.policy_no from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '81823'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_62742/GPA_62742_&spoolname'
select 'PolicyId' from dual;
select a.policy_no from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '62742'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_195404/GPA_195404_&spoolname'
select 'PolicyId' from dual;
select a.policy_no from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '195404'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_82764/GPA_82764_&spoolname'
select 'PolicyId' from dual;
select a.policy_no from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '82764'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_68519/GPA_68519_&spoolname'
select 'PolicyId' from dual;
select distinct(a.policy_no) from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '68519'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_98742/GPA_98742_&spoolname'
select 'PolicyId' from dual;
select distinct(a.policy_no) from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '98742'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_80722/GPA_80722_&spoolname'
select 'PolicyId' from dual;
select distinct(a.policy_no) from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '80722'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_79779/GPA_79779_&spoolname'
select 'PolicyId' from dual;
select distinct(a.policy_no) from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '79779'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_180508/GPA_180508_&spoolname'
select 'PolicyId' from dual;
select distinct(a.policy_no) from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '180508'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_114804/GPA_114804_&spoolname'
select 'PolicyId' from dual;
select distinct(a.policy_no) from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '114804'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_148133/GPA_148133_&spoolname'
select 'PolicyId' from dual;
select distinct(a.policy_no) from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '148133'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_120798/GPA_120798_&spoolname'
select 'PolicyId' from dual;
select distinct(a.policy_no) from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '120798'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_159183/GPA_159183_&spoolname'
select 'PolicyId' from dual;
select distinct(a.policy_no) from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '159183'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_124612/GPA_124612_&spoolname'
select 'PolicyId' from dual;
select distinct(a.policy_no) from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '124612'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_149800/GPA_149800_&spoolname'
select 'PolicyId' from dual;
select distinct(a.policy_no) from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '149800'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


spool '/u01/GPA/app_script/GPA_144892/GPA_144892_&spoolname'
select 'PolicyId' from dual;
select distinct(a.policy_no) from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '144892'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
spool off;


exit;

