*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot

Suite Setup  Load UI Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-UI-02 - Login with valid credentials
    [Documentation]  Verify that the user can log in with valid credentials.
    [Tags]    UI

    Login Or Register User

