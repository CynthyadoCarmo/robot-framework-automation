*** Settings ***
Resource    ../resources/base.robot
Resource    ../variables/variables.robot

*** Test Cases ***
Fluxo Completo Checkout E2E

    # Abrir site
    Abrir Navegador    ${URL}

    Esperar    5

    Tirar Print    home_page

    # Ir para Signup/Login
    Clicar Elemento    //a[contains(text(),'Signup / Login')]

    Esperar    5

    Tirar Print    tela_login

    # Cadastro
    Preencher Campo    //input[@data-qa='signup-name']    ${NAME}

    Preencher Campo    //input[@data-qa='signup-email']    ${CHECKOUT_EMAIL}

    Tirar Print    dados_cadastro

    Clicar Com JavaScript    //button[@data-qa='signup-button']

    Esperar    8

    Tirar Print    tela_cadastro

    Esperar    5

    # Preencher formulário da conta
    Tirar Print    antes_gender

    Clicar Elemento    //input[@id='id_gender1']

    Esperar    2

    Preencher Campo    //input[@id='password']    ${PASSWORD}

    Preencher Campo    //input[@id='first_name']    ${FIRST_NAME}

    Preencher Campo    //input[@id='last_name']    ${LAST_NAME}

    Preencher Campo    //input[@id='address1']    ${ADDRESS}

    Preencher Campo    //input[@id='state']    ${STATE}

    Preencher Campo    //input[@id='city']    ${CITY}

    Preencher Campo    //input[@id='zipcode']    ${ZIPCODE}

    Preencher Campo    //input[@id='mobile_number']    ${MOBILE}

    Tirar Print    formulario_preenchido

    Esperar    2

    # Criar conta

    Scroll Ate Elemento    //button[@data-qa='create-account']

    Esperar    2

    Tirar Print    antes_create_account

    Clicar Com JavaScript    //button[@data-qa='create-account']

    Esperar    5

    Tirar Print    conta_criada

    # Continue
    Clicar Elemento    //a[@data-qa='continue-button']

    Esperar    5

    Tirar Print    home_logada

    # Ir para produtos
    Clicar Com JavaScript    //a[contains(text(),'Products')]

    Esperar    5

    Tirar Print    lista_produtos

    # Adicionar primeiro produto
    Scroll Ate Elemento    (//a[contains(text(),'Add to cart')])[1]

    Esperar    2

    Tirar Print    antes_add_carrinho

    Clicar Com JavaScript    (//a[contains(text(),'Add to cart')])[1]

    Esperar    3

    Tirar Print    produto_adicionado

    # Ver carrinho
    Clicar Com JavaScript    //u[contains(text(),'View Cart')]

    Esperar    5

    Tirar Print    carrinho_aberto

    # Checkout
    Clicar Com JavaScript    //a[contains(text(),'Proceed To Checkout')]

    Esperar    5

    Tirar Print    tela_checkout

    # Place Order
    Clicar Com JavaScript    //a[contains(text(),'Place Order')]

    Esperar    5

    Tirar Print    tela_pagamento

    # Dados do cartão
    Preencher Campo    //input[@data-qa='name-on-card']    ${CARD_NAME}

    Preencher Campo    //input[@data-qa='card-number']    ${CARD_NUMBER}

    Preencher Campo    //input[@data-qa='cvc']    ${CARD_CVC}

    Preencher Campo    //input[@data-qa='expiry-month']    ${CARD_MONTH}

    Preencher Campo    //input[@data-qa='expiry-year']    ${CARD_YEAR}

    Tirar Print    dados_pagamento

    Esperar    2

    # Confirmar pagamento
    Clicar Com JavaScript    //button[@data-qa='pay-button']

    Esperar    8

    Tirar Print    pedido_finalizado

    # Deletar conta
    Clicar Com JavaScript    //a[contains(text(),'Delete Account')]

    Esperar    5

    Tirar Print    conta_deletada

    # Continue
    Clicar Com JavaScript    //a[@data-qa='continue-button']

    Esperar    3

    Tirar Print    retorno_home

    Fechar Navegador