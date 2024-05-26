*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Registration Page
Suite Teardown    Close Browser

*** Variables ***
${URL}            https://fakestore.testelka.pl/
${REGISTER_URL}   ${URL}moje-konto/
${USERNAME}       Wanda_1234
${PASSWORD}       Testowanie1515@@@!!!
${EMAIL}          pandawanda@wp.pl

*** Test Cases ***
#Register New User
  #  [Documentation]    Rejestracja nowego użytkownika.
   # Go To    ${REGISTER_URL}
  #  Input Text    id=reg_email    ${EMAIL}
   # Input Text    id=reg_password    ${PASSWORD}
 #   sleep    1
   # Click Button    xpath://*[@id="customer_login"]/div[2]/form/p[3]/button
 #   Wait Until Element Is Visible    xpath://*[@id="post-8"]/header/h1
 #   sleep    1
  #  Click button    xpath://*[@id="post-8"]/div/div/div/p[1]/a
   # sleep    1


Logowanie
    [Documentation]    Test logowania z prawidłowymi danymi.
    Go To    ${REGISTER_URL}
    Input Text    id=username    ${EMAIL}
    Input Text    id=password    ${PASSWORD}
    Click Button    xpath://*[@id="customer_login"]/div[1]/form/p[3]/button
    Wait Until Element Is Visible    xpath://*[@id="post-8"]/header/h1
    ${page_text}=    Get Text    xpath://*[@id="post-8"]/header/h1
    Should Be Equal As Strings    ${page_text}    Moje konto


View Product List
    [Documentation]    Test przeglądania listy produktów.
    Go To    ${URL}
    Wait Until Page Contains Element    xpath://ul[contains(@class, 'products')]
    Element Should Be Visible    xpath://ul[contains(@class, 'products')]

Add Product To Cart
    [Documentation]    Test dodawania produktu do koszyka.
    Go To    ${URL}
    Click element    xpath://*[@id="main"]/section[2]/div/ul/li[2]/a[1]/img
    sleep    1
    click button    xpath://*[@id="product-4114"]/div[2]/form/button
    sleep    1
    Wait Until Page Contains    "Zobacz koszyk"

*** Keywords ***
Open Browser To Registration Page
    Open Browser    ${REGISTER_URL}    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    id=reg_email

Search Product
    [Documentation]    Test wyszukiwania produktu na stronie.
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Input Text    id=woocommerce-product-search-field-0   yoga
    Press Keys    id=woocommerce-product-search-field-0  \\13   # Enter key
    Wait Until Page Contains Element    xpath://*[@id="main"]/header/h1
    Element Should Be Visible    xpath://*[@id="main"]/header/h1
