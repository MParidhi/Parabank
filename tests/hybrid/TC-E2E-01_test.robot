*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    XML

Resource    ../../resources/keywords/common_keywords.robot
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
TC-E2E-01 - End-to-End Test
    [Documentation]  This test case performs an end-to-end test of the application, including user login, account creation, and API verification of account details.
    [Tags]    Hybrid

    Login User
    ${account_id}=  Create Checking Account

    Log To Console    ACCOUNT_ID=${account_id}

    Login To Parabank
    Get Account Balance And Type    ${account_id}