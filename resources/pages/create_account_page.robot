*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../../variables/create_account_locators.robot

*** Keywords ***
Create Savings Account
    [Documentation]    Creates a new savings account for the user.
    Click Element    ${open_acc}
    Select From List By Label    id=type    SAVINGS
    Sleep    5s
    Click Element    ${open_acc_btn}
    Sleep    5s

Get new account id
    [Documentation]    Get account id of newly created account.
    Wait Until Element Is Visible    ${acc_id}    10s
    Page Should Contain    Account Opened
    ${account_id}=    Get Text    ${acc_id}
    Log To Console    Created account with ID: ${account_id}
    RETURN    ${account_id}


Create Checking Account
    [Documentation]    Creates a new checking account for the user.
    Click Element    ${open_acc}
    Select From List By Label    id=type    CHECKING
    Sleep    5s
    Click Element    ${open_acc_btn}
    Sleep    5s
    Wait Until Element Is Visible    ${acc_id}    10s
    Page Should Contain    Account Opened
    ${account_id}=    Get Text    ${acc_id}
    Log To Console    Created account with ID: ${account_id}
    RETURN    ${account_id}

