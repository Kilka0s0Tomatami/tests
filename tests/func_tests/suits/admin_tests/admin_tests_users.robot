*** Settings ***
Resource    ../../resources/variables.robot
Resource    ../../resources/keywords.robot
Resource    ../../resources/admin_keywords.robot

*** Test Cases ***

Create User With Existing Username
    [Documentation]    Попытка создать пользователя с уже существующим логином
    ${response} =    Create User With Existing Username
    Should Be Equal As Strings    ${response.status_code}    409

Create User With Empty Fields
    [Documentation]    Попытка создать пользователя с пустыми полями
    ${response} =    Create User With Empty Fields
    Should Be Equal As Strings    ${response.status_code}    400

Delete Nonexistent User
    [Documentation]    Попытка удалить несуществующего пользователя
    ${response} =    Delete Nonexistent User
    Should Be Equal As Strings    ${response.status_code}    404

Update User Role To Invalid
    [Documentation]    Попытка изменить роль пользователя на несуществующую
    ${response} =    Update User Role To Invalid
    Should Be Equal As Strings    ${response.status_code}    400

Teardown
    Delete user    ${username}
    ${response} =    POST    ${BASE_URL}/logout    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Delete Book Edition SQL    ${book_id}