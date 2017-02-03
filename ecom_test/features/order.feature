Feature: Placing orders

  In order to receive offered products
  As a Shopper
  I want to place an order

  Scenario: The one where user adds several items to the cart
    Given the shop offers:
      | name   |
      | Gloves |
      | Shoes  |
    When Matt adds 2 Shoes to cart
    And Matt adds 1 Gloves to cart
    Then Matt's cart contains:
      | name   | quantity |
      | Gloves | 1        |
      | Shoes  | 2        |