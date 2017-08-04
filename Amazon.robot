*** Settings ***
Library  Selenium2Library


*** Variables ***
${variable_s} =  This is a variable

*** Test Cases ***

Open website
    log  ${variable_s}
    ${sectestcase_variable} =  set variable  jio merey laal
    log  ${sectestcase_variable}
    OPEN BROWSER  http://www.amazon.com  chrome
Enter search criteria
    input text  twotabsearchtextbox  Iphone

click on submit
    click button  xpath=//input[@type="submit"]
    #wait until page contains  css=#s-result-count
    wait until page contains  results for

click on first search item
    click element  xpath=//*[@id="result_0"]/div/div/div/div[2]/div[1]/div[1]/a/h2
    wait until page contains  Back to search

Get price of First product
    ${get_price}=  get text  priceblock_ourprice
    log  ${get_price}

Adding item to cart
    click button  add-to-cart-button
    #click element  xpath=//*[@id="siAddCoverage-announce"]

Get title from the window
    ${hai} =  get title
    #should be equal  Amazon.com Shopping Cart	${hai}
