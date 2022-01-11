*** Settings ***
Resource          ../Resources/CustomKeywords.robot

*** Variables ***
${sheetname}=   Sheet1

*** Test Cases ***
Open Browser and Navigate to Facebook Test Functionality
    Open Browser and Navigate to Facebook

Get Number of Rows to Test
    ${rows}=    Read Number of Rows     ${sheetname}
    Log to console  ${rows}

Input EmailId and Password
    ${email}=   Read Id and Password    ${sheetname}    1   1
    ${pwd}=   Read Id and Password    ${sheetname}    1   2
    input text      id:email    ${email}
    input password  id:pass     ${pwd}
    click button    xpath://*[text()="Log In"]

*** Keywords ***