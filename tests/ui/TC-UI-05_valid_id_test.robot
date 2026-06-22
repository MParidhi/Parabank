*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/create_account_page.robot

Suite Setup  Load UI Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-UI-05 - Verify Valid ID
    [Documentation]  Verify that new account id created is valid.
    [Tags]    UI

    Login Or Register User
    Create Savings Account
    ${account_id}=  Get New Account Id
    Should Match Regexp    ${account_id}    ^[0-9]{5}$
    Log To Console    Account id is valid



