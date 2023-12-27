select name, createddatetime from pdbdocument where name in (SELECT quoteid from my_recon_tbl1);

select * from pdbdocument where name = '85524165_1';