*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    XML
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Load API Environment
Test Setup    Create API Session

*** Test Cases ***
TC-API-04 - Verify account details
    [Documentation]    Test case to verify that the balance and type of account are valid.
    [Tags]    API

    Login To Parabank
    Open New Account
    Log To Console    Account balance: ${NEW_ACCOUNT_BALANCE}
    Log To Console    Account type: ${NEW_ACCOUNT_TYPE}
    Should Contain Any    ${NEW_ACCOUNT_TYPE}    LOAN   CHECKING   SAVINGS
    Should Not Be Empty    ${NEW_ACCOUNT_BALANCE}

