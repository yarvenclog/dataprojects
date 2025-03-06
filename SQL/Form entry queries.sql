-- query for full name____________________________________________________________________________________
CONCAT(data_144.field_3436_first,space(1),data_144.field_3436_last)
from `documents` AS `doc_144`
INNER JOIN `data_144` AS `data_144`
    ON ((data_144.document_id   = doc_144.id   )) 
    and ((((data_144.active   = 1 )) 
    or ((data_144.active   is NULL )) ))
INNER JOIN 'links' AS `links_3293`
    ON ((((((links_3293.link_from_id   = doc_144.id   )) 
    and ((links_3293.field_id   = 3239 )) )) 
    and ((links_3293.state   = 1 )) )) 
    and ((((links_3293.active   = 1 )) 
    or ((links_3293.active   is NULL )) )) 
ORDER BY data_144.field_3436_first DESC
Limit 1

CONCAT(data_144.field_3436_first,space(1),data_144.field_3436_last)
from `documents` AS `doc_144`
INNER JOIN `data_144` AS `data_144`
    ON ((data_144.document_id   = doc_144.id   )) 
    and ((((data_144.active   = 1 )) 
    or ((data_144.active   is NULL )) ))
INNER JOIN `links` AS `links_2900`
    ON ((((((links_2900.link_from_id   = doc_144.id   )) 
    and ((links_2900.field_id   = 2900 )) )) 
    and ((links_2900.state   = 1 )) )) 
    and ((((links_2900.active   = 1 )) 
    or ((links_2900.active   is NULL )) )) 
ORDER BY data_144.field_3436_first DESC
Limit 1

-- get UA status from linked UA form______________________________________________________________________________________
select data_154.field_3039
from `documents` AS `doc_145`
INNER JOIN `data_145` AS `data_145`
    ON ((data_145.document_id   = doc_145.id   )) 
    and ((((data_145.active   = 1 )) 
    or ((data_145.active   is NULL )) ))
INNER JOIN 'links' AS `links_3239`
    ON ((((((links_3239.link_from_id   = doc_145.id   )) 
    and ((links_3239.field_id   = 3239 )) )) 
    and ((links_3239.state   = 1 )) )) 
    and ((((links_3239.active   = 1 )) 
    or ((links_3239.active   is NULL )) )) 
INNER JOIN `documents` AS `doc_154`
    ON links_3239.link_to_id   = doc_154.id
INNER JOIN `data_154` AS `data_154`   
    ON ((data_154.document_id   = doc_154.id   )) 
    and ((((data_154.active   = 1 )) 
    or ((data_154.active   is NULL )) ))
ORDER BY data_154.field_3039 DESC
Limit 1
-- get winning traits status from program enrollment___________________________________________________________________
select data_164.field_3484
from `documents` AS `doc_145`
INNER JOIN `data_145` AS `data_145`
    ON ((data_145.document_id   = doc_145.id   )) 
    and ((((data_145.active   = 1 )) 
    or ((data_145.active   is NULL )) ))
INNER JOIN 'links' AS `links_3493`
    ON ((((((links_3493.link_from_id   = doc_145.id   )) 
    and ((links_3493.field_id   = 3493 )) )) 
    and ((links_3493.state   = 1 )) )) 
    and ((((links_3493.active   = 1 )) 
    or ((links_3493.active   is NULL )) )) 
INNER JOIN `documents` AS `doc_164`
    ON links_3493.link_to_id   = doc_164.id
INNER JOIN `data_164` AS `data_164`   
    ON ((data_164.document_id   = doc_164.id   )) 
    and ((((data_164.active   = 1 )) 
    or ((data_164.active   is NULL )) ))
ORDER BY data_164.field_3484 DESC
Limit 1

-- get location from enrollment _______________________________________________________________________________
select data_145.field_2903
from `documents` AS `doc_145`
INNER JOIN `data_145` AS `data_145`
    ON ((data_145.document_id   = doc_145.id   )) 
    and ((((data_145.active   = 1 )) 
    or ((data_145.active   is NULL )) ))

