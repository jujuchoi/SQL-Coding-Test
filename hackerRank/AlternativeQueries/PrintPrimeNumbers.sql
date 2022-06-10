CREATE TABLE Nonprimenumber(num INT PRIMARY KEY);
DELIMITER $$
CREATE PROCEDURE myFunction()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE (i <= 1000) DO
        INSERT INTO `Nonprimenumber` VALUE(i);
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;
CALL myFunction();

DELIMITER $$
CREATE PROCEDURE loop_test()
BEGIN
    DECLARE k INT DEFAULT 2;
    WHILE(k <= 1000) DO
        DELETE FROM Nonprimenumber WHERE num % k = 0 AND num / k > 1;
        SET k = k + 1;
    END WHILE;
    DELETE FROM Nonprimenumber WHERE num = 1;
END$$
DELIMITER ;
CALL loop_test();
SELECT GROUP_CONCAT(num separator '&') FROM Nonprimenumber;
