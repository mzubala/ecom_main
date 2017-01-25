module EcomTest
  module Ui
    class CartFeature

      include Capybara::DSL
      include Helpers

      attr_reader :added_product

      def initialize(ui_driver = nil)
        @ui_driver = ui_driver
      end

      def add_product
        visit('/')
        find("#product_1 a").click
        save_added_product
        click_button('Add To Cart')
      end


      def get_cart
        return @cart unless @cart.nil?
        visit('/cart')
        items = all("tr.line-item").map do |cart_item|
          {
            name: cart_item.find(".cart-item-description h4").text,
            description: cart_item.find(".line-item-description").text,
            price: find_price(".cart-item-price")
          }
        end
        total = find_price(".cart-total .lead")
        @cart = EcomTest::Model::Cart.new(items, total)
      end

      private

      def save_added_product
        @added_product = EcomTest::Model::Product.new({
          name: find(".product-title").text,
          description: find("#product-description .well").text,
          price: find_price("#product-price .lead")
        })
      end

    end
  end
end
