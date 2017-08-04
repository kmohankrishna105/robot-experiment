*** Settings ***
Library  Selenium2Library
Library  Dialogs
*** Keywords ***

Open website
    ${sectestcase_variable} =  set variable  jio merey laal hero 111
    log  ${sectestcase_variable}

    #OPEN BROWSER  http://www.amazon.com  chrome
    ${Broswer_selection} =  get selection from user  Which browser?  chrome  ie  firefox
    open browser  http://www.amazon.com  ${Broswer_selection}
    wait until element is visible  twotabsearchtextbox
Enter search criteria
    ${search_criteria} =  get value from user  Search string please!:
    #input text  twotabsearchtextbox  Iphone
    input text  twotabsearchtextbox  ${search_criteria}

click on submit
    click button  xpath=//input[@type="submit"]
    #wait until page contains  css=#s-result-count
    wait until page contains  results for

click on first search item
    click element  xpath=//*[@id="result_0"]/div/div/div/div[2]/div[1]/div[1]/a/h2
    wait until page contains  Back to search

Get price of First product

    ${get_price}=  get text  priceblock_ourprice
    ${new_variable} =  set variable  New variable for second changes
    log  ${get_price}

Adding item to cart
    click button  add-to-cart-button
    #click element  xpath=//*[@id="siAddCoverage-announce"]

Get title from the window
    ${hai} =  get title
    #should be equal  Amazon.com Shopping Cart	${hai}
