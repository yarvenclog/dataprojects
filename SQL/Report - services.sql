--Active services concatenated_______________________________________________________________
IF( 1 = 1 , (SELECT GROUP_CONCAT( DISTINCT data_147.field_2935  SEPARATOR '\n')   
FROM `data_147`    
JOIN `documents` AS `doc`    
ON ((doc.id   = data_147.document_id   )) 
    and ((data_147.active   = 1 ))    
WHERE ((doc.parent_id   = data_144.document_id   )) 
    and ((data_147.field_2938    
    < (STR_TO_DATE( RIGHT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') )  ))
    and ((data_147.field_2937 = '0000-00-00'))  ), '')

  
--Sub Services concatenated 2______________________________________________________________
IF( 1 = 1 , (SELECT GROUP_CONCAT( DISTINCT data_147.field_2935  SEPARATOR ', ')   
FROM `data_147`    
JOIN `documents` AS `doc`    
ON ((doc.id   = data_147.document_id   )) 
    and ((data_147.active   = 1 ))    
WHERE ((doc.parent_id   = data_144.document_id   )) 
    and ((data_147.field_2938    
    < (STR_TO_DATE( RIGHT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') )  ))
    and ((((data_147.field_2937 = '0000-00-00')) 
        or ((data_147.field_2937 > (STR_TO_DATE( LEFT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') )))))  ), '')

  
--Sub Services concatenated 3 ending services between reorting dates______________________________________________________________
IF( 1 = 1 , (SELECT GROUP_CONCAT( DISTINCT data_147.field_2935  SEPARATOR ', ')   
FROM `data_147`    
JOIN `documents` AS `doc`    
ON ((doc.id   = data_147.document_id   )) 
    and ((data_147.active   = 1 ))    
WHERE ((doc.parent_id   = data_144.document_id   )) 
    and ((data_147.field_3470 LIKE '%Job Development%'))
    and (( ((data_147.field_2937  < (STR_TO_DATE( RIGHT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') )  )) -- end date
        and  ((data_147.field_2937 > (STR_TO_DATE( LEFT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') ))))) -- start date
    or ((data_147.field_2937 = '0000-00-00'))  ), '') 


--Service Date_____________________________________________________________________________
IF( 1 = 1 , (SELECT GROUP_CONCAT( DISTINCT data_145.field_2908  SEPARATOR ', ')  --data_145.field_2918 for service close date 
FROM `data_145`    
JOIN `documents` AS `doc`    
ON ((doc.id   = data_145.document_id   )) 
    and ((data_145.active   = 1 )) 
JOIN `data_147`   
WHERE ((doc.parent_id   = data_144.document_id   )) 
    and ((data_145.field_2908    
    < (STR_TO_DATE( RIGHT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') )  ))
    and ((((data_145.field_2918 = '0000-00-00')) 
        or ((data_145.field_2918 > (STR_TO_DATE( LEFT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') )))))  ), '')
