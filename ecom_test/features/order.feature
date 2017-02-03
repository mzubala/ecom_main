Feature: Placing orders

  In order to receive offered products
  As a Shopper
  I want to place an order

  Background:
    Given the shop offers:
      | name   |
      | Gloves |
      | Shoes  |

  Scenario: The one where user adds several items to the cart
    When Matt adds 2 Shoes to cart
    And Matt adds 1 Gloves to cart
    Then Matt's cart contains:
      | name   | quantity |
      | Gloves | 1        |
      | Shoes  | 2        |

  Scenario: The one where user removes some products from the cart
    Given Matt has following items in cart
      | name   | quantity |
      | Gloves | 1        |
      | Shoes  | 2        |
    When Matt removes "Gloves" from cart
    Then Matt's cart contains:
      | name  | quantity |
      | Shoes | 2        |