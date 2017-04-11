*** Settings ***

Documentation	  Ruckus Wireless Monitoring Server User Interface Test
...
...               Python RobotFramework with Selenium 2 Library

Library           Selenium2Library


*** Variables ***

${Browser}        firefox


*** Test Cases ***

TestLogin
    Open Browser to the Login Page
    Enter User Name
    Enter Password
    Click Login

Test Dashboard
    Title Should Be    Dashboard | Ruckus WMS
    Page Should Contain    Dashboard
    Page Should Contain    Throughput
    Page Should Contain    Client Sessions
    Page Should Contain    Geo Distribution of Controllers
    Page Should Contain    Controllers by Country
    Page Should Contain    Access Points
    Page Should Contain    Controllers
    Page Should Contain    Events

Test Admin page

   Test Users page		 Administration	 Users	Accounts
   Test List pages		 Administration	 Tenants	tenants	 Tenants
   Test List page		 Administration	 Controller Authorization	controllerauthorization	Controller Authorization
   Test Datamanagement page      Administration  Data Management   Agent Management
   Test wmscluster page   	 Administration  WMS Cluster   Node Management
   Test List page		 Administration	 Smartzone Releases	releases	Smartzone Releases


Test Manage pages

    Test List page	Manage	Dashboards	manage	Dashboards
    Test List page	Manage	Clusters	clusters	Clusters
    Test List page	Manage	Zones	zone	Zones
    Test List page	Manage	Controllers	controller	Controllers
    Test List page	Manage	Access Points	accesspoints	Access Points
    Test List page	Manage	Client Devices	uedevices	Client Devices
    Test List page	Manage	Client Sessions	uesessions	Client Sessions

Test Report pages
    Test List page	Reporting	Alarms	alarms	Alarms
    Test List page	Reporting	Events	events	Events

Logout From WMS
    Mouse Over    partial link = ${USERNAME}
    Click Element    link = Sign out
    Page Should Contain    Successfully logged out!
    [Teardown]    Close Browser

*** Keywords ***

Open Browser to the Login Page
    open browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window

Enter User Name
    Input Text    username    ${Username}

Enter Password
    Input Text    password    ${Password}

Click Login
    Click Button  Sign In

Test Users page
    [Arguments]  	${mainmenu}   ${text}  ${item}
    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element   xpath=//*[@ui-sref='accounts']
    Sleep	2s
    Page Should Contain    ${item}
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element   xpath=//*[@ui-sref='groups']
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s

Test List pages
    [Arguments]	${mainmenu}	${submenu}    ${link}	${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}

Test List page
    [Arguments]	${mainmenu}	${submenu}    ${link}	${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s

Test Datamanagement page
    [Arguments]  	${mainmenu}   ${text}  ${item}
    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element   xpath=//*[@ui-sref='agents']
    Sleep	2s
    Page Should Contain    ${item}
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element   xpath=//*[@ui-sref='datalake']
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s


Test Wmscluster page
    [Arguments]  	${mainmenu}   ${text}  ${item}
    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element   xpath=//*[@ui-sref='nodes']
    Sleep	2s
    Page Should Contain    ${item}
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element   xpath=//*[@ui-sref='settings']
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s







