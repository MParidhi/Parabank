*** Settings ***
Library     RequestsLibrary
Library     OperatingSystem
Library     Collections
Library     XML
Library     String
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup     Load API Environment
Test Setup      Create API Session


*** Test Cases ***
TC-API-02 - Get Accounts By Customer ID
    [Documentation]    Verify GET /customers/{customerId}/accounts returns valid account list.
    [Tags]    API

    Login To Parabank
    Log To Console    Using Customer ID: ${CUSTOMER_ID_API}

    ${response}=    GET On Session
    ...    parabank
    ...    /customers/${CUSTOMER_ID_API}/accounts

    Validate Status Code    ${response}    200

    Log    ${response.text}

    ${body}=    Parse XML    ${response.text}

    ${accounts}=    Get Elements    ${body}    .//account

    Should Not Be Empty    ${accounts}

    FOR    ${account}    IN    @{accounts}

        ${id}=        Get Element Text    ${account}    id
        ${type}=      Get Element Text    ${account}    type
        ${balance}=   Get Element Text    ${account}    balance

        Should Not Be Empty    ${type}
        Should Not Be Empty    float(${balance}) >= 0

        Log To Console    Account ID: ${id}
        Log To Console    Type: ${type}
        Log To Console    Balance: ${balance}

    END