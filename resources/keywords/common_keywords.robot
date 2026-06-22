*** Settings ***
Library  SeleniumLibrary
Library  ../../config/environment.py
Resource    ../pages/login_page.robot
Resource    ../pages/register_page.robot

*** Variables ***
${BROWSER}  chrome
${UI_ENV}  qa_ui

*** Keywords ***
Load UI Environment
    Load Env    ${UI_ENV}
    ${baseurl_ui}=  Get Env    baseurl_ui
    ${username}=  Get Env    username
    ${password}=  Get Env    password

    Set Global Variable    ${BASE_URL_UI}  ${baseurl_ui}
    Set Global Variable    ${USERNAME_UI}  ${username}
    Set Global Variable    ${PASSWORD_UI}  ${password}

Open Application
    [Documentation]  Opens the application
    Open Browser  ${BASE_URL_UI}  ${BROWSER}
    Maximize Browser Window
    Sleep    30

Close Application
    [Documentation]  Closing the application
    Close All Browsers

Login Or Register User
    [Documentation]  Performs register if login fails
    ${status}=    Run Keyword And Return Status    Login User

    IF    not ${status}
        Log    Login failed. Registering user...
        Register Button
        Register User    Paridhi    Mehta    123 Main St    Jaipur    Rajasthan    12345        8901234567    123    Paridhi    Megha@345    Megha@345
        Create Submit Button
        Logout User
        Login User
    END