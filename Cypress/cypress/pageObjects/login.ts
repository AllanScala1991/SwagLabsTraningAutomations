import { GLOBAL } from "../locators/global";
import { LOGIN } from "../locators/login";

export class Login {
    static handler(username: string, password: string): void {
        cy.visit(GLOBAL.URL)

        cy.get(LOGIN.INPUT_USERNAME)
        .should("be.visible")
        .type(username)

        cy.get(LOGIN.INPUT_PASSWORD)
        .should("be.visible")
        .type(password)

        cy.get(LOGIN.BTN_LOGIN)
        .should("be.visible")
        .click({force: true})
    }
}