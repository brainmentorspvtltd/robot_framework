*** Settings ***
Resource          ../Resources/CustomKeywords.robot

*** Variables ***
${sheetname}=   Sheet1

*** Test Cases ***
Open Browser and Navigate to Facebook Test Functionality
    Open Browser and Navigate to Facebook

Input EmailId and Password
    ${rows}=    Read Number of Rows     ${sheetname}
    Log to console  ${rows}

#    ${email}=   Read Id and Password    ${sheetname}    1   1
#    ${pwd}=   Read Id and Password    ${sheetname}    1   2
#    input text      id:email    ${email}
#    input password  id:pass     ${pwd}
#    click button    xpath://*[text()="Log In"]

    FOR  ${i}   IN RANGE   1   ${rows}+1
        ${email}=   Read Id and Password    ${sheetname}    ${i}   1
        ${pwd}=   Read Id and Password    ${sheetname}    ${i}   2
        input text      id:email    ${email}
        input password  id:pass     ${pwd}
        click button    xpath://*[text()="Log In"]
        sleep   5 seconds
    END

