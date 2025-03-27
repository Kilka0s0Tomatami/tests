*** Settings ***
Resource    ../../resources/variables.robot
Resource    ../../resources/keywords.robot
Resource    ../../resources/admin_keywords.robot

*** Test Cases ***
Login Admin
    Setup admin

Create Book Copy With Invalid Data
    [Documentation]    Попытка создать копию книги с некорректными данными
    ${response} =    Create Book Copy With Invalid Data
    Should Be Equal As Strings    ${response.status_code}    400

Delete Nonexistent Book Copy
    [Documentation]    Попытка удалить несуществующую копию книги
    ${response} =    Delete Nonexistent Book Copy
    Should Be Equal As Strings    ${response.status_code}    404

Get Nonexistent Book Copy
    [Documentation]    Попытка получить данные несуществующей копии книги
    ${response} =    Get Nonexistent Book Copy
    Should Be Equal As Strings    ${response.status_code}    404

Place Book Copy In Taken Cell
    [Documentation]    Попытка разместить книгу в уже занятой ячейке
    ${response} =    Place Book Copy In Taken Cell
    Should Be Equal As Strings    ${response.status_code}    409

Teardown
    Delete user    ${username}
    ${response} =    POST    ${BASE_URL}/logout    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Delete Book Edition SQL    ${book_id}
