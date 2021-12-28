*** Settings ***
Documentation    Suite description

*** Variables ***
${Age}=     ${10}
@{Names}=   Ram     Shyam       Namit       Sumit

*** Tasks ***
#Conditional Statements
#    IF  ${Age} > 18
#        Log to console     Eligible to vote
#    ELSE IF     ${Age} < 18
#        Log to console     Not Eligible to vote
#    ELSE
#        Log     Not a valid candidate
#    END

#Simple For Loop Demo
#    FOR     ${index}    IN RANGE   1   10
#        Log to console  ${index}
#    END

#Loop Over a List
#    FOR     ${item}     IN      @{Names}
#        Log to console  ${item}
#    END

Loop with IF
    FOR     ${item}     IN      @{Names}
        Exit For Loop If  "${item}" == "Namit"
        Log to console  ${item}
    END
