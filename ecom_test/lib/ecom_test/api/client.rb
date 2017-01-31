module EcomTest
  module Api
    class Client
      def get_products
        get("/products")
      end

      def create_product(properties)
        ensure_shipping_category(properties)
        payload = {
          product: properties
        }
        product_data = post("/products", payload)
        create_stock(product_data, properties["stock"] || 5)
      end

      def create_stock(product_data, stock)
        payload = {
          stock_item: {
            count_on_hand: stock,
            variant_id: product_data["master"]["id"]
          }
        }
        post("/stock_locations/#{first_stock_location_id}/stock_items", payload)
      end

      def create_order(line_items)
        payload = {
          order: {
            line_items: line_items
          }
        }
        post("/orders", payload)
      end

      def get_order(number)
        get("/orders/#{number}")
      end

      def first_stock_location_id
        get("/stock_locations")["stock_locations"].first["id"]
      end

      private

      API_KEY = "111222333444555666777888999"

      def connection
        @connection ||= Faraday.new(url: "http://web:3000")
      end

      def get(url)
        response = connection.get(endpoint(url)) do |request|
          add_headers(request)
        end
        JSON.parse(response.body)
      end

      def post(url, hash)
        response = connection.post(endpoint(url), hash) do |request|
          add_headers(request)
        end
        JSON.parse(response.body)
      end

      def endpoint(url)
        "/api/v1" + url + ".json"
      end

      def add_headers(request)
        request.headers["X-Spree-Token"] = API_KEY
      end

      def ensure_shipping_category(properties)
        return if properties[:shipping_category_id].present?
        properties[:shipping_category_id] = 1
      end

    end
  end
end
