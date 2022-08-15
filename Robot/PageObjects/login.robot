*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/global.resource.robot

*** Variables ***
${INPUT_USERNAME}    user-name
${INPUT_PASSWORD}    password
${BTN_LOGIN}         login-button
${HOME_TITLE}        shopping_cart_container

*** Keywords ***
Login "${USERNAME}" "${PASSWORD}"
    Abrir Navegador
    Acessar Pagina
    Input Text    ${INPUT_USERNAME}    ${USERNAME}
    Input Text    ${INPUT_PASSWORD}    ${PASSWORD}
    Click Element    ${BTN_LOGIN}
    Wait Until Element Is Visible    ${HOME_TITLE}