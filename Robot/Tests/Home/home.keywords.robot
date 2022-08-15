*** Settings ***
Resource    ../../Resources/Home/home.resource.robot

*** Keywords ***
que eu abra o menu hamburguer
    Abrir menu hamburguer

clicar em About
    Clicar no botao About

serei redirecionado para a landing page do sauce labs
    Validar landing page about

clicar em Logout
    Realizar Logout

serei redirecionado para a pagina de login
    Validar pagina de login

que eu abra o filtro dos itens
    Abrir filtro

selecionar de "${SELECTED_FILTER}"
    Selecionar filtro "${SELECTED_FILTER}"

o primeiro item deve ser o "${FIRST_ITEM}"
    Validar primeiro item pelo nome "${FIRST_ITEM}"