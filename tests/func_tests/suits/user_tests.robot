*** Settings ***
Resource    ../../resources/variables.robot
Resource    ../../resources/keywords.robot
Resource    ../../resources/admin_keywords.robot
Resource    ../../resources/user_keywords.robot

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

Create Library Card
    [Documentation]    Успешное создание читательского билета
    ${response} =    Create Library Card
    Should Be Equal As Strings    ${response.status_code}    201

Update Library Card Information
    [Documentation]    Успешное обновление информации читательского билета
    ${response} =    Update Library Card Information
    Should Be Equal As Strings    ${response.status_code}    200

Create Library Card With Invalid Data
    [Documentation]    Попытка создать читательский билет с некорректными данными
    ${response} =    Create Library Card With Invalid Data
    Should Be Equal As Strings    ${response.status_code}    400

Update Nonexistent Library Card
    [Documentation]    Попытка обновить несуществующий читательский билет
    ${response} =    Update Nonexistent Library Card
    Should Be Equal As Strings    ${response.status_code}    404

Reserve Book Successfully
    [Documentation]    Успешное бронирование книги
    ${response} =    Reserve Book
    Should Be Equal As Strings    ${response.status_code}    201

Reserve Already Reserved Book
    [Documentation]    Попытка забронировать уже забронированную книгу
    ${response} =    Reserve Already Reserved Book
    Should Be Equal As Strings    ${response.status_code}    409

Reserve Nonexistent Book
    [Documentation]    Попытка забронировать несуществующую книгу
    ${response} =    Reserve Nonexistent Book
    Should Be Equal As Strings    ${response.status_code}    404

Pay Fine Successfully
    [Documentation]    Успешное погашение штрафа
    ${response} =    Pay Fine
    Should Be Equal As Strings    ${response.status_code}    200

Pay Fine With Insufficient Funds
    [Documentation]    Попытка погасить штраф при недостатке средств
    ${response} =    Pay Fine With Insufficient Funds
    Should Be Equal As Strings    ${response.status_code}    402

Pay Fine For Nonexistent User
    [Documentation]    Попытка погасить штраф для несуществующего пользователя
    ${response} =    Pay Fine For Nonexistent User
    Should Be Equal As Strings    ${response.status_code}    404

Teardown
    Delete user    ${username}
    ${response} =    POST    ${BASE_URL}/logout    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Delete Book Edition SQL    ${book_id}

*** Keywords ***
Create Library Card
    [Documentation]    API-запрос для создания читательского билета
    ${body} =    Create Library Card Payload
    ${response} =    POST    ${BASE_URL}/library_cards    json=${body}    headers=${headers}
    RETURN    ${response}

Update Library Card Information
    [Documentation]    API-запрос для обновления читательского билета
    ${body} =    Update Library Card Payload
    ${response} =    PUT    ${BASE_URL}/library_cards/${card_id}    json=${body}    headers=${headers}
    RETURN    ${response}

Reserve Book
    [Documentation]    API-запрос для бронирования книги
    ${body} =    Reserve Book Payload
    ${response} =    POST    ${BASE_URL}/reservations    json=${body}    headers=${headers}
    RETURN    ${response}

Pay Fine
    [Documentation]    API-запрос для погашения штрафа
    ${body} =    Pay Fine Payload
    ${response} =    POST    ${BASE_URL}/fines/pay    json=${body}    headers=${headers}
    RETURN    ${response}
