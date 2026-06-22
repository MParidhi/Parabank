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
TC-E2E-03 - End-to-End Test
    [Documentation]  This test case performs an end-to-end test of the application, including user login, account creation, fund transfer and verifying debit amount is equal to credit amount.
    [Tags]    Hybrid

    Login User
    Create Savings Account
    ${source_id}=   Get New Account Id
    Sleep  7s
    ${initial_balance_source}=  Get Account Balance And Type    ${source_id}
    
    Create Savings Account
    ${dest_id}=  Get New Account Id
    Sleep    7s
    ${initial_balance_dest}=  Get Account Balance And Type    ${dest_id}
    Click Element    ${transfer_funds}
    Click Element    ${amount}
    Input Text    ${amount}    100
    Click Element    id=fromAccountId
    Wait Until Page Contains    ${source_id}
    Select From List By Value    id=fromAccountId    ${source_id}

    Click Element    id=toAccountId
    Wait Until Page Contains    ${dest_id}
    Select From List By Value    id=toAccountId    ${dest_id}
    Click Element    ${transfer_btn}
    Sleep    7s
    ${final_balance_source}=  Get Account Balance And Type   ${source_id}
    ${final_balance_dest}=  Get Account Balance And Type    ${dest_id}
    ${difference_dest}=    Evaluate    ${final_balance_dest} - ${initial_balance_dest}
    ${difference_source}=    Evaluate    ${initial_balance_source} - ${final_balance_source}
    Should Be Equal As Numbers    ${difference_dest}    ${difference_source}

    