*** Settings ***
Resource    ../../Resources/global.resource.robot
Resource    ../../PageObjects/login.robot
Resource    ./home.keywords.robot
Resource         ../../BDD/BDDpt-br.robot
Test Setup       Login "standard_user" "secret_sauce"
Test Teardown    Fechar Navegador

*** Test Cases ***
Cenario 01 - Deve validar o redirecionamento do botao about
    [Tags]    Home_Redirects
    Dado que eu abra o menu hamburguer
    Quando clicar em About
    Entao serei redirecionado para a landing page do sauce labs

Cenario 02 - Deve deslogar
    [Tags]    Logout_Redirects
    Dado que eu abra o menu hamburguer
    Quando clicar em Logout
    Entao serei redirecionado para a pagina de login

Cenario 03 - Deve filtrar os items de Z ao a
    [Tags]    Itens_Z_to_A
    Dado que eu abra o filtro dos itens
    Quando selecionar de "Name (Z to A)"
    Entao o primeiro item deve ser o "Test.allTheThings() T-Shirt (Red)"

Cenario 04 - Deve filtrar os items por preco do menor para o maior
    [Tags]    Itens_Price_Small_to_Large
    Dado que eu abra o filtro dos itens
    Quando selecionar de "Price (low to high)"
    Entao o primeiro item deve ser o "Sauce Labs Onesie"

Cenario 05 - Deve filtrar os items por preco do maior para o menor
    [Tags]    Itens_Price_Small_to_Large
    Dado que eu abra o filtro dos itens
    Quando selecionar de "Price (high to low)"
    Entao o primeiro item deve ser o "Sauce Labs Fleece Jacket"
