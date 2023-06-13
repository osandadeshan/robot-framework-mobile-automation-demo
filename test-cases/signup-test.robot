*** Settings ***
Resource         ../object-repository/page-objects/NavigationBarPo.robot
Resource         ../object-repository/page-objects/LoginScreenPo.robot
Resource         ../constants/LoginConstants.robot
Resource         ../constants/AlertConstants.robot

Test Setup       Open Test Application
Test Teardown    Close Application


*** Test Cases ***
Verify That A New User Can Sign Up To The Application
    [Tags]    Smoke

    Navigate To Login Screen
    Click On The 'Sign up' Container
    ${emailAddress}    Get Random Email Address
    Sign Up To The Application [Arguments] ${emailAddress} ${PASSWORD} ${PASSWORD}
    Alert Title Should Be [Arguments] ${SIGNED_UP_SUCCESS_ALERT_TITLE}
    Alert Message Should Be [Arguments] ${SIGNED_UP_SUCCESS_ALERT_MESSAGE}
