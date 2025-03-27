*** Settings ***
Resource    ./teardown/cleanup.robot

*** Test Cases ***
Run all tests
    Run Tests    suites

