*** Settings ***
Library    RequestsLibrary
Library    DatabaseLibrary

*** Keywords ***
Get connection
    Connect To Database    psycopg2    ${DB_NAME}    ${DB_USER}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}

Delete user
    [Arguments]    ${username}
    Get connection
    ${output} =    Execute SQL String    DELETE FROM users WHERE user_login = '${username}'
    Disconnect From Database
