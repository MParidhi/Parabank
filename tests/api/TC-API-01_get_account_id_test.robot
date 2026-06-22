*** Settings ***
Library     RequestsLibrary
Library     OperatingSystem
Library     Collections
Library     XML
Library     String
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup    Load API Environment
Test Setup     Create API Session

*** Test Cases ***
TC-API-01 - Get Single Account By Account ID
    [Documentation]    Verify GET /accounts/{accountId} returns single account details.
    [Tags]    API

    Login To Parabank
    Open new Account
    Log To Console    Using Account ID: ${NEW_ACCOUNT_ID}

    ${response}=    GET On Session
    ...    parabank
    ...    /accounts/${NEW_ACCOUNT_ID}

    Validate Status Code    ${response}    200

    Log    ${response.text}

    ${body}=    Parse XML    ${response.text}

    ${id}=           Get Element Text    ${body}    .//id
    ${customerId}=   Get Element Text    ${body}    .//customerId
    ${type}=         Get Element Text    ${body}    .//type
    ${balance}=      Get Element Text    ${body}    .//balance

    Log To Console    Account ID: ${id}
    Log To Console    Customer ID: ${customerId}
    Log To Console    Type: ${type}
    Log To Console    Balance: ${balance}
