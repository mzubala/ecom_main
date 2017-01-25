module EcomTest
  module Api
    class Client
      def get_products
        get("/products")
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

    end
  end
end
