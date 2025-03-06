-- UA satatus where random is required
IF( 1=1, (SELECT data_154.field_3039 
FROM `data_154` 
JOIN `links` AS `lnk` 
    ON ((((((((lnk.link_to_id = data_154.document_id )) 
        and ((lnk.state = 1 )) )) 
        and ((lnk.active = 1 )) )) 
        and ((lnk.field_id = 3239 )) )) 
        and ((data_154.active = 1 )) 
WHERE ((lnk.link_from_id   = data_145.document_id   ))
    AND (data_154.field_3039 = "Random Drug Test Required") 
    AND data_154.active = 1), '')

-- display drug test status in report
IF( 1=1, (SELECT data_154.field_3039 
FROM `data_154` 
JOIN `links` AS `lnk` 
    ON ((((((((lnk.link_to_id = data_154.document_id )) 
        and ((lnk.state = 1 )) )) 
        and ((lnk.active = 1 )) )) 
        and ((lnk.field_id = 3239 )) )) 
        and ((data_154.active = 1 )) 
WHERE ((lnk.link_from_id   = data_145.document_id   ))
    AND (data_154.field_4910 = "Random Drug Test") 
    AND (data_154.field_3039 != "Passed")
    AND data_154.active = 1), '')
