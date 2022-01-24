*** Settings ***
Documentation    Suite description
Library          RequestsLibrary
Library          Collections

*** Variables ***
${PATH}=   https://api.openweathermap.org/data/2.5/weather?q=delhi&appid=83e01e3dce5d28839bb5a177cb51af12

*** Test Cases ***
Testing Weather API Get Request
    Get Response
    Test for name

*** Keywords ***
Get Response
    ${response}=  GET  ${PATH}   expected_status=200
    log   ${response.json()}
    status should be    200

Test for name
    dictionary should contain key  ${response.json()}   name
    Should be equal as strings    Delhi    ${response.json()}[name]
