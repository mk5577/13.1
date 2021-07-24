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
    [Teardown]    Close Browser
    
 
*** Keywords ***
Open Browser To flipkart
    Open Browser    ${URL}    ${BROWSER}


Input username
    [Arguments]    ${username}
    Input Text  //html/body/div[2]/div/div/div/div/div[2]/div/form/div[1]/input  8492809554   ${username}

Input password
    [Arguments]    ${password}
    Input Text  //html/body/div[2]/div/div/div/div/div[2]/div/form/div[2]/input  kanav554  ${password}#enter your password kanav554 was a temp password
 
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
    Click Link      //*[@id="container"]/div/div[1]/div[1]/div[2]/div[5]/div/div/a
    Sleep   3s
    ${added}   Get Text    //*[@id="container"]/div/div[2]/div/div/div[1]/div/div[2]/div/div[1]/div[1]/div[1]/a
    IF    "${added}" == "${cart}"
    Log To Console   Added "${added}"
    ELSE   
    Log To Console    Not Added 
    END
    Sleep   33s    

