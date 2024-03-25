*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://www.apple.com/pt/
${logo_Apple}    //a[contains(@data-globalnav-item-name,'apple')]
${botão_iphone_menu}    //span[@class='globalnav-link-text-container'][contains(.,'iPhone')]
${Texto_Iphone_menu}    //span[@class='chapternav-label'][contains(.,'iPhone 15 Pro')]
${Apresentação_texto_iphone}    //figure[contains(@class,'welcome__video-headline-logo show')]
${botão_compre}    //a[contains(@class,'welcome__lockup-cta show')]
${Texto_compre_iphone}    //h1[@class='fwl'][contains(.,'Compre o iPhone 15 Pro')]
${Botao_pro_max}     //span[@class='form-selector-title'][contains(.,'iPhone 15 Pro Max')]
${Botão_cor_branco}    (//img[@class='colornav-swatch'])[3]
${Botão_1T}    (//span[contains(@class,'column form-selector-left-col rf-bfe-selector-left-col')])[5]
${Botao_add_bolsa}    //button[@type='submit'][contains(.,'Adicione à bolsa')]
${Botao_reveja_bolsa}    //button[@type='submit'][contains(.,'Reveja a bolsa')]
${Botão_remover}    //button[@type='button'][contains(.,'RemoveriPhone 15 Pro Max de 1 TB em titânio branco')]
${Texto_Bolsa_vazia}    //*[@id="bag-content"]/div/h1
${Texto_esperado_bolsa_vazia}    A bolsa está vazia.
${Fechar_Notificacao}    //*[@id="shoppingCart.cartMessages.undoClose"]



*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser 

Dado que estou na home page da Apple
    Go To    url=${url}
    Wait Until Element Is Visible    locator=${logo_Apple} 
Quando clico na opção Iphone no menú superior
    Click Element    locator=${botão_iphone_menu}
    Wait Until Element Is Visible    locator=${Texto_Iphone_menu}
E clico na opção Iphone 15 Pro no menú superior
    Click Element    locator=${Texto_Iphone_menu}
    Wait Until Element Is Visible    locator=${Apresentação_texto_iphone}
E seleciono o botão compre
    Click Element    locator=${botão_compre}
    Wait Until Element Is Visible    locator=${Texto_compre_iphone}
E seleciono as características do produto
    Set Browser Implicit Wait    value=5
    Wait Until Element Is Visible    locator=${Botao_pro_max}
    Scroll Element Into View    locator=${Botao_pro_max}
    Click Element    locator=${Botao_pro_max}
    Scroll Element Into View    ${Botão_cor_branco}
    Click Element    ${Botão_cor_branco}
    Wait Until Element Is Visible   ${Botão_1T}
    Scroll Element Into View    ${Botão_1T}
    Click Element    ${Botão_1T}
E adiciono no carrinho de compras
    Scroll Element Into View    ${Botao_add_bolsa}
    Click Element    ${Botao_add_bolsa}
    Wait Until Element Is Visible    ${Botao_reveja_bolsa}
    Click Element    ${Botao_reveja_bolsa}
E removo do carrinho de compras
    Wait Until Element Is Visible    ${Botão_remover}
    Click Element    ${Botão_remover}
Então confirmo se o carrinho está vazio
    Click Button    ${Fechar_Notificacao}
    Set Selenium Implicit Wait    10 
    Scroll Element Into View    ${Texto_Bolsa_vazia}
    Wait Until Element Is Visible    ${Texto_Bolsa_vazia}
    ${Texto_Da_Bolsa}=     Get Text    ${Texto_Bolsa_vazia}
    Log To Console    ${Texto_Da_Bolsa}
    Log To Console    ${Texto_Bolsa_vazia}
    IF    $Texto_Da_Bolsa == $Texto_esperado_bolsa_vazia
    Log To Console  O produto foi removido com sucesso
    ELSE 
    Log To Console  O produto não foi removido
    END