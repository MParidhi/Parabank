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
TC-NEG-04 - Get Accounts By Invalid Customer ID
    [Documentation]    Verify invalid customer ID returns 400 status code.
    [Tags]    Negative-API

    Login To Parabank

    ${response}=    GET On Session
    ...    parabank
    ...    /customers/99999999/accounts
    ...    expected_status=any  #reason-> 400 is expected, but we want to capture the response for validation but RequestsLibrary automatically fails the test when it receives a 4xx/5xx response

    Validate Status Code    ${response}    400

    Log To Console    Response: ${response.text}

