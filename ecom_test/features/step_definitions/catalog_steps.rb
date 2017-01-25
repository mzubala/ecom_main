When(/^I add a product to cart$/) do
  cart_feature.add_product
end

Then(/^the product should be in my cart/) do
  cart = cart_feature.get_cart
  expect(cart.product_names).to include(cart_feature.added_product.name)
end

Then(/^my cart total should be updated$/) do
  cart = cart_feature.get_cart
  expect(cart.total).to eq(cart_feature.added_product.price)
end
