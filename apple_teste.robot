*** Settings ***

Resource       apple_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador


*** Test Cases ***
Caso de teste #01 - Adicionar um produto no carrinho e remover do carrinho
    [Documentation]  esse teste verifica se após adicionar o produto ao carrinho é possível remover e o carrinho ficar vazio
    [Tags]           carrinho de compras
    Dado que estou na home page da Apple
    Quando clico na opção Iphone no menú superior
    E clico na opção Iphone 15 Pro no menú superior
    E seleciono o botão compre
    E seleciono as características do produto
    E adiciono no carrinho de compras
    E removo do carrinho de compras
    Então confirmo se o carrinho está vazio

