*** Settings ***
Library    SeleniumLibrary
Resource    ../../variables/register_locators.robot

*** Keywords ***
Register Button
    [Documentation]    Clicks the register button to navigate to the registration form.
    Click Element    ${register_field}
    Sleep  5s

Register User
    [Documentation]    Registers a new user with the provided details.
    [Arguments]    ${first_name}    ${last_name}    ${address}    ${city}    ${state}    ${zip_code}  ${mobile}   ${ssn}    ${username}    ${password}    ${confirm_password}
    Wait Until Element Is Visible    ${firstname_field}    10s
    Click Element    ${firstname_field}
    Input Text    ${firstname_field}   ${first_name}
    Click Element    ${lastname_field}
    Input Text    ${lastname_field}   ${last_name}
    Click Element    ${address_field}
    Input Text    ${address_field}   ${address}
    Click Element    ${city_field}
    Input Text    ${city_field}   ${city}
    Click Element    ${state_field}
    Input Text    ${state_field}   ${state}
    Click Element    ${zipcode_field}
    Input Text    ${zipcode_field}   ${zip_code}
    Click Element    ${mobile_field}
    Input Text    ${mobile_field}   ${mobile}
    Click Element    ${ssn_field}
    Input Text    ${ssn_field}   ${ssn}
    Click Element    ${username_field}
    Input Text    ${username_field}   ${username}
    Click Element    ${password_field}
    Input Text    ${password_field}   ${password}
    Click Element    ${confirm_password_field}
    Input Text    ${confirm_password_field}   ${confirm_password}

Create Submit Button
    [Documentation]    Creates a submit button for the registration form.
    Click Element    ${register_button_field}
    Sleep  10s


