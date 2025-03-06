[column] LIKE '%Completed 90 days on job%' OR [column] LIKE '%Found Own Job%' OR [column] LIKE '%Returning to School / Training%' OR [column] LIKE '%Student - End of Semester%'

IF( 1=1,
    CASE
        WHEN [column] LIKE '%Attendance / No Response%' OR [column] LIKE '%Medical Instability%' OR [column] LIKE '%Mental Health Instability%' OR [column] LIKE '%Sobriety Instability%' OR [column] LIKE '%Unable to meet support needs / goals%'
            THEN 'Negative'
        WHEN [column] LIKE '%Completed 90 days on job%' OR [column] LIKE '%Found Own Job%' OR [column] LIKE '%Returning to School / Training%' OR [column] LIKE '%Student - End of Semester%'
            THEN 'Positive'
        WHEN [column] LIKE '%Moved%' OR [column] LIKE '%Quit%' OR [column] LIKE '%Using Other Provider%' OR [column] LIKE '%Other%'
            THEN 'Neutral'
        ELSE 'Unknown'
    End,''
)

-- training program display for JD 
IF([column] = '', 'Direct', 
    IF([column] LIKE '%Manufacturing%', 'Manufacturing', 
        IF([column] LIKE '%Clerical%', 'Clerical', 
            IF([column] LIKE '%Custodial%', 'Custodial', '')
        )
    )
)

 IF( [column]   < 6 , '0-5', 
IF( (([column]   >= 6 )) and (([column]   <= 13 )) , '6-13', 
IF( (([column]   >= 14 )) and (([column]   <= 17 )) , '14-17', 
IF( (([column]   >= 18 )) and (([column]   <= 24 )) , '18-24', 
IF( (([column]   >= 25 )) and (([column]   <= 44 )) , '25-44', 
IF( (([column]   >= 45 )) and (([column]   <= 54 )) , '45-54', 
IF( (([column]   >= 55 )) and (([column]   <= 59 )) , '55-59',
IF( (([column]   >= 60 )) and (([column]   <= 64 )) , '60-64',
IF( (([column]   >= 65 )) and (([column]   <= 74 )) , '65-74', 
IF( (([column]   >= 75 )) and (([column]   <= 99)) , '75+',
IF( [column]   > 99 , 'Unknown' , '') ) ) ) ) ) ) ) ) ))

 IF( [column]   < 6 , '0-5', 
IF( (([column]   >= 6 )) and (([column]   <= 12 )) , '6-12', 
IF( (([column]   >= 13 )) and (([column]   <= 17 )) , '13-17', 
IF( (([column]   >= 18 )) and (([column]   <= 24 )) , '18-24', 
IF( (([column]   >= 25 )) and (([column]   <= 34 )) , '25-34', 
IF( (([column]   >= 35 )) and (([column]   <= 54 )) , '35-54', 
IF( (([column]   >= 55 )) and (([column]   <= 74 )) , '55-74',
IF( (([column]   >= 60 )) and (([column]   <= 84 )) , '75-84', 
IF( (([column]   >= 85 )) and (([column]   <= 99)) , '85+',
IF( [column]   > 99 , 'Unknown' , '') ) ) ) ) ) ) ) ) )

 IF( [column]   < 18 , 'Less than 18', 
 IF( (([column]   > 18 )) and (([column]   < 26 )) , '18-25', 
 IF( (([column]   > 25 )) and (([column]   < 31 )) , '26-30', 
 IF( (([column]   > 30 )) and (([column]   < 41 )) , '31-40', 
 IF( (([column]   > 40 )) and (([column]   < 51 )) , '41-50', 
 IF( (([column]   > 50 )) and (([column]   < 61 )) , '51-60', 
 IF( [column]   > 60 , 'Greater than 60', '') ) ) ) ) ) )

 IF(
    [column] LIKE '%Homeless%', 'Homeless',
    IF(
        [column] LIKE '%, Rent%', 'Rent',
        IF(
            [column] LIKE '%Own%', 'Own',
            IF(
                [column] LIKE '%Alone or with Spouse%' or [column] LIKE '%Clean & Sober%' or [column] LIKE '%Roommates%' or [column] LIKE '%Group Home%' or [column] LIKE '%Temporary%' or [column] LIKE '%Parents%', 'Other Permanent Housing',
                IF(
                    [column] LIKE '%Other%', 'Other','Unknown/not reported'
                )
            )
        )
    )
 )

 IF(
    [column] LIKE '%SNAP%', 'SNAP / EBT / Food Stamps', ''
 )

 IF([column] LIKE '%TANF%','TANF','')

