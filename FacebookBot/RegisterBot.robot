*** Settings ***
Documentation    How to register on a website
Library          SeleniumLibrary
Test Teardown    close browser

*** Variables ***
${URL}=     https://www.facebook.com
${BROWSER}=    Chrome
${Err_Msg_Selector}=    css:._5633._5634._53ij
${MY_STR}=  Your emails do not match. Please try again.

*** Test Cases ***
Validate Email Id
    Open Browser and redirect to facebook register form
    Wait until form appears
    Fill the registration form
    wait until error message appears
    verify error message

*** Keywords ***
Open Browser and redirect to facebook register form
    open browser    ${URL}  ${BROWSER}
    maximize browser window
    click link  xpath://a[text()='Create New Account']

Wait until form appears
    wait until element is enabled   name:firstname  2   seconds

Fill the registration form
    input text  name:firstname  Ravi
    input text  name:lastname   Tyagi
    input text  name:reg_email__    ravi@gmail.com
    input text  name:reg_email_confirmation__   ravi122@gmail.com
    input password  name:reg_passwd__   ravi@123456
    select from list by value   name:birthday_day   15
    select from list by value   name:birthday_month   11
    select from list by value   name:birthday_year   1990
    select radio button     sex     2
    click button    name:websubmit

Wait until error message appears
    wait until element is enabled  ${Err_Msg_Selector}  2   seconds

Verify Error Message
#    ${msg}=     get text    ${Err_Msg_Selector}
#    Log to console  ${msg}
#    Should be Equal As Strings  ${msg}  ${MY_STR}
    element text should be  ${Err_Msg_Selector}     ${MY_STR}
