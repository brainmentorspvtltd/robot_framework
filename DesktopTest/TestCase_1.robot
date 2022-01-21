*** Settings ***
Documentation     Sikuli Library Demo
Test Setup        Add Needed Image Path
Test Teardown     Stop Remote Server
Library           SikuliLibrary

*** Variables ***
${IMAGE_DIR}     C:\\Users\\ASUS\\PycharmProjects\\RobotTraining\\screenshots\\img

*** Test Cases ***
Windows Notpad Hellow World
    Open Windows Start Menu

*** Keywords ***
Add Needed Image Path
    Add Image Path    ${IMAGE_DIR}

Open Windows Start Menu
    Click    img_1.png
