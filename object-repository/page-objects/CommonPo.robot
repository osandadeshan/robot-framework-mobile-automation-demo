*** Settings ***
Resource    ../../configs/ApplicationConfigs.robot
Resource    ../../configs/AppiumConfigs.robot

Library    String
Library    OperatingSystem
Library    AppiumLibrary


*** Keywords ***
Open Test Application
    [Documentation]    Open the testing application
    
    Run Keyword If    '${PLATFORM_NAME}' == '${ANDROID_PLATFORM_NAME}'    Open Android Application
    Run Keyword If    '${PLATFORM_NAME}' == '${IOS_PLATFORM_NAME}'    Open IOS Application


Open Android Application
    [Documentation]    Open the Android application

    Open Application    ${APPIUM_SERVER_URL}    automationName=${ANDROID_AUTOMATION_NAME}    platformName=${ANDROID_PLATFORM_NAME}    platformVersion=${ANDROID_PLATFORM_VERSION}    deviceName=${ANDROID_DEVICE_NAME}    app=${ANDROID_APP}    appPackage=${ANDROID_APP_PACKAGE}    appActivity=${ANDROID_APP_ACTIVITY}
    Set Appium Timeout    ${TIMEOUT}


Open IOS Application
    [Documentation]    Open the iOS application

    Open Application    ${APPIUM_SERVER_URL}    automationName=${IOS_AUTOMATION_NAME}    platformName=${IOS_PLATFORM_NAME}    platformVersion=${IOS_PLATFORM_VERSION}    deviceName=${IOS_DEVICE_NAME}    app=${IOS_APP}
    Set Appium Timeout    ${TIMEOUT}


Get Random Email Address
    [Documentation]    Return random email address
    
    ${randomText}    Get Random Text
    ${randomEmailAddress}    Set Variable    ${randomText}@mailinator.com
    Return From Keyword     ${randomEmailAddress}


Get Random Text
    [Documentation]    Return random text value
      
    ${randomText}    Generate Random String      8      [LETTERS]
    Return From Keyword     ${randomText}
 
      
Get Current Epoch Time
    [Documentation]    Return current epoch time
    
    ${randomText}    Get Time    epoch
    Return From Keyword     ${randomText}


Element Should Be Contained In The Page [Arguments] ${locator} ${retryScale}
    [Documentation]    Verify that the element should be contained in the page

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Page Contains Element    ${locator}
    

Element Should Not Be Contained In The Page [Arguments] ${locator} ${retryScale}
    [Documentation]    Verify that the element should not be contained in the page

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Page Does Not Contain Element   ${locator}


Element Should Be Visible [Arguments] ${locator} ${retryScale}
    [Documentation]    Verify that the element should be visible

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Visible    ${locator}


Element Should Not Be Visible [Arguments] ${locator} ${retryScale}
    [Documentation]    Verify that the element should not be visible

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Page Does Not Contain Element   ${locator}


Click Element [Arguments] ${locator} ${retryScale}
    [Documentation]    Click on a given button

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Visible    ${locator}
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Click Element  ${locator}
    
    
Element Text Should Be [Arguments] ${locator} ${text} ${retryScale}
    [Documentation]    Validate the text of an element

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Visible    ${locator}
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Element Text Should Be    ${locator}    ${text}    


Input Text [Arguments] ${textBoxLocator} ${text} ${retryScale}
    [Documentation]    Input text into a text box

    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Wait Until Element Is Visible    ${textBoxLocator}
    Wait Until Keyword Succeeds    ${retryScale}     ${RETRY_DELAY}    Input Text    ${textBoxLocator}    ${text}


Alert Title Should Be [Arguments] ${alertTitle}
    [Documentation]    Validate the text of the alert title

    ${androidAlertTitleLocator}    Set Variable    id=android:id/alertTitle
    Run Keyword If    '${PLATFORM_NAME}' == '${ANDROID_PLATFORM_NAME}'    Element Text Should Be [Arguments] ${androidAlertTitleLocator} ${alertTitle} ${SMALL_RETRY_COUNT}
    ${iosAlertTitleLocator}    Set Variable    accessibility_id=${alertTitle}
    Run Keyword If    '${PLATFORM_NAME}' == '${IOS_PLATFORM_NAME}'    Element Should Be Visible [Arguments] ${iosAlertTitleLocator} ${SMALL_RETRY_COUNT}


Alert Message Should Be [Arguments] ${alertMessage}
    [Documentation]    Validate the text of the alert message

    ${androidAlertMessageLocator}    Set Variable    id=android:id/message
    Run Keyword If    '${PLATFORM_NAME}' == '${ANDROID_PLATFORM_NAME}'    Element Text Should Be [Arguments] ${androidAlertMessageLocator} ${alertMessage} ${SMALL_RETRY_COUNT}
    ${iosAlertMessageLocator}    Set Variable    accessibility_id=${alertMessage}
    Run Keyword If    '${PLATFORM_NAME}' == '${IOS_PLATFORM_NAME}'    Element Should Be Visible [Arguments] ${iosAlertMessageLocator} ${SMALL_RETRY_COUNT}