INNER JOIN `links` AS `links_3493`
    ON ((((((links_3493.link_from_id   = doc_145.id   )) 
    and ((links_3493.field_id   = 3493 )) )) 
    and ((links_3493.state   = 1 )) )) 
    and ((((links_3493.active   = 1 )) 
    or ((links_3493.active   is NULL )) ))

INNER JOIN `documents` AS `doc_147`
    ON links_3493.link_to_id   = doc_147.id
INNER JOIN `data_147` AS `data_147`   
    ON ((data_147.document_id   = doc_147.id   )) 
    and ((((data_147.active   = 1 )) 
    or ((data_147.active   is NULL )) ))
ORDER BY data_147.field_3484 DESC
Limit 1

--most recent wage__________________________________________________
 IF( 1 = 1 , (SELECT data_150.field_2999   
 FROM `data_150`    
 JOIN `documents` AS `doc`    
 ON ((doc.id   = data_150.document_id   )) 
    and ((data_150.active   = 1 ))    
 WHERE ((doc.parent_id   = data_149.document_id   ))
    and ((data_152.field_3258 LIKE( '%Community Inclusion%' )))
    and ((data_152.field_3015   
    between (STR_TO_DATE( LEFT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') ) 
    and (STR_TO_DATE( RIGHT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') )  ))  ), '')

-- users current role _____________________________________________________________________
SELECT GROUP_CONCAT( DISTINCT rol.role_name  SEPARATOR '|')
FROM `links` AS `lnk`   
JOIN `data_6` AS `data_6`    
ON ((((((((data_6.document_id   = lnk.link_from_id   )) 
    and ((lnk.field_id   = 49 )) )) 
    and ((lnk.active   = 1 )) )) 
    and ((lnk.state   = 1 )) )) 
    and ((data_6.active   = 1 ))    
JOIN `documents` AS `doc`    
    ON doc.id   = data_6.document_id      
JOIN `data_5` AS `data_5`    
    ON ((data_5.document_id   = doc.parent_id   )) 
    and ((data_5.active   = 1 ))    
JOIN `data_4` AS `data_4`    
    ON ((data_4.document_id   = lnk.link_to_id   )) 
    and ((data_4.active   = 1 ))    
JOIN (SELECT DISTINCT permission_set_id  , role_id  , rol.name AS `role_name`   
FROM `permissions` AS `per`   
JOIN `roles` AS `rol`    
    ON ((rol.id   = per.role_id   )) 
    and ((rol.active   = 1 ))    
WHERE permission_set_id   <> 0  ) AS `rol`  
    ON rol.permission_set_id   = data_6.document_id

-- get user email from user info______________________________________________________________
SELECT data_4.field_27
FROM `links` AS `lnk`   
JOIN `data_6` AS `data_6`    
ON ((((((((data_6.document_id   = lnk.link_from_id   )) 
    and ((lnk.field_id   = 49 )) )) 
    and ((lnk.active   = 1 )) )) 
    and ((lnk.state   = 1 )) )) 
    and ((data_6.active   = 1 ))    
JOIN `documents` AS `doc`    
    ON doc.id   = data_6.document_id      
JOIN `data_5` AS `data_5`    
    ON ((data_5.document_id   = doc.parent_id   )) 
    and ((data_5.active   = 1 ))    
JOIN `data_4` AS `data_4`    
    ON ((data_4.document_id   = lnk.link_to_id   )) 
    and ((data_4.active   = 1 ))    
JOIN (SELECT DISTINCT permission_set_id  , role_id  , rol.name AS `role_name`   
FROM `permissions` AS `per`   
JOIN `roles` AS `rol`    
    ON ((rol.id   = per.role_id   )) 
    and ((rol.active   = 1 ))    
WHERE permission_set_id   <> 0  ) AS `rol`  
    ON rol.permission_set_id   = data_6.document_id
