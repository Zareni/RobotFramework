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
register user - success
    Go To    ${TESTURL}
    Click Link    /register
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
    Sleep    5
    Log To Console    user register - success
    Capture Page Screenshot    register-sucess-{index}.png
    Register sucess
    Click Link    /logout

register user- fail
    Go To    ${TESTURL}
    Click Link    /register
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
    Input Text    id:ConfirmPassword    wrongpassword
    Click Button    id:register-button
    Sleep    5
    Log To Console    user register - fail
    Capture Page Screenshot    register-fail-{index}.png
    Wait Until Element Is Visible    xpath://span[contains(text(),'The password and confirmation password do not matc')]
    Element Should Be Visible    xpath://span[contains(text(),'The password and confirmation password do not matc')]
    Element Text Should Be    xpath://span[contains(text(),'The password and confirmation password do not matc')]    The password and confirmation password do not match.
