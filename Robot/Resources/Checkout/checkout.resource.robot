*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BTN_CART}         //*[@id="shopping_cart_container"]/a
${BTN_CHECKOUT}      checkout
${CART_QUANTITY}     //*[@id="cart_contents_container"]/div/div[1]/div[3]/div[1]
${BTN_REMOVE}        remove-sauce-labs-backpack
${INPUT_FIRST_NAME}  first-name
${INPUT_LAST_NAME}   last-name
${INPUT_ZIPCODE}     postal-code
${BTN_CONTINUE}      continue
${BTN_FINISH}        finish
${COMPLETE_HEADER}   //*[@id="checkout_complete_container"]/h2


*** Keywords ***
Adicionar o item "${ITEM_LOCATOR}" ao carrinho
    Wait Until Element Is Visible    ${ITEM_LOCATOR}
    Click Button    ${ITEM_LOCATOR}

Abrir o carrinho
    Wait Until Element Is Visible    ${BTN_CART}
    Click Link    ${BTN_CART}

Validar total de items no carrinho "${TOTAL}"
    Wait Until Element Is Visible    ${CART_QUANTITY}\[contains(text(), '${TOTAL}')]

Validar carrinho vazio
    Element Should Not Be Visible    ${CART_QUANTITY}

Remover item pela home
    Click Button    ${BTN_REMOVE}

Clicar no botao de checkout
    Click Button    ${BTN_CHECKOUT}

Preencher as informacoes "${NOME}" "${SOBRENOME}" "${CEP}"
    Input Text    ${INPUT_FIRST_NAME}    ${NOME}
    Input Text    ${INPUT_LAST_NAME}     ${SOBRENOME}
    Input Text    ${INPUT_ZIPCODE}       ${CEP}
    Click Button    ${BTN_CONTINUE}

Clicar no botao de finalizar o pedido
    Click Button    ${BTN_FINISH}

Validar mensagem de agradecimento
    Wait Until Element Is Visible    ${COMPLETE_HEADER}
    Wait Until Element Contains    ${COMPLETE_HEADER}    THANK YOU FOR YOUR ORDER

