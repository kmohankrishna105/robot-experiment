*** Settings ***
Library  Selenium2Library
Library  Dialogs

Library  RequestsLibrary
Library          SCPLibrary
Library          String
*** Variables ***
${VERBOSE_CONSOLE}  False
*** Keywords ***

Open website
    ${sectestcase_variable} =  set variable  jio merey laal hero 111 222
    log  ${sectestcase_variable}
    ${request_payload} =  create request payload
    log  ${request_payload}
    log to console  ${request_payload}
    ${code} =  post request new  "router/remotemgmt"
    log  ${code}
    log to console  Response code-${code}

    #${output1}=  set variable  'up 5 days, 12:28,  load'
    #${output1}=  set variable  'up 13 min,  load'
    ${output1}=  set variable  'up 11:54,  load'
    ${output} =  Convert To String  ${output1}
    ${up_str1} =  Fetch From Left  ${output}  load
    ${up_str2} =  Fetch From Right    ${up_str1}    up
    ${up_str3} =  Strip String  ${up_str2}
    log to console  ${up_str3}

    ${uptime_str} =  Strip String    ${up_str3}    characters=" ",
    log to console  ${uptime_str}
    Run Keyword If  ${VERBOSE_CONSOLE}  Log To Console  \nRouter uptime: ${uptime_str}
    ${minutes} =  Run Keyword If  'min' in '${uptime_str}'    Strip String    ${uptime_str}    characters=min  ELSE  Fetch From Right  ${uptime_str}  :


    log to console  ${minutes}
    ${minutes_int} =    Convert To Integer    ${minutes}
    ${not_minutes}    ${trash} =    Run Keyword If     'min' not in '${uptime_str}'    Split String    ${uptime_str}    :
    ${hours} =    Run Keyword If    $not_minutes != None    Fetch From Right    ${not_minutes}    ,
    ...           ELSE    Set Variable    0
    ${days} =    Run Keyword If    'days' in '${not_minutes}'    Fetch From Left    ${not_minutes}    days
    ...          ELSE    Set Variable    0
    # In robot-framework v3.2 can use ${{int{minutes)}} rather than Convert To Integer above
    ${uptime} =    Evaluate    ${minutes_int} + 60*${hours} + 1440*${days}
    log to console  Total time in minutes:${uptime}
    Run Keyword If    ${VERBOSE_CONSOLE}    Log To Console    \nRouter uptime in minutes: ${uptime}

    or
    ${tmp_pwd} =  Enable SSh via SCL  ${SSHDURATION}


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


post request new
    [Arguments]  ${str}
    [Documentation]    When keyword fails, this passes, but a warning is issued.
    [Return]  200

Run Keyword And Warn On Failure
    #applicable for code pull request
    [Arguments]  ${kw}  @{args}
    [Documentation]    When keyword fails, this passes, but a warning is issued.
    ${state}  ${output}=  Run Keyword And Ignore Error  ${kw}  @{args}
    Run Keyword If  '${state}'!='PASS'  Log  Warning: Keyword failed: ${kw} @{args}{\n}${output}  WARN
    [Return]  ${output}
