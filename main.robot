* Settings *
Documentation     Testing on FLIPKART
Library           SeleniumLibrary

 
* Variables *
${URL}      https://flipkart.com
${BROWSER}        Chrome
 
* Test Cases *
Valid Test
    Open Browser To flipkart
    Input username    username
    Input password    password
    Login
    Press electronics & add to cart
    Check Item in Cart
    [Teardown]    Close Browser
    
 
*** Keywords ***
Open Browser To flipkart
    Open Browser    ${URL}    ${BROWSER}


Input username
    [Arguments]    ${username}
    Input Text  //html/body/div[2]/div/div/div/div/div[2]/div/form/div[1]/input  8492809554   ${username}

Input password
    [Arguments]    ${password}
    Input Text  //html/body/div[2]/div/div/div/div/div[2]/div/form/div[2]/input  kanav554  ${password}
 
Login
    Click Button    //html/body/div[2]/div/div/div/div/div[2]/div/form/div[4]/button
    Sleep  3s
    
 
Press electronics & add to cart

    Click Image    //*[@id="container"]/div/div[2]/div/div/div[3]/a/div[1]/div/img
    Sleep   3s
    Click Image    //*[@id="container"]/div/div[3]/div[5]/div/div[1]/a/div/img[2]
    Sleep   3s
    Click Image    //*[@id="container"]/div/div[3]/div/div/div[2]/div[1]/a/div[1]/div/img 
    Sleep   3s
    ${cart}    Get Text    //*[@id="container"]/div/div[3]/div/div[2]/div[2]/div/div[1]/div/a[2]
    Click Link     //*[@id="container"]/div/div[3]/div/div[2]/div[2]/div/div[1]/div/a[2]
    Sleep   3s 
    Switch Window    new
    Click Button   //*[@id="container"]/div/div[3]/div[1]/div[1]/div[2]/div/ul/li[1]/button
    

Check Item in Cart
    ${added}   Get Text    //*[@id="container"]/div/div[3]/div[1]/div[2]/div[2]/div/div[1]/h1/span
    IF    ${added} == Qrioh Back Cover for Realme 5, Realme 5s, Realme 5i
    Pass Execution    "${cart} == ${added}"
    ELSE   
    Log To Console    Not Added 
    Sleep   33s