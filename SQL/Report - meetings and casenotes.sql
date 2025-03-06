-- next meeting due date________________________________________________________________________________________________________
 IF( 1 = 1 , (SELECT DATE_FORMAT( DATE_ADD( cn.field_3015  , `INTERVAL 14 DAY`  ) , '%m/%d/%Y')   
 FROM `data_152` AS `cn`   
 JOIN `links` AS `lnk`    
    ON ((((((((lnk.link_from_id   = cn.document_id   )) 
        and ((lnk.state   = 1 )) )) 
        and ((lnk.active   = 1 )) )) 
        and ((lnk.field_id   = 3258 )) )) 
        and ((cn.active   = 1 ))    
    WHERE ((lnk.link_to_id   = data_147.document_id   )) 
        and ((((cn.field_3027   = 'Formal 1:1' )) 
        or ((cn.field_3027   = 'Performance Review' )) ))   
    ORDER BY cn.field_3015   DESC  LIMIT 1  ), '')

-- preview of last case note_______________________________________________________________________________________________________
 SUBSTRING( 
    IF( 1 = 1 , (SELECT cn.field_3026    
        FROM `data_152` AS `cn`   
        JOIN `links` AS `lnk`    
            ON ((((((((lnk.link_from_id   = cn.document_id   )) 
            and ((lnk.state   = 1 )) )) 
            and ((lnk.active   = 1 )) )) 
            and ((lnk.field_id   = 3258 )) )) 
            and ((cn.active   = 1 ))    
        WHERE lnk.link_to_id   = data_147.document_id     
        ORDER BY cn.field_3015   DESC  LIMIT 1  ), '') , 1, 100)



-- substring of most recent case note__________________________________________________________________________________________
 SUBSTRING( IF( 1 = 1 , (SELECT CONCAT(DATE_FORMAT(cn.field_3015,'%m/%d/%Y'),": ", cn.field_3026)    
 FROM `data_152` AS `cn`   
 JOIN `links` AS `lnk`    
 ON ((((((((lnk.link_from_id   = cn.document_id   )) 
 and ((lnk.state   = 1 )) )) 
 and ((lnk.active   = 1 )) )) 
 and ((lnk.field_id   = 3258 )) )) 
 and ((cn.active   = 1 ))    
 WHERE lnk.link_to_id   = data_147.document_id     
 ORDER BY cn.field_3015   DESC  LIMIT 1  ), '') , 1, 100)
