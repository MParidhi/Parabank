*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/register_page.robot

Suite Setup  Load UI Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-UI-01 - Register user with valid details
    [Documentation]  Verify that the user can register with valid details.
    [Tags]    UI

    Register Button
    Register User    Paridhi  Mehta  123 Main St  Jaipur  Rajasthan  12345  8901234567  123  Paridhii  Megha@345  Megha@345
    Create Submit Button
    Page Should Contain    You are now logged in
    