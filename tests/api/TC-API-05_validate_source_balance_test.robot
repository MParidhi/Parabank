*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    XML
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Load API Environment
Test Setup     Create API Session

*** Test Cases ***
TC-API-05 - Verify source balance after transfer
    [Documentation]  Test case to verify amount transfer is equal as amount debited from source account
    [Tags]  API

    Login To Parabank
    Open new Account
    ${initial_balance}=   Get Account Balance And Type    ${ACCOUNT_ID_API}
    Transfer Funds_API    100
    ${final_balance}=   Get Account Balance And Type   ${ACCOUNT_ID_API}
    Log To Console    Initial Balance: ${initial_balance}
    Log To Console    Final Balance: ${final_balance}
    ${difference}=    Evaluate    ${initial_balance} - ${final_balance}

    Should Be Equal As Numbers    ${difference}    100
