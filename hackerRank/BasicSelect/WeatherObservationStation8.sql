SELECT DISTINCT CITY FROM STATION WHERE CITY REGEXP '^[ie|a|e|i|o|u]' AND
                                        CITY REGEXP '[ie|a|e|i|o|u]$';
