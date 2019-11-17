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
register - success
    Go To    ${TESTURL}
    Click Link    /register
    #register page
    Element Should Be Visible    xpath://div[@class='page registration-page']
    Element Should Be Visible    xpath://h1[contains(text(),'Register')]
    Element Text Should Be    xpath://h1[contains(text(),'Register')]    Register
    Element Should Be Visible    xpath://div[@class='page-body']
    Element Should Be Visible    xpath://div[@class='page-body']/div[2]
    #Your Personal Details dialog
    Element Should Be Visible    xpath://strong[contains(text(),'Your Personal Details')]
    Element Text Should Be    xpath://strong[contains(text(),'Your Personal Details')]    Your Personal Details
    Element Should Be Visible    xpath://label[contains(text(),'Gender:')]
    Element Text Should Be    xpath://label[contains(text(),'Gender:')]    Gender:
    Radio Button Should Not Be Selected    group_name=Gender
    Element Text Should Be    xpath=//label[contains(text(),'First name:')]    First name:
    Element Should Be Enabled    id:FirstName
    Element Should Be Visible    xpath://label[contains(text(),'Last name:')]
    Element Text Should Be    xpath://label[contains(text(),'Last name:')]    Last name:
    Element Should Be Enabled    id:LastName
    Element Should Be Visible    xpath://label[contains(text(),'Email:')]
    Element Text Should Be    xpath://label[contains(text(),'Email:')]    Email:
    Element Should Be Enabled    id:Email
    #Your Password dialog
    Element Should Be Visible    xpath=//strong[contains(text(),'Your Password')]
    Element Text Should Be    xpath=//strong[contains(text(),'Your Password')]    Your Password
    Element Should Be Visible    xpath://label[contains(text(),'Password:')]
    Element Text Should Be    xpath://label[contains(text(),'Password:')]    Password:
    Element Should Be Visible    xpath://label[contains(text(),'Confirm password:')]
    Element Text Should Be    xpath://label[contains(text(),'Confirm password:')]    Confirm password:
    Element Should Be Visible    id:register-button
    Element Should Be Enabled    id:register-button
    Element Should Be Visible    id:register-button

register - fail
