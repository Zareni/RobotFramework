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
    Go To    http://demowebshop.tricentis.com/
    Maximize Browser Window
    Click Element    xpath://a[@class='ico-login']
    Login form page
    Sleep    1
    Input Text    id:Email    ${useremail}
    Input Text    id:Password    ${password}
    Click Element    xpath://input[@class='button-1 login-button']
    Wait Until Element Is Visible    xpath://a[contains(text(),'${useremail}')]
    Element Should Be Visible    xpath://a[contains(text(),'${useremail}')]
    Element Text Should Be    xpath://a[contains(text(),'${useremail}')]    ${useremail}
    Click Link    /logout

Login page
    Go To    http://demowebshop.tricentis.com/
    Maximize Browser Window
    Click Element    xpath://a[@class='ico-login']
    Login form page
    Sleep    1
    Input Text    id:Email    ${useremail}
    Input Text    id:Password    ${password}
    Submit Form
    Handle Alert
    Sleep    3

Login pasword - fail
    [Documentation]    Test user fail to login with ${useremail}
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
    Alert message text dialog
    Log To Console    user is fail to log

Login email - fail

*** Keywords ***
