*** Settings ***
Documentation    How to open browser using selenium library
Library          SeleniumLibrary

*** Variables ***
${URL}=     https://www.facebook.com
${BROWSER}=    Chrome

*** Keywords ***
Enter EmailID and Password
    input text  name:email  ravi@gmail.com
    input password  name:pass   1234
    click link  xpath://a[text()='Create New Account']

*** Test Cases ***
Test Case to open browser
    open browser    ${URL}      ${BROWSER}
    maximize browser window
    Enter EmailID and Password

#    close browser