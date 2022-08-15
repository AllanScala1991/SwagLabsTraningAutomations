*** Settings ***
Resource    ../../Resources/Checkout/checkout.resource.robot


*** Keywords ***
que eu adicione o item "${ITEM_LOCATOR}" ao carrinho
    Adicionar o item "${ITEM_LOCATOR}" ao carrinho

acessar o carrinho
    Abrir o carrinho

deve exibir a quantidade de "${TOTAL_ITEMS_IN_CHECKOUT}" item(s)
    Validar total de items no carrinho "${TOTAL_ITEMS_IN_CHECKOUT}"

clicar no botao remover
    Remover item pela home
    
devo validar que nao existem produtos
    Validar carrinho vazio

clicar em checkout
    Clicar no botao de checkout

preencher os dados corretamente
    Preencher as informacoes "Testes" "Automatizados" "72907-024"

finalizar o pedido
    Clicar no botao de finalizar o pedido

devo ver a mensagem de agradecimento
    Validar mensagem de agradecimento
    