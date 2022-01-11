*** Settings ***
Documentation    Suite description
Library          CustomKeywords.py

*** Variables ***
${FolderName}=      Folder_2

*** Test Cases ***
Testing Python Using Robot
    Create Directory Using Python

*** Keywords ***
Create Directory Using Python
    ${msg}=    createFolder    ${FolderName}
    Log to console  ${msg}

