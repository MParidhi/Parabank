*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/register_page.robot

Suite Setup  Load UI Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC_NEG_01 - Register user with duplicate username
    [Documentation]  Verify that the user with duplicate username can't register.
    [Tags]    Negative-UI

    Register Button
    Register User    John  Doe  123 Main St  Jaipur  Rajasthan  12345    8901234567  123  john  Doe@123  Doe@123
    Create Submit Button
    Scroll Element Into View    ${register_button_field}
    Page Should Contain    This username already exists