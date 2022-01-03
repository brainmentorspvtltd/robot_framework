*** Settings ***
Documentation    Testing Online Shopping App
Library          SeleniumLibrary
Library          Collections
Test Setup       Open Browser and redirect to flipkart

*** Variables ***
${URL}=     https://www.flipkart.com/search?q=iphone+12
${BROWSER}=    Chrome

*** Test Cases ***
#Login to flipkart
#Search Product

Validate Products
    Verify product titles on search page

*** Keywords ***
Open Browser and redirect to flipkart
    open browser    ${URL}  ${BROWSER}
    maximize browser window

Verify product titles on search page
    @{expectedResults} =  Create List     APPLE iPhone 12 (Black, 64 GB)  APPLE iPhone 12 (Blue, 128 GB)  APPLE iPhone 12 (Red, 128 GB)
    ${elements} =  get webelements      css:._4rR01T
    @{actualResults} =  Create List
    FOR     ${element}  IN  @{elements}
        Log  ${element.text}
        Append To List    ${actualResults}    ${element.text}
    END

    lists should be equal   ${expectedResults}  ${actualResults}
