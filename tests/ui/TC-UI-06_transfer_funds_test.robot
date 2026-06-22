*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/transfer_funds_page.robot
Resource    ../../resources/pages/create_account_page.robot

Suite Setup  Load UI Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-UI-06 - Complete Transfer Funds
    [Documentation]  Verify that the user can transfer funds between accounts.
    [Tags]    UI

    Login Or Register User
    Create Savings Account
    ${account_id}=    Get New Account Id
    Transfer Funds    100    ${account_id}
