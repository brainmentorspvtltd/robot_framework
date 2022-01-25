*** Settings ***
Documentation    Suite description
Library     Selenium2Library
Library     Dialogs
Library     CaptchaLibrary

*** Variables ***
${URL}=     https://haveibeenpwned.com/PwnedWebsites
${BROWSER}=  Chrome
${MY_EMAIL}=    ravi.py4all@gmail.com

*** Test Cases ***
Test Captcha
    Open Browser and Navigate
    Open Notify
    Input Email and Test Captcha

*** Keywords ***
Open Browser and Navigate
    open browser    ${URL}  ${BROWSER}
    maximize browser window

Open Notify
    click link  class:notifyOfPwning

Input Email and Test Captcha
    wait until element is visible   id:NotifyEmail  3  seconds
    input text      id:NotifyEmail   ${MY_EMAIL}
    wait until element is visible   xpath://*[@id="notifyMeForm"]/div[2]/div/div/div/iframe  3  seconds
    select frame    xpath://*[@id="notifyMeForm"]/div[2]/div/div/div/iframe
    click element   xpath://*[@id="recaptcha-anchor"]
    pause execution
    unselect frame
    click button    class:btn
