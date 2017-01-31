module EcomTest
  module Api
    class OrderFeature

      private

      def api_client
        @client ||= Client.new
      end
    end
  end
end
