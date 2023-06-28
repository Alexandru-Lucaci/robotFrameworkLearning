*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        edge
${URL}            https://www.google.com

*** Test Cases ***
Test Case
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Window Size    800    600
    Close Browser
