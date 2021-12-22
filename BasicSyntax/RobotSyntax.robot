*** Settings ***
Documentation   This is robot framework syntax
...             This is next line of documentation
...             This is also the documentation part
Library         MyLib
Library         MyLib   With Name
Resource        keywords.robot
Suite Setup     Suite Setup..
Suite Teardown  Suite Teardown..
Variables       variables.py

*** Variables ***
${STRING}=  somename
${firstname}=   Ravi
${NUMBER_INT}=  ${1}
${NUMBER_FLOAT}=  ${1.5}
@{LIST}=    item_1  item_2  item_3
&{DICTIONARY}=  name=${firstname}   id=${NUMBER_INT}    items=@{LIST}

*** Keywords ***
Keywords Demo in Robot
    Log     No Argument

*** Keywords ***
Keywords Demo with arguments in Robot
    [Arguments]     ${argument} = Default Value
    Log     Required argument:  ${argument}
    Log     Optional argument:  ${argument}

*** Keywords ***
Keywords Demo with dynamic arguments in Robot
    [Arguments]     @{varargs}
    Log     Any number of arguments:  @{varargs}

*** Keywords ***
Keywords Demo with more than one arguments in Robot
    [Arguments]     ${argument} = Default Value     ${arg_2}    @{varargs}
    Log     One or More Arguments:  ${argument} @{varargs}

*** Keywords ***
Keywords Demo with return statement in Robot
    [Return]    Return Value

*** Keywords ***
All keywords with example
    A keyword with no argument
    A keyword with a required argument      Argument
    A keyword with a required argument      argument=Argument
    A keyword with a optional argument
    A keyword with any number of arguments  arg1    arg2    arg3

*** Tasks ***
Using Keywords in our Tasks
    ${value}=   A keyword with no argument
    Log     ${value}

*** Test Cases ***
Test Cases Demo
    open browser    ${URL}      ${Browser}
