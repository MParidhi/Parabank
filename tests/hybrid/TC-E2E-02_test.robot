*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    XML

Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/transfer_funds_page.robot
Resource    ../../resources/pages/create_account_page.robot
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup       Load UI Environment

Test Setup        Run Keywords
...               Open Application
...               AND
...               Load API Environment
...               AND
...               Create API Session

Test Teardown     Close Application


*** Test Cases ***
TC-E2E-02 - End-to-End Test
    [Documentation]  This test case performs an end-to-end test of the application, including user login, account creation, fund transfer, validating amount and logout.
    [Tags]    Hybrid

    Login User
    Create Savings Account
    ${account_id}=  Get New Account Id
    Sleep  6s
    ${initial_balance}=  Get Account Balance And Type    ${account_id}
    Log To Console    Initial Balance: ${initial_balance}
    Transfer Funds    100     ${account_id}
    ${final_balance}=  Get Account Balance And Type    ${account_id}
    Log To Console    Final Balance: ${final_balance}
    ${difference}=    Evaluate    ${final_balance} - ${initial_balance}
    Should Be Equal As Numbers    ${difference}    100
    Logout User
    