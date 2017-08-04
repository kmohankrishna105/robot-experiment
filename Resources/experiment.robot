r*** Settings ***

*** Variables ***
${scelar_x} =  q
@{list_y} =  1  2  This is list
&{dic_keyvalue}  q=yahoo  w=rediff  e=wikipedia  r=google

*** Keywords ***
Value display
  [Tags]  value display-Keyword
    log  ${scelar_x}

    log  @{list_y}[1]
    log  ${dic_keyvalue.${scelar_x}}

The Browser open
  [Tags]  Keyword-browsedr open
  [Documentation]  document chrome open




*** Test Cases ***

should display the value
  [Tags]  display the value-Test case

  value display

Open Browser
  [Tags]  Open browser ased on the scelar input
  [Documentation]  Hi this is a browser initiation based on input and execution
