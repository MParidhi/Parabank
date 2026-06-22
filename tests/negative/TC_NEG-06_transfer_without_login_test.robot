*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/keywords/common_keywords.robot
Resource    ../../variables/transfer_funds_locators.robot


Suite Setup  Load UI Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-UI-06 - Transfer Funds Without Login
    [Documentation]  Verify that user cant transfer funds without login and id=s redirected to login page.
    [Tags]  Defect
    Skip    skipping due to BG-02
    Click Element    ${transfer_funds}
    Page Should Not Contain    Customer Login

