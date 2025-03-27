*** Settings ***
Resource    ../resources/variables.robot
Resource    ../resources/keywords.robot
Suite Teardown    Teardown

*** Test Cases ***
Reg New User
    [Documentation]    Положительный тест кейс на регистрацию пользователя
    ${headers} =    Create Dictionary    Content-Type=application/json
    ${body} =    Create Dictionary    username=${username}    password=${password}    confirmPassword=${password}

    ${response} =    POST    ${BASE_URL}/register    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200

    Teardown

Failed Reg User Again
    [Documentation]    Негативный тест кейс на повторную регистрацию пользователя
    ${headers} =    Create Dictionary    Content-Type=application/json
    ${body} =    Create Dictionary    username=${username}    password=${password}    confirmPassword=${password}

    ${response} =    POST    ${BASE_URL}/register    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200

    ${ignored_response} =    Run Keyword And Ignore Error    POST    ${BASE_URL}/register    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${ignored_response[0]}    FAIL

    Teardown

Login User
    [Documentation]    Положительный тест кейс на авторизацию пользователя
    Setup user

    ${headers} =    Create Dictionary    Content-Type=application/json
    ${body} =    Create Dictionary    username=${username}    password=${password}

    ${response} =    POST    ${BASE_URL}/login    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200

    ${response} =    POST    ${BASE_URL}/logout    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200

    Teardown

Failed Login User With Wrong Password
    [Documentation]    Негативный тест кейс на авторизацию пользователя с неправильным паролем
    Setup user

    ${headers} =    Create Dictionary    Content-Type=application/json
    ${body} =    Create Dictionary    username=${username}    password=${wrongpassword}

    ${response} =    POST    ${BASE_URL}/login    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.url}    /login?error

    Teardown

Failed Login With Unexistent User
    [Documentation]    Негативный тест кейс на авторизацию несуществующего пользователя
    ${headers} =    Create Dictionary    Content-Type=application/json
    ${body} =    Create Dictionary    username=${wrongusername}    password=${wrongpassword}

    ${response} =    POST    ${BASE_URL}/login    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.url}    /login?error




*** Keywords ***
Teardown
    Delete user    ${username}

Setup user
    ${headers} =    Create Dictionary    Content-Type=application/json
    ${body} =    Create Dictionary    username=${username}    password=${password}    confirmPassword=${password}

    ${response} =    POST    ${BASE_URL}/register    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200

*** Variables ***
${username}    usermuser
${password}    usermuser
${wrongusername}    wrongusername
${wrongpassword}    wrongpassword
