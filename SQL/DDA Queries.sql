-- notes for dda billing_________________________________________________________________________

 IF( 1 = 1 , (SELECT GROUP_CONCAT(DISTINCT CONCAT(data_151.field_3002,space(1),data_151.field_3828) SEPARATOR ', ')
 FROM `data_151`    
 JOIN `documents` AS `doc`    
 ON ((doc.id   = data_151.document_id   )) 
    and ((data_151.active   = 1 ))    
 WHERE ((doc.parent_id   = data_144.document_id   )) 
    and ((data_151.field_3002   between (STR_TO_DATE( LEFT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') ) 
    and (STR_TO_DATE( RIGHT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') )  ))  ), '')

-- DDA max hours by reporting date______________________________________________________________________________________________
IF( 1 = 1 , (SELECT SUM( data_171.field_3928  )   
FROM `data_171`    
JOIN `documents` AS `doc`    
    ON ((doc.id   = data_171.document_id   )) 
    and ((data_171.active   = 1 ))    
WHERE ((((((doc.parent_id   = data_144.document_id   )) 
    and ((data_171.field_3916   = 'Approved' )) )) 
    and ((data_171.field_3918   < STR_TO_DATE( RIGHT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d')  )) )) 
    and ((((data_171.field_3917   = '0000-00-00' )) 
    or ((data_171.field_3917   > STR_TO_DATE( LEFT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d')  )) ))  ), '')


-- DDA billing report total hours worked ____________________________________________________________________________________
-- data_151.field_4041 is the hourly rate, this needs to exclude values where that field is 0
 IF( 1 = 1 , (SELECT SUM( data_151.field_4067  )   
 FROM `data_151`    
 JOIN `documents` AS `doc`    
    ON ((doc.id   = data_151.document_id   )) 
    and ((data_151.active   = 1 ))    
 WHERE ((doc.parent_id   = data_144.document_id   )) 
    and ((data_151.field_4041 > 0))
    and ((data_151.field_3002   between (STR_TO_DATE( LEFT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') ) 
    and (STR_TO_DATE( RIGHT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') )  ))  ), '')

-- DDA max hours for tracking report_______________________________________________________________________________
IF( 1 = 1 , (SELECT SUM( data_171.field_3928  )   
FROM `data_171`    
JOIN `documents` AS `doc`    
    ON ((doc.id   = data_171.document_id   )) 
    and ((data_171.active   = 1 ))    
WHERE (( ((doc.parent_id   = data_144.document_id   )) 
    and ((data_171.field_3916   = 'Approved' )) )) ) , '')

-- DDA IE total hours used ___________________________________________________________________________________
 IF( 1 = 1 , (SELECT SUM( data_152.field_3776  )   
 FROM `data_152`    
 JOIN `documents` AS `doc`    
    ON ((doc.id   = data_152.document_id   )) 
    and ((data_152.active   = 1 ))    
 WHERE ((((doc.parent_id   = data_144.document_id   )) 
    and ((data_152.field_3832 LIKE '%Individual Employment%'))
    and ((((data_152.field_3831   != '' )) 
    or ((data_152.field_3830   != '' )) )) )) 
    and ((data_152.field_3015   between (STR_TO_DATE( LEFT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') ) 
    and (STR_TO_DATE( RIGHT( [column]  , INSTR( [column]  , '|')  - 1 ) , '%Y-%m-%d') )  ))  ), '')
