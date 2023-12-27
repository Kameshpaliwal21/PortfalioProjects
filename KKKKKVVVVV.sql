---------------------------------------------------------Policy/PolicyRenewal---------------------------------------------------
-------- check count 
truncate table my_recon_tbl1;
     
select COUNT(*) from my_recon_tbl1; 
         
truncate table my_recon_tbl1;

--Policy 

update my_recon_tbl1 set RECON_STATUS = 'Y' where POLICYID in (select POLICYID from DDT_BUSINESS 
where DOCUMENTTYPE='Policy' and POLICYID in(select POLICYID from my_recon_tbl1));-- and policyid not like '%-%'; 

--PolicyRenewal 

UPDATE my_recon_tbl1 SET RECON_REF1 = 'Y' WHERE POLICYID IN (SELECT POLICYID FROM DDT_BUSINESS 
where DOCUMENTTYPE='PolicyRenewal' and POLICYID in(select POLICYID from my_recon_tbl1) )and RECON_STATUS is null;-- and policyid like '%-%'; 

select distinct(POLICYID) from my_recon_tbl1 where RECON_STATUS is not null;  -- Policy 
select distinct(POLICYID) from my_recon_tbl1 where RECON_STATUS is null and RECON_REF1 is not null; --PolicyRenewal 

select distinct(POLICYID) from my_recon_tbl1  where RECON_STATUS is not null or RECON_REF1 is not null; --Available 
select distinct(POLICYID) from my_recon_tbl1 where RECON_STATUS is null and RECON_REF1 is  null;--Not_Available 

------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------PF/RN--------------------------------------------------------------------



-------- check count 
truncate table my_recon_tbl1;
     
select COUNT(*) from my_recon_tbl1; 
         
truncate table my_recon_tbl1;



UPDATE my_recon_tbl1 SET RECON_STATUS = 'Y' WHERE QUOTEID IN (SELECT QUOTEID FROM DDT_BUSINESS 
where DOCUMENTTYPE='Proposal Form' and QUOTEID in(select QUOTEID from my_recon_tbl1));



SELECT DISTINCT(Quoteid) from my_recon_tbl1 where RECON_STATUS is not null; -- Av PF
select distinct(quoteid) from my_recon_tbl1 where RECON_STATUS is null; -- NA PF



UPDATE my_recon_tbl1 SET RECON_STATUS = 'Y' WHERE QUOTEID IN (SELECT QUOTEID FROM DDT_BUSINESS 
where DOCUMENTTYPE='QuoteRenewal' and QUOTEID in(select QUOTEID from my_recon_tbl1));




------------------------------------------------------------------------------------------------------------------------------