select a.policy_no from GENERALSYSTEM.T_POLICY_GENERAL@OMINI_EBAO a, GENERALSYSTEM.T_PRODUCT_GENERAL@OMINI_EBAO b
where a.product_id='900000860' and a.status_id=120 and a.issue_date is not null and a.product_id=b.product_id  and a.ISSUE_DATE LIKE SYSDATE - 1 
and a.agreement_id in (3124,76880,61823,3313,19892,3841,1470,1293,9597,8063,6743,16351,450,26814,8510,1948,159881,308,7211,37729,61104,135025,140817,25872,
74226,64162,74567,74448,76530,100144);