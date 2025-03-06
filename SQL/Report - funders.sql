--concat all funders_____________________________________________
SELECT GROUP_CONCAT( DISTINCT CONCAT( data_147.field_3470  , 
    SPACE( 1) , '- ', 
    data_147.field_2935  , 
    SPACE( 1) , '- ', 
    data_147.field_4006  , 
    SPACE( 1) , 
    'Began: ', 
    DATE_FORMAT( data_147.field_2938  , '%m/%d/%Y') ) )
FROM `documents` AS `doc_145`   
    INNER JOIN `data_145` AS `data_145`   
        ON ((data_145.document_id   = doc_145.id   )) 
        and ((((data_145.active   = 1 )) 
        or ((data_145.active   is NULL )) ))    
    INNER JOIN `links` AS `links_3241_147`   
        ON ((((((links_3241_147.link_from_id   = doc_145.id   )) 
        and ((links_3241_147.field_id   = 3241 )) )) 
        and ((links_3241_147.state   = 1 )) )) 
        and ((((links_3241_147.active   = 1 )) 
        or ((links_3241_147.active   is NULL )) ))    
    INNER JOIN `documents` AS `doc_147`   
        ON links_3241_147.link_to_id   = doc_147.id      
        INNER JOIN `data_147` AS `data_147`   
        ON ((data_147.document_id   = doc_147.id   )) 
        and ((((data_147.active   = 1 )) 
        or ((data_147.active   is NULL )) ))
    WHERE ((data_147.field_2937   = '0000-00-00' )) and ((links_3241_147.link_from_id   = [EnrollmentID]   ))

 IF( 1 = 1 , (SELECT GROUP_CONCAT( DISTINCT data_147.field_4006  SEPARATOR ', ')   
 FROM `data_147`    
 JOIN `documents` AS `doc`    
    ON ((doc.id   = data_147.document_id   )) 
    and ((data_147.active   = 1 ))    
 WHERE ((((doc.parent_id   = data_144.document_id   )) 
    and ((data_147.field_2938   < STR_TO_DATE( RIGHT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d')  )) )) 
    and ((((data_147.field_2937   = '0000-00-00' )) 
        or ((data_147.field_2937   > STR_TO_DATE( LEFT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d')  )) ))  ), '')
