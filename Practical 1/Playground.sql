-- DEMONSTRATE THE USE OF ROLL UP IN SQL USING SH SCHEMA
SELECT T.TIME_ID,
       C.CHANNEL_ID,
       CU.CUST_ID,
       P.PROD_ID,
       PR.PROMO_ID,
       SUM(S.AMOUNT_SOLD) AS SALES_AMT
FROM SALES S
         JOIN TIMES T ON S.TIME_ID = T.TIME_ID
         JOIN CHANNELS C ON S.CHANNEL_ID = C.CHANNEL_ID
         JOIN CUSTOMERS CU ON S.CUST_ID = CU.CUST_ID
         JOIN PRODUCTS P ON S.PROD_ID = P.PROD_ID
         JOIN PROMOTIONS PR ON S.PROMO_ID = PR.PROMO_ID
WHERE T.TIME_ID = TO_DATE(2000)
GROUP BY
    ROLLUP (T.TIME_ID, C.CHANNEL_ID, CU.CUST_ID, P.PROD_ID, PR.PROMO_ID);