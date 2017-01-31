module EcomTest
  module Model
    class Order < Struct.new(:order_items, :total)

      def product_names
        cart_items.map { |i| i[:name] }
      end

    end
  end
end
