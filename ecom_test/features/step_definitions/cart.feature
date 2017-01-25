Feature: Shopping cart

  As a customer, I want to hold items in a shopping cart
  So that I can place an order for these items

  Scenario: Add item to cart
    When I add a product to cart
    Then the product should be in my cart
    And my cart total should be updated