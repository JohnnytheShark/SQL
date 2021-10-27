-- Get the first of the month out of the current month
SELECT TRUNC(LAST_DAY(sysdate),'MM') FROM DUAL;

-- To get the last day just use the last day function 
SELECT LAST_DAY(sysdate),'MM' FROM DUAL;

--To get the first of the month from the previous month just use add_months to get the previous month 
SELECT ADD_MONTHS(TRUNC(LAST_DAY(sysdate),'MM'),-1) FROM DUAL;