select rank() over(order by (createddatetime)),name from pdbdocument where name in (SELECT quoteid from my_recon_tbl);

select name, createddatetime, rank() over(partition by pdbdocument.name order by createddatetime) from pdbdocument where name in (SELECT quoteid from POLICY_QUOTE_RECONCILIATION);

select * from pdbdocument where name = '85524165_1';
select * from ddt_business where quoteid = '96222722';




