-------- check count
SELECT COUNT(*) from MY_RECON_TBL;
-- step if Count != 0 then delete
TRUNCATE TABLE my_recon_tbl;

------Update the Data
--Policy
update MY_RECON_TBL set RECON_STATUS= 'Y' where POLICYID in (select POLICYID from DDT_BUSINESS 
WHERE DOCUMENTTYPE='Policy' and POLICYID in(select POLICYID from MY_RECON_TBL));-- and policyid  not like '%-%';
--PolicyRenewal
UPDATE MY_RECON_TBL SET RECON_STATUS = 'Y' WHERE POLICYID IN (SELECT POLICYID FROM DDT_BUSINESS 
where DOCUMENTTYPE='PolicyRenewal' and POLICYID in(select POLICYID from MY_RECON_TBL));-- and policyid like '%-%';
--Proposal Form
UPDATE MY_RECON_TBL SET RECON_STATUS = 'Y' WHERE QUOTEID IN (SELECT QUOTEID FROM DDT_BUSINESS 
where DOCUMENTTYPE='Others' and QUOTEID in(select QUOTEID from MY_RECON_TBL));

--QuoteRenewal
UPDATE MY_RECON_TBL SET RECON_STATUS = 'Y' WHERE QUOTEID IN (SELECT QUOTEID FROM DDT_BUSINESS 
where DOCUMENTTYPE = 'QuoteRenewal'and QUOTEID in(select QUOTEID from MY_RECON_TBL));


-------- Export Data

select DISTINCT(POLICYID), lobname from ddt_business where policyid in (SELECT DISTINCT(POLICYID) from MY_RECON_TBL where RECON_STATUS is not null) and documenttype in ('Policy' , 'PolicyRenewal');

SELECT DISTINCT(POLICYID) from MY_RECON_TBL where RECON_STATUS is not null;-- and policyid not like '%-%'; --Av Policy
SELECT DISTINCT(POLICYID) FROM MY_RECON_TBL where RECON_STATUS is null;-- and policyid not like '%-%'; --NA Policy


select distinct(POLICYID) from MY_RECON_TBL where RECON_STATUS is not null and policyid like '%-%'; -- Av PolicyRenewal
select distinct(POLICYID) from MY_RECON_TBL where RECON_STATUS is null and policyid like '%-%'; -- NA PolicyRenewal
SELECT DISTINCT(Quoteid) from MY_RECON_TBL where RECON_STATUS is not null; -- Av PF
select distinct(quoteid) from MY_RECON_TBL where RECON_STATUS is null; -- NA PF
select * from ddt_business;
SELECT DISTINCT(POLICYID) FROM MY_RECON_TBL WHERE RECON_STATUS IS NOT NULL; --Av Policy & PolicyRenewal
SELECT DISTINCT(POLICYID) from MY_RECON_TBL where RECON_STATUS is null; --Not Av Policy & PolicyRenewal

-----
--Policy Reconcilation create table MY_RECON_TBL as SELECT * from MY_RECON_TBL;