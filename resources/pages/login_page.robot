*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/login_locators.robot

*** Keywords ***
Login User
    [Documentation]    Logs in a user using their username and password.
    Click Element    ${login_username}
    Input Text    ${login_username}    ${USERNAME_UI}
    Click Element    ${login_password}
    Input Text    ${login_password}    ${PASSWORD_UI}
    Click Element    ${login_button}
    Sleep    10s
    Page Should Contain    Accounts Overview

Logout User
    [Documentation]    Logs out the currently logged-in user.
    Click Element    ${logout_button}
    Sleep    5s

