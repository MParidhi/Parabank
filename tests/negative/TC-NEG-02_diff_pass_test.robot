*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../resources/pages/register_page.robot

Suite Setup  Load UI Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC_NEG_02 - Mismatched password
    [Documentation]  Verify that registration can't get complete if password and confirm password are different.
    [Tags]    Negative-UI

    Register Button
    Register User    John  Doe  123 Main St  Jaipur  Rajasthan  12345    8901234567  123  john  Doe@123  Doe@1234
    Create Submit Button
    Scroll Element Into View    ${register_button_field}
    Page Should Contain    Passwords did not match