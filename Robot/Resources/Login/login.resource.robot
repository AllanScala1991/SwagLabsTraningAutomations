*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${INPUT_USERNAME}    user-name
${INPUT_PASSWORD}    password
${BTN_LOGIN}         login-button
${HOME_TITLE}        shopping_cart_container
${MESSAGE_MODAL}     //*[@id="login_button_container"]/div/form/div[3]/h3

*** Keywords ***
Inserir login "${USERNAME}" e senha "${PASSWORD}"
    Input Text    ${INPUT_USERNAME}    ${USERNAME}
    Input Text    ${INPUT_PASSWORD}    ${PASSWORD}
Clicar em Login
    Click Element    ${BTN_LOGIN}

Validar que esta na pagina home
    Wait Until Element Is Visible    ${HOME_TITLE}

Messagem de erro na tela de login "${MESSAGE}"
    Wait Until Element Is Visible    ${MESSAGE_MODAL}
    Element Should Contain    ${MESSAGE_MODAL}    ${MESSAGE}
    
