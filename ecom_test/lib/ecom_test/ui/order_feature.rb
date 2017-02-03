module EcomTest
  module Ui
    class OrderFeature

      def initialize
        @browser =  Watir::Browser.new(:firefox)
      end

      def add_to_cart(count, product_name)
        products = api_client.search(product_name)
        slug = products["products"].first["master"]["slug"]
        @browser.goto(url("/products/#{slug}"))
        puts @browser.html
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
