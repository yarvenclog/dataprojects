-- these scripts are built for a report in Apricot case management system, the syntax looks wierd but works in the built in reporting system

--assessment hours__________________________________________________
 IF( 1 = 1 , (SELECT SUM( data_152.field_3826  )   
 FROM `data_152`    
 JOIN `documents` AS `doc`    
 ON ((doc.id   = data_152.document_id   )) 
    and ((data_152.active   = 1 ))    
 WHERE ((doc.parent_id   = data_144.document_id   )) 
    and ((data_152.field_3258 LIKE( '%Community Inclusion%' )))
    and ((data_152.field_3015   
    between (STR_TO_DATE( LEFT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') ) 
    and (STR_TO_DATE( RIGHT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') )  ))  ), 
'')

--other pathways time___________________________________________________
 IF( 1 = 1 , (SELECT SUM( data_152.field_3827  )   
 FROM `data_152`    
 JOIN `documents` AS `doc`    
 ON ((doc.id   = data_152.document_id   )) 
    and ((data_152.active   = 1 ))    
 WHERE ((doc.parent_id   = data_144.document_id   ))
    and ((data_152.field_3258 LIKE( '%Community Inclusion%' )))
    and ((data_152.field_3015   
    between (STR_TO_DATE( LEFT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') ) 
    and (STR_TO_DATE( RIGHT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') )  ))  ), '')

--total time spent on case notes___________________________________
 IF( 1 = 1 , (SELECT SUM( data_152.field_3776  )   
 FROM `data_152`    
 JOIN `documents` AS `doc`    
 ON ((doc.id   = data_152.document_id   )) 
    and ((data_152.active   = 1 ))    
 WHERE ((doc.parent_id   = data_144.document_id   ))
    and ((data_152.field_3015   
    between (STR_TO_DATE( LEFT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') ) 
    and (STR_TO_DATE( RIGHT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') )  ))  ), '')

--monthly billing notes____________________________________________________________
IF( 1 = 1 , (SELECT GROUP_CONCAT( DISTINCT data_151.field_3828  SEPARATOR '\n')   
FROM `data_151`    
JOIN `documents` AS `doc`    
ON ((doc.id   = data_151.document_id   )) 
    and ((data_151.active   = 1 ))    
WHERE ((doc.parent_id   = data_144.document_id   )) 
    and ((data_151.field_3002   
    between (STR_TO_DATE( LEFT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') ) 
    and (STR_TO_DATE( RIGHT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') )  ))  ), '')
