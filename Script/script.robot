*** Settings ***
Documentation  Script file to be initiated
Resource  ../Resources/Pann.robot


*** Test Cases ***
User must sign in first
#[Documentation] this is a amazon verification
#[Tags]Use case Amemded
  Pann.Open website

  Pann.Enter search criteria
  Pann.click on submit
  Pann.click on first search item
  Pann.Get price of First product
  Pann.Adding item to cart
  Pann.Get title from the window



