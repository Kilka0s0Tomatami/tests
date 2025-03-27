*** Settings ***
Library    RequestsLibrary
Library    DatabaseLibrary

*** Keywords ***

Create user
    [Arguments]    ${id}    ${username}    ${password}
    Get connection
    ${output} =    Execute SQL String    INSERT INTO users (user_id, user_login, user_password, role_id) VALUES ('${id}', '${username}', '${password}', 1);

Create lib card
    [Arguments]    ${id}    ${first_name}    ${second_name}
    Get connection
    ${output} =    Execute SQL String    INSERT INTO lib_cards (lib_card_id, user_id, lib_card_first_name, lib_card_second_name) values (${id}, ${id}, '${first_name}', '${second_name}')

Create Book Edition
    [Arguments]    ${title}    ${author}    ${year}    ${place}    ${udk}    ${bbk}
    ${headers} =    Create Dictionary    Content-Type=application/json

    ${body} =    Set Variable
    ...    {"book_edition_title": "${title}", "book_edition_author": "${author}", "book_edition_year_publication": ${year}, "book_edition_place_publication": "${place}", "book_edition_udk_number": "${udk}", "book_edition_bbk_number": "${bbk}"}

    Log    ${body}

    ${response} =    POST    ${BASE_URL}/librarian/workWithEditions    data=${body}    headers=${headers}
    RETURN    ${response}


Get Book Edition
    [Arguments]    ${book_id}
    ${headers} =    Create Dictionary    Content-Type=application/json
    ${response} =    GET    ${BASE_URL}/book_editions/${book_id}    headers=${headers}
    RETURN    ${response}

Delete Book Edition
    [Arguments]    ${title}    ${author}    ${year}    ${place}
    Get connection
    Execute SQL String    DELETE FROM book_editions WHERE book_edition_title='${title}' AND book_edition_author='${author}' AND book_edition_year_publication=${year} AND book_edition_place_publication='${place}'
    Disconnect From Database

Get Nonexistent Book Edition
    [Arguments]    ${book_id}
    ${headers} =    Create Dictionary    Content-Type=application/json
    ${response} =    GET    ${BASE_URL}/book_editions/${book_id}    headers=${headers}
    RETURN    ${response}

Delete Nonexistent Book Edition
    [Arguments]    ${title}    ${author}    ${year}    ${place}
    Get connection
    ${output} =    Execute SQL String    DELETE FROM book_editions WHERE book_edition_title='${title}' AND book_edition_author='${author}' AND book_edition_year_publication=${year} AND book_edition_place_publication='${place}'
    Disconnect From Database

Create Book Edition With Empty Fields
    ${headers} =    Create Dictionary    Content-Type=application/json
    ${body} =    Create Dictionary
    ...    book_edition_title=
    ...    book_edition_author=
    ...    book_edition_year_publication=
    ...    book_edition_place_publication=
    ...    book_edition_udk_number=
    ...    book_edition_bbk_number=
    ${response} =    POST    ${BASE_URL}/workWithEditions    json=${body}    headers=${headers}
    RETURN    ${response}

Unauthorized Request
    ${headers} =    Create Dictionary    Content-Type=application/json
    ${response} =    GET    ${BASE_URL}/workWithEditions    headers=${headers}
    RETURN    ${response}

Create Book Copy With Invalid Data
    ${headers} =    Create Dictionary    Content-Type=application/json
    ${body} =    Create Dictionary
    ...    book_edition_id=9999999
    ...    book_copy_status=ABC
    ...    book_copy_fond_number=0
    ${response} =    POST    ${BASE_URL}/workWithCopy    json=${body}    headers=${headers}
    RETURN    ${response}

Delete Nonexistent Book Copy
    ${headers} =    Create Dictionary    Content-Type=application/json
    ${response} =    DELETE    ${BASE_URL}/workWithCopy/9999999    headers=${headers}
    RETURN    ${response}

Get Nonexistent Book Copy
    ${headers} =    Create Dictionary    Content-Type=application/json
    ${response} =    GET    ${BASE_URL}/workWithCopy/9999999    headers=${headers}
    RETURN    ${response}

Place Book Copy In Taken Cell
    ${headers} =    Create Dictionary    Content-Type=application/json
    ${body} =    Create Dictionary
    ...    book_copy_id=1
    ...    cell_id=1
    ${response} =    POST    ${BASE_URL}/workWithCopy/place    json=${body}    headers=${headers}
    RETURN    ${response}
