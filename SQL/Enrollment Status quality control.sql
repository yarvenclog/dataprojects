--enrollment status for all enrollment status'______________________________________________________

SELECT GROUP_CONCAT( DISTINCT data_145.field_2902 SEPARATOR ', ')
FROM `documents` AS `doc_144`   
    INNER JOIN `data_144` AS `data_144`   
        ON ((data_144.document_id   = doc_144.id   )) 
        and ((((data_144.active   = 1 )) 
        or ((data_144.active   is NULL )) ))    
    INNER JOIN `documents` AS `doc_145`   
        ON doc_144.id   = doc_145.parent_id      
    INNER JOIN `data_145` AS `data_145`   
        ON ((data_145.document_id   = doc_145.id   )) 
        and ((((data_145.active   = 1 )) 
        or ((data_145.active   is NULL )) ))
    WHERE ((doc_145.parent_id   = data_144.document_id   ))
