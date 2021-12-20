*** Settings ***
Documentation    Welcome to Robot Framework

*** Test Cases ***
Using for loop in robot
    FOR    ${index}    IN RANGE     1   10
        LOG     ${index}
    END