*** Settings ***
Documentation    Test Facebook with Different Id and Password
Library          ../TestData/ReadWriteData.py
Library          SeleniumLibrary

*** Variables ***
${Browser}=     Chrome
${URL}=     https://www.facebook.com

*** Keywords ***
Open Browser and Navigate to Facebook
    open browser    ${URL}  ${Browser}
    maximize browser window

Read Number of Rows
    [arguments]     ${sheetname}
    ${rows}=    fetchRows   ${sheetname}
    [return]    ${rows}

Read Id and Password
    [arguments]     ${sheetname}    ${row}  ${col}
    ${celldata}=    fetchIdPwd  ${sheetname}    ${row}  ${col}
    [return]    ${celldata}