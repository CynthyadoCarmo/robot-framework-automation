*** Settings ***
Resource    ../../resources/base.robot

*** Test Cases ***
Login Negativo

    Abrir Navegador    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

    Esperar    5

    Preencher Campo    //input[@name='username']    usuario_errado

    Preencher Campo    //input[@name='password']    senha_errada

    Tirar Print    login_invalido

    Clicar Elemento    //button[@type='submit']

    Esperar    5

    Tirar Print    erro_login

    Fechar Navegador