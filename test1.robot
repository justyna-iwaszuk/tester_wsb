*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${uzytkownik}   RobotTest@robot.com
${haslo}   RobotFramework1234!
${Browser}   chrome
${StronaUrl}    https://fakestore.testelka.pl/
#${not proper password}   12345
#${error_message}   Wystąpił problem z wprowadzonymi danymi

*** Keywords ***
#Rejestracja
 #  [Arguments]  ${login}    ${password}
 #   open browser    ${StronaUrl}  ${Browser}
 #   click link    xpath://*[@id="menu-item-201"]/a
  #  wait until element is visible  xpath://*[@id="customer_login"]/div[2]/form/p[3]/button
  #  sleep   2
  #  input text  id:reg_email  ${login}
  #  sleep    1
  #  input password   id:reg_password  ${password}
  #  sleep   3
  #  click button   xpath://*[@id="customer_login"]/div[2]/form/p[3]/button

Zalogowanie
    [Arguments]  ${login}  ${password}
    open browser    ${StronaUrl}    ${Browser}
    click link    xpath://*[@id="menu-item-201"]/a
    wait until element is visible    xpath: //*[@id="username"]
    input text    id:username    ${login}
    sleep    1
    input text    id:password    ${password}
    sleep    1
    click button  xpath://*[@id="customer_login"]/div[1]/form/p[3]/button

*** Test Cases ***
#Pierwsza rejestracja
  #  Rejestracja  ${uzytkownik}    ${haslo}
 #   sleep  2
 #   wait until element is visible    xpath://*[@id="post-8"]/div/div/nav/ul/li[1]/a
 #   click button    xpath://*[@id="post-8"]/div/div/nav/ul/li[5]/a

Successful login
   Zalogowanie  ${uzytkownik}    ${haslo}
    sleep  2
   wait until element is visible  xpath://*[@id="post-8"]/div/div/div/p[1]/a
    page should contain