IF( [column]   <= 0.5 , 'Up to 50%', 
IF( (([column]   > 0.5 )) and (([column]   <= 0.75 )) , '51%-75%', 
IF( (([column]   > 0.75 )) and (([column]   <= 1 )) , '76%-100%', 
IF( (([column]   > 1 )) and (([column]   <= 1.25 )) , '101%-125%', 
IF( (([column]   > 1.25 )) and (([column]   <= 1.5 )) , '126%-150%', 
IF( (([column]   > 1.5 )) and (([column]   <= 1.75 )) , '151%-175%', 
IF( (([column]   > 1.75 )) and (([column]   <= 2 )) , '176%-200%',
IF( (([column]   > 2 )) and (([column]   <= 2.5 )) , '201%-250%',
IF( [column]   > 2.5  , '250% and over', 'Unknown') ) ) ) ) ) ) ) )

IF( [column]   <= 0.3 , '0-30%', 
IF( (([column]   > 0.3 )) and (([column]   <= 0.5 )) , '31%-50%', 
IF( (([column]   > 0.5 )) and (([column]   <= .8 )) , '51%-80%',
IF( [column]   > .8  , '80% and over', 'Unknown') ) ) )

IF([column] = 'Caucasian / White', 1, NULL)

IF([column] LIKE '%Asian%' and [column] LIKE '%White%', 1, NULL)

IF([column] LIKE '%American Indian / Alaskan Native%' and [column] LIKE '%Black%', 1, NULL)

 IF( [column]   like '%king%' , LEFT( [column]  , INSTR( [column]  , '|')  - 1 ) , 
 IF([column]   like '%snohomish%' 
    or [column] like '%pierce%','Outside KC', 'Unknown'))

IF([column] = 1,5271*12,
IF([column] = 2,6892*12,
IF([column] = 3,8514*12,
IF([column] = 4,10136*12,
IF([column] = 5,11758*12,
IF([column] = 6,13379*12,
IF([column] = 7,13683*12,'')))))))

IF([column] < .3,'Very low Income (<30% AMI)',
IF([column] >= .3 and [column] < .5, 'Low Income (<50% AMI)',
IF([column] >= .5 and [column] < .8, 'Moderate Income (<80% AMI)',
IF([column] >= .8,'Above Moderate (>80% AMI)','Unknown'))))

('Auburn','Bellevue','Burien','Covington','Des Moines','Federal Way','Issaquah','Kenmore','Kent','Kirkland','Mercer Island','Redmond','Renton','Sammamish','SeaTac','Shoreline','Tukwila','Seattle','Other KC','Outside KC','Unknown')

IF([column]='Caucasian / White','White',
IF([column]='Asian','Asian',
IF([column]='American Indian / Alaskan Native','American Indian or Alaskan Native',
IF([column]='Black / African American','Black or African American',
IF([column]='Native Hawaiian / Other Pacific Islander','Native Hawaiian or Other Pacific Islander',
IF([column]='Other','Some Other Race',
IF([column]='Prefer Not to Disclose' or [column]='Unknown','Unknown','Multi-Racial')))))))

 IF( [column]   < 13 , '0-12', IF( (([column]   >= 13 )) and (([column]   <= 18 )) , '13-18', IF( (([column]   >= 19 )) and (([column]   <= 25 )) , '19-25', IF( (([column]   >= 26 )) and (([column]   <= 64 )) , '26-64', IF( (([column]   >= 65 )) and (([column]   <= 99 )) , '65+', IF( [column]   > 99 , 'Unknown', '') ) ) ) ) ) )
