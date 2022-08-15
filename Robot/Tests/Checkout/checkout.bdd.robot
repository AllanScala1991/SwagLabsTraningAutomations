*** Settings ***
Resource    ./checkout.keywords.robot
Resource    ../../BDD/BDDpt-br.robot
Resource    ../../Resources/global.resource.robot
Resource    ../../PageObjects/login.robot
Test Setup       Login "standard_user" "secret_sauce"
Test Teardown    Fechar Navegador


*** Variables ***
${SAUCE_LABS_BACKPACK}    add-to-cart-sauce-labs-backpack

*** Test Cases ***
Cenario 01 - Devo adicionar um item ao carrinho
    Dado que eu adicione o item "${SAUCE_LABS_BACKPACK}" ao carrinho
    Quando acessar o carrinho
    Entao deve exibir a quantidade de "1" item(s)
    
Cenario 02 - Remover um item do carrinho atraves da home
    Dado que eu adicione o item "${SAUCE_LABS_BACKPACK}" ao carrinho
    Quando clicar no botao remover
    E acessar o carrinho
    Entao devo validar que nao existem produtos

Cenario 03 - Remover um item do carrinho atraves do checkout
    Dado que eu adicione o item "${SAUCE_LABS_BACKPACK}" ao carrinho
    Quando acessar o carrinho
    E clicar no botao remover
    Entao devo validar que nao existem produtos

Cenario 04 - Efetuar compra com sucesso
    Dado que eu adicione o item "${SAUCE_LABS_BACKPACK}" ao carrinho
    E acessar o carrinho
    Quando clicar em checkout
    E preencher os dados corretamente
    E finalizar o pedido
    Entao devo ver a mensagem de agradecimento

