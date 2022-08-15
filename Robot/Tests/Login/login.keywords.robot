*** Settings ***
Resource         ../../Resources/Login/login.resource.robot
Resource         ../../Resources/global.resource.robot

*** Keywords ***
que eu informe login "${USER}" e senha "${PASSWORD}"
    Acessar Pagina
    Inserir login "${USER}" e senha "${PASSWORD}"
    
clicar no botao login
    Clicar em Login

serei redirecionado para home do sistema
    Validar que esta na pagina home

deve exibir a seguinte mensagem de erro "${ERROR_MESSAGE}"
    Messagem de erro na tela de login "${ERROR_MESSAGE}"