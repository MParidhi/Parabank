*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/create_account_page.robot

Suite Setup  Load UI Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-UI-03 - Create Savings Account
    [Documentation]  Verify that the user can create a savings account.
    [Tags]    UI

    Login Or Register User
    Create Savings Account
    ${account_id}=  Get New Account Id
    Log To Console    ${account_id}