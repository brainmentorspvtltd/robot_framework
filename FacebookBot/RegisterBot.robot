*** Settings ***
Documentation    How to register on a website
Library          SeleniumLibrary
Test Setup       Open Browser and redirect to facebook register form
Resource         resources.robot

*** Variables ***
${Err_Msg_Selector}=    css:._5633._5634._53ij
${MY_STR}=  Your emails do not match. Please try again.

*** Test Cases ***
Validate Email Id
    Wait until form appears
    Validate Registration  ${email}    ${conf_email}
    wait until error message appears
    verify error message

*** Keywords ***
Wait until form appears
    wait until element is enabled   name:firstname  2   seconds

Validate Registration
    [arguments]     ${reg_email}    ${reg_conf_email}
    input text  name:firstname  ${firstname}
    input text  name:lastname   ${lastname}
    input text  name:reg_email__    ${reg_email}
    input text  name:reg_email_confirmation__   ${reg_conf_email}
    input password  name:reg_passwd__   ${password}
    select from list by value   name:birthday_day   ${day}
    select from list by value   name:birthday_month   ${month}
    select from list by value   name:birthday_year   ${year}
    select radio button     sex     ${gender}
    click button    name:websubmit

Wait until error message appears
    wait until element is enabled  ${Err_Msg_Selector}  2   seconds

Verify Error Message
#    ${msg}=     get text    ${Err_Msg_Selector}
#    Log to console  ${msg}
#    Should be Equal As Strings  ${msg}  ${MY_STR}
    element text should be  ${Err_Msg_Selector}     ${MY_STR}
