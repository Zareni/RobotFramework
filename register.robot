*** Settings ***
Suite Setup       Open Chrome Browser
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Library           String
Resource          _mykeywords.txt
Resource          _mysetup.txt

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Register -Wrong Email - fail
    Go To    ${TESTURL}/register
    Register page
    Click Button    id:register-button
    Register required fields
    Click Element    id:gender-male
    Clear Element Text    id:FirstName
    Input Text    id:FirstName    ${username}
    Capture Page Screenshot    register-random-userName-{index}.png
    Input Text    id:LastName    ${lastname}
    Clear Element Text    id:Email
    ${random_email} =    Generate Random String    5    [NUMBERS]
    ${random_email} =    Set Variable    user-${random_email}-test@mailinator
    Set Suite Variable    ${random_email}
    Input Text    id:Email    ${random_email}
    Capture Page Screenshot    register-random-doctor-email-{index}.png
    Clear Element Text    id:Password
    Input Text    id:Password    ${password}
    Clear Element Text    id:ConfirmPassword
    Input Text    id:ConfirmPassword    ${password}
    Click Button    id:register-button
    Capture Page Screenshot    wrong-email-{index}.png
    Wait Until Element Is Visible    xpath://span[contains(text(),'Wrong email')]
    Element Should Be Visible    xpath://span[contains(text(),'Wrong email')]
    Element Text Should Be    xpath://span[contains(text(),'Wrong email')]    Wrong email
    Log To Console    Wrong email

Register Short Pasword - fail
    [Documentation]    The password should have at least 6 characters.
    Go To    ${TESTURL}/register
    Register page
    Click Button    id:register-button
    Register required fields
    Click Element    id:gender-male
    Clear Element Text    id:FirstName
    Input Text    id:FirstName    ${username}
    Clear Element Text    id:LastName
    Input Text    id:LastName    ${lastname}
    Clear Element Text    id:Email
    ${random_email} =    Generate Random String    5    [NUMBERS]
    ${random_email} =    Set Variable    user-${random_email}-test@mailinator.com
    Set Suite Variable    ${random_email}
    Input Text    id:Email    ${random_email}
    Capture Page Screenshot    register-random-user-email-{index}.png
    Clear Element Text    id:Password
    ${short_pass} =    Generate Random String    5    [NUMBERS]
    ${short_pass}=    Set Variable    a
    Set Suite Variable    ${short_pass}
    Input Text    id:Password    ${short_pass}
    Capture Page Screenshot    short-password-{index}.png
    Clear Element Text    id:ConfirmPassword
    Input Text    id:ConfirmPassword    ${password}
    Click Button    id:register-button
    Log To Console    user register - success
    Capture Page Screenshot    register-sucess-{index}.png
    Wait Until Element Is Visible    xpath://span[contains(text(),'The password should have at least 6 characters.')]
    Element Should Be Visible    xpath://span[contains(text(),'The password should have at least 6 characters.')]
    Element Text Should Be    xpath://span[contains(text(),'The password should have at least 6 characters.')]    The password should have at least 6 characters.
    Log To Console    The password should have at least 6 characters.
    Wait Until Element Is Visible    xpath://span[contains(text(),'The password and confirmation password do not matc')]
    Element Should Be Visible    xpath://span[contains(text(),'The password and confirmation password do not matc')]
    Element Text Should Be    xpath://span[contains(text(),'The password and confirmation password do not matc')]    The password and confirmation password do not match.
    Log To Console    The password and confirmation password do not match.

Register - Pasword Confirmation - fail
    [Documentation]    The password and confirmation password do not match.
    Go To    ${TESTURL}/register
    Register page
    Click Button    id:register-button
    Register required fields
    Click Element    id:gender-male
    Clear Element Text    id:FirstName
    Input Text    id:FirstName    Test
    Clear Element Text    id:LastName
    Input Text    id:LastName    User
    Clear Element Text    id:Email
    ${random_email} =    Generate Random String    5    [NUMBERS]
    ${random_email} =    Set Variable    user-${random_email}-test@mailinator.com
    Set Suite Variable    ${random_email}
    Input Text    id:Email    ${random_email}
    Capture Page Screenshot    register-random-doctor-email-{index}.png
    Clear Element Text    id:Password
    Input Text    id:Password    ${password}
    Clear Element Text    id:ConfirmPassword
    Input Text    id:ConfirmPassword    wrongpassword
    Click Button    id:register-button
    Capture Page Screenshot    register-fail-{index}.png
    Wait Until Element Is Visible    xpath://span[contains(text(),'The password and confirmation password do not matc')]
    Element Should Be Visible    xpath://span[contains(text(),'The password and confirmation password do not matc')]
    Element Text Should Be    xpath://span[contains(text(),'The password and confirmation password do not matc')]    The password and confirmation password do not match.
    Log To Console    The password and confirmation password do not match.

Register User - success
    [Documentation]    Test registering user witn ${random_email} and logout
    Go To    ${TESTURL}/register
    Register page
    Click Button    id:register-button
    Register required fields
    #Select Radio Button    name:Gender    M
    Click Element    id:gender-male
    Clear Element Text    id:FirstName
    Input Text    id:FirstName    Test
    Clear Element Text    id:LastName
    Input Text    id:LastName    User
    Clear Element Text    id:Email
    ${random_email} =    Generate Random String    5    [NUMBERS]
    ${random_email} =    Set Variable    user-${random_email}-test@mailinator.com
    Set Suite Variable    ${random_email}
    Input Text    id:Email    ${random_email}
    Capture Page Screenshot    register-random-doctor-email-{index}.png
    Clear Element Text    id:Password
    Input Text    id:Password    ${password}
    Clear Element Text    id:ConfirmPassword
    Input Text    id:ConfirmPassword    ${password}
    Click Button    id:register-button
    Log To Console    user register - success
    Capture Page Screenshot    register-sucess-{index}.png
    Register sucess
    Click Link    /logout
