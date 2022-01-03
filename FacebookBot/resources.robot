*** Settings ***
Documentation    This is my resoirce file
Library          SeleniumLibrary

*** Variables ***
${URL}=     https://www.facebook.com
${BROWSER}=    Chrome

${firstname}=   Ravi
${lastname}=    Tyagi
${email}=       ravi@gmail.com
${conf_email}=  ravi12@gmail.com
${success_conf_email}=  ravi@gmail.com
${password}=    ravi12345
${day}=         15
${month}=       11
${year}=        1990
${gender}=      2

*** Keywords ***
Open Browser and redirect to facebook register form
    open browser    ${URL}  ${BROWSER}
    maximize browser window
    click link  xpath://a[text()='Create New Account']

