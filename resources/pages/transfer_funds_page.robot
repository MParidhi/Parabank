*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/transfer_funds_locators.robot

*** Keywords ***
Transfer Funds
    [Documentation]    Transfers funds between accounts.
    [Arguments]    ${amount_value}     ${dest_account}
    Click Element    ${transfer_funds}
    Wait Until Element Is Visible    ${transfer_btn}    10s
    Click Element    ${amount}
    Input Text    ${amount}    ${amount_value}
    Click Element    id=toAccountId
    Wait Until Page Contains    ${dest_account}    10s
    Select From List By Value    id=toAccountId    ${dest_account}
    Sleep   5s
    Click Element    ${transfer_btn}
    Sleep    5s
    Set Test Variable    ${TRANSFER_AMOUNT}    ${amount_value}

Assert Transfer Success
    [Documentation]    Asserts that the transfer was successful and amount is displayed correctly.
    Page Should Contain    Transfer Complete!
    Page Should Contain    ${TRANSFER_AMOUNT}



