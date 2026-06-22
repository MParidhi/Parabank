*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/transfer_funds_page.robot
Resource    ../../resources/pages/create_account_page.robot

Suite Setup  Load UI Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-UI-05 - Invalid Transfer Funds
    [Documentation]  It checks the behaviour on transferring $0 amount.
    [Tags]  Defect
    Skip    skipping due to BG-01
    Login Or Register User
    Create Savings Account
    ${account_id}=  Get New Account Id
    Transfer Funds    0   ${account_id}
    Page Should Contain    Transfer Complete
