*** Settings ***
Resource    ../../resources/variables.robot
Resource    ../../resources/keywords.robot
Resource    ../../resources/admin_keywords.robot

*** Test Cases ***
Login Admin
    Setup admin

Add New Book Edition
    [Documentation]    Проверка добавления нового издания в базу данных
    Setup admin
    ${book_title}    Set Variable    Название книги
    ${book_author}    Set Variable    Автор книги
    ${book_year}    Set Variable    2025
    ${book_place}    Set Variable    Город издания
    ${book_udk}    Set Variable    123.456
    ${book_bbk}    Set Variable    789.012
    ${response} =    Create Book Edition    ${book_title}    ${book_author}    ${book_year}    ${book_place}    ${book_udk}    ${book_bbk}
    Should Be Equal As Strings    ${response.status_code}    201
    ${retrieved_book} =    Get Book Edition By Fields    ${book_title}    ${book_author}    ${book_year}    ${book_place}
    Should Be Equal As Strings    ${retrieved_book.json()['book_edition_title']}    ${book_title}
    Teardown

Edit Book Edition
    Setup admin
    ${book_title}    Set Variable    Исходное название
    ${book_author}    Set Variable    Исходный автор
    ${book_year}    Set Variable    2025
    ${book_place}    Set Variable    Исходный город
    ${new_title}    Set Variable    Новое название
    ${update_body} =    Create Dictionary    book_edition_title=${new_title}    book_edition_author=${book_author}    book_edition_year_publication=${book_year}    book_edition_place_publication=${book_place}
    ${update_response} =    PUT    ${BASE_URL}/workWithEditions    json=${update_body}    headers=${headers}
    Should Be Equal As Strings    ${update_response.status_code}    200
    Teardown

Failed Add Book Edition With Empty Title
    Setup admin
    ${response} =    Create Book Edition    ""    Автор книги    2025    Город издания    123.456    789.012
    Should Be Equal As Strings    ${response.status_code}    400

Failed Edit Non-Existing Book Edition
    Setup admin
    ${update_body} =    Create Dictionary    book_edition_title="Неизвестная книга"    book_edition_author="Автор"    book_edition_year_publication=2025    book_edition_place_publication="Город"
    ${update_response} =    PUT    ${BASE_URL}/workWithEditions    json=${update_body}    headers=${headers}
    Should Be Equal As Strings    ${update_response.status_code}    404

Failed Delete Non-Existing Book Edition
    Setup admin
    ${delete_response} =    DELETE    ${BASE_URL}/workWithEditions?title="Фейковая книга"
    Should Be Equal As Strings    ${delete_response.status_code}    404

Failed Unauthorized Add Book Edition
    ${response} =    Create Book Edition    "Книга"    "Автор"    2025    "Город"    123.456    789.012
    Should Be Equal As Strings    ${response.status_code}    401

Failed Invalid Admin Login
    ${headers} =    Create Dictionary    Content-Type=application/json
    ${body} =    Create Dictionary    username="wrong_user"    password="wrong_pass"
    ${response} =    POST    ${BASE_URL}/login    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    401

Teardown
    Delete user    ${username}
    ${response} =    POST    ${BASE_URL}/logout    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    Delete Book Edition SQL    ${book_id}
