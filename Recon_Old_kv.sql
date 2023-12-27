-------- check count
SELECT COUNT(*) from POLICY_QUOTE_RECONCILIATION1;
-- step if Count != 0 then delete
TRUNCATE TABLE POLICY_QUOTE_RECONCILIATION1;

------Update the Data
--Policy
update POLICY_QUOTE_RECONCILIATION1 set RECON_STATUS= 'Y' where POLICYID in (select POLICYID from DDT_BUSINESS 
WHERE DOCUMENTTYPE='Policy' and POLICYID in(select POLICYID from POLICY_QUOTE_RECONCILIATION1)); -- and policyid not like '%-%';
--PolicyRenewal
UPDATE POLICY_QUOTE_RECONCILIATION1 SET RECON_STATUS= 'Y' WHERE POLICYID IN (SELECT POLICYID FROM DDT_BUSINESS 
where DOCUMENTTYPE='PolicyRenewal' and POLICYID in(select POLICYID from POLICY_QUOTE_RECONCILIATION1));-- and policyid like '%-%';
--Proposal Form
UPDATE POLICY_QUOTE_RECONCILIATION1 SET RECON_STATUS = 'Y' WHERE QUOTEID IN (SELECT QUOTEID FROM DDT_BUSINESS 
where DOCUMENTTYPE='Proposal Form' and QUOTEID in(select QUOTEID from POLICY_QUOTE_RECONCILIATION1));

--QuoteRenewal
UPDATE POLICY_QUOTE_RECONCILIATION1 SET RECON_STATUS = 'Y' WHERE QUOTEID IN (SELECT QUOTEID FROM DDT_BUSINESS 
where DOCUMENTTYPE = 'QuoteRenewal'and QUOTEID in(select QUOTEID from POLICY_QUOTE_RECONCILIATION1));




SELECT DISTINCT(Quoteid) from POLICY_QUOTE_RECONCILIATION1 where RECON_STATUS is not null; -- Av PF
select distinct(quoteid) from POLICY_QUOTE_RECONCILIATION1 where RECON_STATUS is null; -- NA PF
-------- Export Data
SELECT DISTINCT(POLICYID) from POLICY_QUOTE_RECONCILIATION1 where RECON_STATUS is not null and policyid not like '%-%'; --Av Policy
SELECT DISTINCT(POLICYID) FROM POLICY_QUOTE_RECONCILIATION1 where RECON_STATUS is null and policyid not like '%-%'; --NA Policy
select distinct(POLICYID) from POLICY_QUOTE_RECONCILIATION1 where RECON_STATUS is not null and policyid like '%-%'; -- Av PolicyRenewal
select distinct(POLICYID) from POLICY_QUOTE_RECONCILIATION1 where RECON_STATUS is null and policyid like '%-%'; -- NA PolicyRenewal

SELECT DISTINCT(Quoteid) from POLICY_QUOTE_RECONCILIATION1 where RECON_STATUS is not null; -- Av PF
select distinct(quoteid) from POLICY_QUOTE_RECONCILIATION1 where RECON_STATUS is null; -- NA PF

select QUOTEID, LOBNAME from ddt_business where quoteid in ( SELECT DISTINCT(Quoteid) from POLICY_QUOTE_RECONCILIATION1 where RECON_STATUS is not null); -- Av PF
select QUOTEID, LOBNAME from ddt_business where quoteid in (select distinct(quoteid) from POLICY_QUOTE_RECONCILIATION1 where RECON_STATUS is null); -- NA PF

SELECT DISTINCT(POLICYID) FROM POLICY_QUOTE_RECONCILIATION1 WHERE RECON_STATUS IS NOT NULL; --Av Policy & PolicyRenewal
SELECT DISTINCT(POLICYID) from POLICY_QUOTE_RECONCILIATION1 where RECON_STATUS is null; --Not Av Policy & PolicyRenewal

-----
--Policy Reconcilation create table POLICY_QUOTE_RECONCILIATION1 as SELECT * from POLICY_QUOTE_RECONCILIATION1;