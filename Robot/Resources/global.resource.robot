*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/

*** Keywords ***
Abrir Navegador
    Open Browser    browser=chrome

Fechar Navegador
    Close Browser

Acessar Pagina
    Go To    ${URL}