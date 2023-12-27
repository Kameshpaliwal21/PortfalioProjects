select a.policy_no from
GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a,
GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where
a.product_id=b.product_id and
a.product_id in ('900000860','900001845') and
a.agreement_id = '98742'
And TRUNC(a.ISSUE_DATE) = TRUNC((sysdate-1)) and a.policy_no is not null;
