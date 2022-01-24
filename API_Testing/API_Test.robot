*** Settings ***
Documentation    Suite description
Library          RequestsLibrary
Library          Collections

*** Variables ***
${BASE_URL}=    https://www.brain-mentors.com

*** Test Cases ***
Testing API
    &{req_body}=    Create Dictionary   name=Ravi   company=BrainMentors   website=https://www.brain-mentors.com
    ${response}=  POST    ${BASE_URL}/Login     json=${req_body}  expected_status=200
    log  ${response.json()}
    dictionary should contain key   ${response.json()}  xyz
