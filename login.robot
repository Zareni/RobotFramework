*** Settings ***
Suite Setup       Open Chrome Browser
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Library           String
Resource          _mysetup.txt
Resource          _mykeywords.txt

*** Variables ***
${TMP_PATH}       /tmp

*** Test Cases ***
Login - success
    Go To    ${TESTURL}/login
    Login form page
    Sleep    1
    Input Text    id:Email    ${useremail}
    Input Text    id:Password    ${password}
    Click Element    xpath://input[@class='button-1 login-button']
    Wait Until Element Is Visible    xpath://a[contains(text(),'${useremail}')]
    Element Should Be Visible    xpath://a[contains(text(),'${useremail}')]
    Element Text Should Be    xpath://a[contains(text(),'${useremail}')]    ${useremail}
    Click Link    /logout

Login page -Handle alert
    Go To    ${TESTURL}/login
    Login form page
    Input Text    id:Email    ${useremail}
    Input Text    id:Password    ${password}
    Submit Form
    Handle Alert
    Close Browser

Login pasword - fail
    [Documentation]    The credentials provided are incorrect
    ...
    ...    Test user fail to login with ${useremail}
    Open Chrome Browser
    Go To    ${TESTURL}/login
    Login form page
    Input Text    id:Email    ${useremail}
    Capture Page Screenshot    email-{index}.png
    Input Password    id:Password    invalid
    Capture Page Screenshot    invalid-password-{index}.png
    Click Element    id:RememberMe
    Capture Page Screenshot    remeberMe-checkbox-{index}.png
    Click Element    xpath://input[@class='button-1 login-button']
    Sleep    5
    Capture Page Screenshot    after-submit-{index}.png
    The credentials provided are incorrect text
    Log To Console    user is fail to log

Login to fail- No customer account found
    [Documentation]    No customer account found
    Go To    ${TESTURL}/login
    Login form page
    ${random_email} =    Generate Random String    5    [NUMBERS]
    ${random_email} =    Set Variable    user-${random_email}-test@mailinator.com
    Set Suite Variable    ${random_email}
    Input Text    id:Email    ${random_email}
    Capture Page Screenshot    random-email-{index}.png
    Input Password    id:Password    ${password}
    Capture Page Screenshot    password-{index}.png
    Click Element    id:RememberMe
    Capture Page Screenshot    remeberMe-checkbox-{index}.png
    Click Element    xpath://input[@class='button-1 login-button']
    Sleep    1
    Capture Page Screenshot    after-submit-{index}.png
    No customer account found text
    Log To Console    User is fail to log - \ Login was unsuccessful. Please correct the errors and try again. No customer account found

*** Keywords ***
