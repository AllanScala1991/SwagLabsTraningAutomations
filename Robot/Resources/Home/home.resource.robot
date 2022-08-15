*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BTN_MENU_HAMBURGUER}    react-burger-menu-btn
${LINK_ABOUT}             about_sidebar_link
${SAUCE_BOT}              drift-frame-controller
${LINK_LOGOUT}            logout_sidebar_link
${BTN_LOGIN}              login-button
${FILTER_SELECT}          //*[@id="header_container"]/div[2]/div[2]/span/select
${FIRST_ITEM}             //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/a/div

*** Keywords ***
Abrir menu hamburguer
    Click Button    ${BTN_MENU_HAMBURGUER}

Clicar no botao About
    Wait Until Element Is Visible    ${LINK_ABOUT}  
    Click Link    ${LINK_ABOUT}

Validar landing page about
    Page Should Contain Element    ${SAUCE_BOT} 

Realizar Logout
    Wait Until Element Is Visible    ${LINK_LOGOUT}
    Click Link    ${LINK_LOGOUT}

Validar pagina de login
    Page Should Contain Element    ${BTN_LOGIN}

Abrir filtro
    Wait Until Element Is Visible    ${FILTER_SELECT}
    Click Element    ${FILTER_SELECT}

Selecionar filtro "${SELECTED_FILTER}"
    Wait Until Element Is Visible    //option[contains(text(), '${SELECTED_FILTER}')] 
    Click Element    //option[contains(text(), '${SELECTED_FILTER}')] 

Validar primeiro item pelo nome "${ITEM_NAME}"
    Wait Until Element Is Visible    ${FIRST_ITEM}
    Element Should Contain    ${FIRST_ITEM}    ${ITEM_NAME}