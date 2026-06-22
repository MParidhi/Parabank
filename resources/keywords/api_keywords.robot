*** Settings ***
Library    XML
Library    RequestsLibrary
Library    Collections
Library    ../../config/environment.py

*** Variables ***
${API_ENV}    qa_api

*** Keywords ***
Load API Environment
    Load Env    ${API_ENV}

    ${baseurl_api}=    Get Env    baseurl_api
    ${username}=       Get Env    username
    ${password}=       Get Env    password
    ${account_id}=      Get Env    account_id

    Set Global Variable    ${BASE_URL_API}        ${baseurl_api}
    Set Global Variable    ${USERNAME_API}        ${username}
    Set Global Variable    ${PASSWORD_API}        ${password}
    Set Global Variable    ${ACCOUNT_ID_API}     ${account_id}

Create API Session
    Create Session
    ...    parabank
    ...    ${BASE_URL_API}
    ...    verify=False

Validate Status Code
    [Arguments]    ${response}    ${expected_code}

    Should Be Equal As Integers
    ...    ${response.status_code}
    ...    ${expected_code}

Login To Parabank
    [Documentation]    Logs into Parabank API and stores session

    ${response}=    Get On Session
    ...    parabank
    ...    /login/${USERNAME_API}/${PASSWORD_API}

    Validate Status Code     ${response}    200

    Log To Console    ${response.text}
    ${xml}=    Parse XML    ${response.text}
    ${customer_id}=    Get Element Text    ${xml}    id
    Log To Console    Customer ID: ${customer_id}
    Set Test Variable    ${CUSTOMER_ID_API}  ${customer_id}

Open new Account
    [Documentation]    Opens a new account for the logged-in customer and stores the account ID
    
    ${params}=    Create Dictionary
...    customerId=${CUSTOMER_ID_API}
...    newAccountType=1
...    fromAccountId=${ACCOUNT_ID_API}

    ${response}=    Post On Session
    ...    parabank
    ...    /createAccount
    ...    params=${params}

    Validate Status Code     ${response}    200

    Log To Console    ${response.text}
    ${body}=    Parse XML    ${response.text}
    ${account_id}=    Get Element Text    ${body}    id
    ${type}=    Get Element Text    ${body}    type
    ${balance}=    Get Element Text    ${body}    balance
    Log To Console    New Account ID: ${account_id}
    Set Test Variable    ${NEW_ACCOUNT_ID}  ${account_id}
    Set Test Variable    ${NEW_ACCOUNT_TYPE}  ${type}
    Set Test Variable    ${NEW_ACCOUNT_BALANCE}  ${balance}
    
Transfer Funds_API
    [Documentation]    Transfers funds between two accounts
    [Arguments]    ${amount}

    ${params}=    Create Dictionary
    ...    fromAccountId=${ACCOUNT_ID_API}
    ...    toAccountId=${NEW_ACCOUNT_ID}
    ...    amount=${amount}    
    
    ${response}=    Post On Session
    ...    parabank
    ...    /transfer
    ...    params=${params}
    
    Validate Status Code     ${response}    200

Get Account Balance and Type
    [Documentation]    Gets the balance and type of account for a particular account id
    [Arguments]    ${account_id}

    ${response}=    GET On Session
    ...    parabank
    ...    /accounts/${account_id}
    Log To Console    ${response.text}

    ${body}=    Parse XML    ${response.text}
    ${balance}=    Get Element Text    ${body}    balance
    ${type}=    Get Element Text    ${body}    type

    Log To Console    Balance: ${balance}
    Log To Console    Type: ${type}
    Should Contain Any    ${type}    LOAN   CHECKING   SAVINGS
    Should Not Be Empty    ${balance}

    RETURN   ${balance}
    
    
    


