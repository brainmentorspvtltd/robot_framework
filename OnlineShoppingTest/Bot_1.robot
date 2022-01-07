*** Settings ***
Documentation    Testing Online Shopping App
Library          SeleniumLibrary
Library          Collections
Test Setup       Open Browser and redirect to flipkart

*** Variables ***
${URL}=     https://www.flipkart.com/search?q=mi+tv
${BROWSER}=    Chrome
${ProductName}=  Mi 4A Pro 108 cm (43 inch) Full HD LED Smart Android TV

*** Test Cases ***
#Login to flipkart
#Search Product

Validate Products
#    Verify product titles on search page
    Select the product     ${ProductName}


*** Keywords ***
Open Browser and redirect to flipkart
    open browser    ${URL}  ${BROWSER}
    maximize browser window

#Verify product titles on search page
#    @{expectedResults} =  Create List     APPLE iPhone 12 (Black, 64 GB)  APPLE iPhone 12 (Blue, 128 GB)  APPLE iPhone 12 (Red, 128 GB)
#    ${elements} =  get webelements      css:._4rR01T
#    @{actualResults} =  Create List
#    FOR     ${element}  IN  @{elements}
#        Log  ${element.text}
#        Append To List    ${actualResults}    ${element.text}
#    END
#
#    lists should be equal   ${expectedResults}  ${actualResults}


Select the product
    [arguments]     ${p_name}
    ${elements} =  get webelements      css:._4rR01T
    ${index}=   Set Variable    1
    FOR     ${element}  IN  @{elements}
        Exit For Loop If    '${p_name}' == '${element.text}'
        ${index}=  Evaluate  ${index} + 1
    END

    click link  xpath:(//*[@class='_1fQZEK'])[${index}]

    ${handles}=  get window handles
    switch window   ${handles}[1]
    click button  xpath:(//*[@class ='_2KpZ6l _2U9uOA _3v1-ww'])


