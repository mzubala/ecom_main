module EcomTest
  module Api
    class CartFeature

      include Helpers

      attr_reader :added_product

      def add_product
        product = api_client.get_products["products"].first
        @order = api_client.create_order([{variant_id: product["id"], quantity: 1}])
        @added_product = EcomTest::Model::Product.new(name: product["name"], description: product["description"], price: product["price"].to_f)
      end

      def get_cart
        return @cart unless @cart.nil?
        items = @order["line_items"].map do |i|
          {
            name: i["variant"]["name"],
            description: i["variant"]["description"],
            price: i["variant"]["total"]
          }
        end
        @cart = EcomTest::Model::Cart.new(items, @order["total"].to_f)
      end

    end
  end
end
