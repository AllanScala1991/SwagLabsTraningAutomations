*** Settings ***
Resource         ./login.keywords.robot
Resource         ../../BDD/BDDpt-br.robot
Resource         ../../Resources/global.resource.robot
Test Setup       Abrir Navegador
Test Teardown    Fechar Navegador

*** Test Cases ***
Cenario 01 - Efetuar login no sistema
    [Tags]    Login_Sucessfully
    Dado que eu informe login "standard_user" e senha "secret_sauce"
    Quando clicar no botao login
    Entao serei redirecionado para home do sistema

Cenario 02 - Tentar realizar login com dados incorretos
    [Tags]    Login_Invalid
    Dado que eu informe login "invalid_user" e senha "invalid_password"
    Quando clicar no botao login
    Entao deve exibir a seguinte mensagem de erro "Username and password do not match any user in this service"

Cenario 03 - Tentar realizar login com campos em branco
    [Tags]    Login_Empty_Inputs
    Dado que eu informe login "" e senha ""
    Quando clicar no botao login
    Entao deve exibir a seguinte mensagem de erro "Username is required"

Cenario 04 - Tentar realizar login com um usuario bloqueado
    [Tags]    Login_Locked
    Dado que eu informe login "locked_out_user" e senha "secret_sauce"
    Quando clicar no botao login
    Entao deve exibir a seguinte mensagem de erro "Sorry, this user has been locked out."