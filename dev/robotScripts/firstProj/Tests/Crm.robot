*** Settings ***
Documentation       This is a test suite with a single test for opening a page in browser and closing it.
Library             SeleniumLibrary


# Run the script robot -d \\nas542\SharedFolderFor4TbHDD\results .\Crm.robot
*** Variables ***
${BROWSER}          chrome
${DELAY}            0.5s
${TIMEOUT}          5s
${page_site}        https://www.automationplayground.com/crm
${SignInId}         SignIn

*** Test Cases ***
Should be able to open the page
    [Documentation]         Should be able to laungh the browser and open the website
    [Tags]                  Smoke    Home    1001
    #Starting selenium
    Log                     Starting the test case
    Set Selenium Timeout    3s
    Set Selenium Speed      0.2s
    Open Browser            ${page_site}    ${BROWSER}
    #resize the browser window
    Log                     Move the browser position
    Set Window Position     x=341    y=169
    Sleep                   1s
    Log                     Set the browser size
    Set Window Size         800    600
    Sleep                   1s
    #maximize the browser window
    Log                     Maximize the browser window
    Maximize Browser Window
    #Sleeping time
    Log                     Waiting for 1 secunds
    Sleep                   1s
    Log                     Close the browser
    #Closing the browser
    Close Browser

Should be able to add new customer
    [Documentation]                 Should be able to add new customer
    [Tags]                          Contacts  1006    Smoke
    #Starting selenium
    Log                             Starting the test case
    Set Selenium Timeout            3s
    Set Selenium Speed              0.2s
    Open Browser                    ${page_site}    ${BROWSER}
    Page Should Contain             Customers Are Priority One!
    #maximize the browser window
    Log                             Maximize the browser window
    Maximize Browser Window
    #Sleeping time
    Log                             Waiting for 1 secunds
    Sleep                           1s
    #Click on the button
    Log                             Click on the Sign In button
#    Click Link            Sign In
#    Click Link            name=sign-in-link
#    Click Link            id=${SignInId}
    Click Link                      xpath=//*[@id="SignIn"]
    Log                             Trying to connect with an account
    Page Should Contain Button      id=submit-id
    #Input the login
    Log                             Input the login
    Input Text                      id=email-id    admin@a
    #Input the password
    Log                             Input the password
    Input Password                  id=password    admin123
#    try to connectr
    Log                             Try to connect
    Click Button                    id=submit-id
    Page Should Contain Link      id=new-customer
    #Im in the costumer page
    Log                             Add a new customer
    Click Link                      id=new-customer
    Log                             Input some data file
    Input Text                      id=FirstName    John
    Input Text                      id=LastName     Doe
    Input Text                      id=City        New York
    Input Text                      id=EmailAddress     something@gmail.com
    Click Element                   id=StateOrRegion
    Select From List By Value       id=StateOrRegion    AK
#    Click Element                   xpath=//*[@id="loginform"]/div/div/div/div/form/div[6]/input[1]
    Log                             Select the male gender
    Select Radio Button             gender    male
    Log                             Select the `Add to promotional list` checkbox
    Select Checkbox                 xpath=//*[@id="loginform"]/div/div/div/div/form/div[7]/input
    Log                             Unselect the `Add to promotional list` checkbox
    Sleep                           1s
    Unselect Checkbox               xpath=//*[@id="loginform"]/div/div/div/div/form/div[7]/input
    Log                             Select submit button
    Sleep                           3s
    Click Button                    Submit
    Page Should Contain Element     id=Success
*** Keywords ***
