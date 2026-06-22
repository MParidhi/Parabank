*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/create_account_page.robot

Suite Setup  Load UI Environment
Test Setup  Open Application
Test Teardown  Close Application


*** Test Cases ***
TC-UI-04 - Create Checking Account
    [Documentation]  Verify that the user can create a checking account.
    [Tags]    UI

    Login Or Register User
    Create Checking Account