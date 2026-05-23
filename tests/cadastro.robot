*** Settings ***
Resource    ../resources/base.robot
Resource    ../variables/variables.robot

*** Test Cases ***
Cadastro de Usuario

    Abrir Navegador    ${URL_REGISTER}

    Preencher Campo    //input[@placeholder='First Name']    ${FIRST_NAME}

    Preencher Campo    //input[@placeholder='Last Name']    ${LAST_NAME}

    Preencher Campo    //input[@type='email']    ${EMAIL}

    Preencher Campo    //input[@type='tel']    ${PHONE}

    Tirar Print    cadastro_preenchido

    Fechar Navegador