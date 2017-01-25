module EcomTest
  module Model
    class Cart < Struct.new(:cart_items, :total)

      def product_names
        cart_items.map { |i| i[:name] }
      end

    end
  end
end
