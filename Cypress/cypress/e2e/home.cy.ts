import { GLOBAL } from "../locators/global"
import { HOME } from "../locators/home"
import { LOGIN } from "../locators/login"
import { Login } from "../pageObjects/login"


describe("Home", () => {
    beforeEach(() => {
        Login.handler(GLOBAL.USER, GLOBAL.PASSWORD)
    })

    it("Deve validar o redirecionamento do link ABOUT", () => {
        cy.get(HOME.MENU_HAMBURGUER)
        .should("be.visible")
        .click({force: true})

        cy.get(HOME.LINK_ABOUT)
        .should("be.visible")
        .click({force: true})

        cy.url()
        .should("contain", "https://saucelabs.com/")
    })

    it("Deve ser possivel deslogar o usuario", () => {
        cy.get(HOME.MENU_HAMBURGUER)
        .should("be.visible")
        .click({force: true})

        cy.get(HOME.LINK_LOGOUT)
        .should("be.visible")
        .click({force: true})

        cy.get(LOGIN.INPUT_USERNAME)
        .should("be.visible")
    })

    it("Deve realizar o filtro de Z ao A", () => {
        cy.get(HOME.SELECT_FILTER)
        .should("be.visible")
        .select(HOME.FILTER_ZA)

        cy.get(HOME.ITEM_NAME)
        .first()
        .should("be.visible")
        .and("contain", "Test.allTheThings() T-Shirt (Red)")
    })

    it("Deve realizar o filtro do valor menor para o maior", () => {
        cy.get(HOME.SELECT_FILTER)
        .should("be.visible")
        .select(HOME.FILTER_LOW_HIGH)

        cy.get(HOME.ITEM_NAME)
        .first()
        .should("be.visible")
        .and("contain", "Sauce Labs Onesie")
    })

    it("Deve realizar o filtro do valor maior para o menor", () => {
        cy.get(HOME.SELECT_FILTER)
        .should("be.visible")
        .select(HOME.FILTER_HIGH_LOW)

        cy.get(HOME.ITEM_NAME)
        .first()
        .should("be.visible")
        .and("contain", "Sauce Labs Fleece Jacket")
    })
})