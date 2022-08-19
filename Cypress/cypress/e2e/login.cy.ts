import { GLOBAL } from "../locators/global"
import { HOME } from "../locators/home"
import { LOGIN } from "../locators/login"

describe("Login", () => {
    beforeEach(() => {
        cy.visit(GLOBAL.URL)
    })

    it("Deve realizar o login com sucesso.", () => {
        cy.get(LOGIN.INPUT_USERNAME)
        .should("be.visible")
        .type(GLOBAL.USER)

        cy.get(LOGIN.INPUT_PASSWORD)
        .should("be.visible")
        .type(GLOBAL.PASSWORD)

        cy.get(LOGIN.BTN_LOGIN)
        .should("be.visible")
        .click({force: true})
        
        cy.get(HOME.BTN_ADD_TO_CART_SAUCE_LABS)
        .should("be.visible")
    })

    it("Deve exibir um erro ao tentar realizar login com dados incorretos", () => {
        cy.get(LOGIN.INPUT_USERNAME)
        .should("be.visible")
        .type("invalid user")

        cy.get(LOGIN.INPUT_PASSWORD)
        .should("be.visible")
        .type("invalidPassword")

        cy.get(LOGIN.BTN_LOGIN)
        .should("be.visible")
        .click({force: true})

        cy.get(LOGIN.ERROR_MSG)
        .should("be.visible")
        .and("contain", "Epic sadface: Username and password do not match any user in this service")
    })

    it("Deve exibir um erro ao tentar realizar login com dados em branco", () => {
        cy.get(LOGIN.BTN_LOGIN)
        .should("be.visible")
        .click({force: true})

        cy.get(LOGIN.ERROR_MSG)
        .should("be.visible")
        .and("contain", "Epic sadface: Username is required")
    })

    it("Deve exibir um erro ao tentar realizar login com um usuario bloqueado", () => {
        cy.get(LOGIN.INPUT_USERNAME)
        .should("be.visible")
        .type(GLOBAL.USER_LOCKED)

        cy.get(LOGIN.INPUT_PASSWORD)
        .should("be.visible")
        .type(GLOBAL.PASSWORD)

        cy.get(LOGIN.BTN_LOGIN)
        .should("be.visible")
        .click({force: true})

        cy.get(LOGIN.ERROR_MSG)
        .should("be.visible")
        .and("contain", "Epic sadface: Sorry, this user has been locked out.")
    })
})