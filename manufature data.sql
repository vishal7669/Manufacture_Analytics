SELECT * FROM manufacture_data;
Select * from manufacturing;
#KPI-1
SELECT round(avg(`Manufactured Qty`),0) FROM `manufacture_data`;

#KPI-2
SELECT round(avg(`Rejected Qty`),0) FROM `manufacture_data`;

#KPI-3
SELECT round(avg(`Processed Qty`),0) FROM `manufacture_data`;

#KPI-4
SELECT CONCAT(ROUND(Sum(`Rejected Qty`)/Sum(`Processed Qty`)*100,2)*100, "%")
FROM `manufacture_data`;

#KPI-5
SELECT `Machine / Employee`, 
       round(Avg(`Rejected Qty`),1) AS Average_Rejected_Qty
FROM `manufacture_data`
GROUP BY `Machine / Employee`;

#KPI-6
SELECT `Machine Code`,
Avg(`Rejected Qty`) as Average_Rejected_Quantity
FROM `manufacture_data`
GROUP By `Machine Code`;

#KPI-7
Select `Doc Date`,Avg(`Produced Qty`) as Average_Produced_Quantity 
FROM `manufacture_data`
GROUP BY `Doc Date`;

#KPI-8
SELECT 
    CASE 
        WHEN (SELECT AVG(`Rejected Qty`) FROM `manufacturing`) > (SELECT AVG(`Manufactured Qty`) FROM `manufacture_data`) THEN 'More Rejected'
        WHEN (SELECT AVG(`Rejected Qty`) FROM `manufacturing`) < (SELECT AVG(`Manufactured Qty`) FROM `manufacture_data`) THEN 'Less Rejected'
        ELSE 'Equal'
    END AS `Comparison`;
    
#KPI-9
SELECT 
    `Department Name`,
    round(Avg(`Manufactured Qty`),0) AS `Total Manufactured Qty`,
    round(Avg(`Rejected Qty`),0) AS `Total Rejected Qty`,
    CASE 
        WHEN round(Avg(`Rejected Qty`),0) > round(Avg(`Manufactured Qty`),0) THEN 'More Rejected'
        WHEN Avg(`Rejected Qty`) < Avg(`Manufactured Qty`) THEN 'Less Rejected'
        ELSE 'Equal'
    END AS `Comparison`
FROM 
    `manufacture_data`
GROUP BY 
    `Department Name`;
    
    #KPI-10
    SELECT `Emp Name`,round(Avg(`Rejected Qty`),2) as Average_Rejected_Quantity from `manufacture_data`
    group by `Emp Name`;
    

