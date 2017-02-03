Given(/^the shop offers:$/) do |products_table|
  products_table.hashes.each do |product_data|
    api_client.create_product(product_data)
  end
end

When(/^Matt adds (\d+) (.+) to cart$/) do |count, product_name|
  order_feature.add_to_cart(count, product_name)
end

Then(/^Matt's cart contains:$/) do |products_table|
  cart = order_feature.get_cart()
  cart.expect_products(products_table.hashes)
end