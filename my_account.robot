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
Customer info

Addresses

Orders

Downloadable products

Back in stock subscriptions

Reward points

Change password
