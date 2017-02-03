module EcomTest
  module Ui
    class OrderFeature

      def initialize
        @browser = Watir::Browser.new(:firefox)
      end

      def add_to_cart(count, product_name)
        products = api_client.search(product_name)
        slug = products["products"].first["master"]["slug"]
        @browser.goto(url("/products/#{slug}"))
        @browser.text_field(:id, "quantity").set(count)
        @browser.button(:text, "Add To Cart").click()
      end

      def get_cart
        @browser.goto(url("/cart"))
        line_items = @browser.elements(css: ".line-item").map do |row|
          {name: row.h4().text(), quantity: row.input().value()}
        end
        EcomTest::Model::Order.new(line_items, nil)
      end

      private

      def api_client
        @api_client ||= EcomTest::Api::Client.new
      end

      def url(path)
        "http://web:3000/#{path}"
      end

    end
  end
end
