*** Settings ***
Documentation    Dictionary Demo using Robot Framework
Library          Collections

*** Test Cases ***
Test case for dictionary
    &{data}=  Create Dictionary    name=Ravi    company=BrainMentors    website=https://www.brain-mentors.com
    log  ${data}
    Dictionary Should Contain Key   ${data}     company
    log     ${data}[company]
    ${website_url}=  get from dictionary     ${data}  website
    log  ${website_url}

