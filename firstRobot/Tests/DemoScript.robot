*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
This is my first test case
    My cool custom keyword
    My cool custom keyword
    open browser https://www.google.com  chrome
    

*** Keywords ***
My cool custom keyword
    log This is a Robot Framework test step!
    log to console Logging to console