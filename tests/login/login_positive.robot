*** Settings ***
Resource    ../../resources/base.robot

*** Test Cases ***
Login Positivo

    Abrir Navegador    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

    Esperar    5

    Preencher Campo    //input[@name='username']    Admin

    Preencher Campo    //input[@name='password']    admin123

    Tirar Print    login_positivo

    Clicar Elemento    //button[@type='submit']

    Esperar    5

    Tirar Print    dashboard

    Fechar Navegador