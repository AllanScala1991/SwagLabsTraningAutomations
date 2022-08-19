import { CHECKOUT } from "../locators/checkout"
import { GLOBAL } from "../locators/global"
import { HOME } from "../locators/home"
import { Login } from "../pageObjects/login"


describe("Checkout", () => {
    beforeEach(() => {
        Login.handler(GLOBAL.USER, GLOBAL.PASSWORD)
    })

    it("Deve adicionar um item ao carrinho pela home", () => {
        cy.get(HOME.BTN_ADD_TO_CART_SAUCE_LABS)
        .should("be.visible")
        .click({force: true})

        cy.get(HOME.SHOPPING_CART_BADGE)
        .should("be.visible")
        .and("contain", "1")
    })

    it("Deve remover um item do carrinho pela home", () => {
        cy.get(HOME.BTN_ADD_TO_CART_SAUCE_LABS)
        .should("be.visible")
        .click({force: true})

        cy.get(HOME.BTN_REMOVE_ITEM)
        .should("be.visible")
        .click({force: true})

        cy.get(HOME.SHOPPING_CART_BADGE)
        .should("not.exist")
    })

    it("Deve remover um item dentro do carrinho", () => {
        cy.get(HOME.BTN_ADD_TO_CART_SAUCE_LABS)
        .should("be.visible")
        .click({force: true})

        cy.get(HOME.LINK_SHOPPING_CART)
        .should("be.visible")
        .click({force: true})

        cy.get(HOME.BTN_REMOVE_ITEM)
        .should("be.visible")
        .click({force: true})

        cy.get(CHECKOUT.CART_QUANTITY)
        .should("not.exist")
    })

    it("Deve realizar uma compra com sucesso", () => {
        cy.get(HOME.BTN_ADD_TO_CART_SAUCE_LABS)
        .should("be.visible")
        .click({force: true})

        cy.get(HOME.LINK_SHOPPING_CART)
        .should("be.visible")
        .click({force: true})

        cy.get(CHECKOUT.BTN_CHECKOUT)
        .should("be.visible")
        .click({force: true})

        cy.get(CHECKOUT.INPUT_FIRST_NAME)
        .should("be.visible")
        .type("Test")

        cy.get(CHECKOUT.INPUT_LAST_NAME)
        .should("be.visible")
        .type("Automation")

        cy.get(CHECKOUT.INPUT_ZIP_CODE)
        .should("be.visible")
        .type("75100-260")

        cy.get(CHECKOUT.BTN_CONTINUE)
        .should("be.visible")
        .click({force: true})

        cy.get(CHECKOUT.BTN_FINISH)
        .should("be.visible")
        .click({force: true})

        cy.get(CHECKOUT.SUCCESS_MESSAGE)
        .should("be.visible")
        .and("contain", "THANK YOU FOR YOUR ORDER")
    })
})