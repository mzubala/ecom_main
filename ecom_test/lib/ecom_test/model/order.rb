module EcomTest
  module Model
    class Order < Struct.new(:order_items, :total)

      include RSpec::Matchers

      def product_names
        order_items.map { |i| i[:name] }
      end

      def expect_products(products)
        expect(order_items).to include(*products.map(&:symbolize_keys))
      end

    end
  end
end
