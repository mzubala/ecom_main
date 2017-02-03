module EcomTest
  module Api
    class OrderFeature

      def add_to_cart(count, product_name)
        products = api_client.search(product_name)
        product = products["products"].first
        variant_id = product["master"]["id"]
        if @order.nil?
          @order = api_client.create_order([{variant_id: variant_id, quantity: count}])
        else
          api_client.create_line_item(@order["number"], variant_id, count)
        end
      end

      def get_cart
        order = api_client.get_order(@order["number"])
        line_items = order["line_items"].map do |line_item|
          {name: line_item["variant"]["name"], quantity: line_item["quantity"].to_s}
        end
        EcomTest::Model::Order.new(line_items, order["total"])
      end

      private

      def api_client
        @client ||= Client.new
      end
    end
  end
end
