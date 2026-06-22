*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/register_page.robot

Suite Setup  Load UI Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC_NEG_03 - Register user with empty fields
    [Documentation]  Verify that user cant register if all fields are empty.
    [Tags]    Negative-UI

    Register Button
    Create Submit Button
    Page Should Contain    required