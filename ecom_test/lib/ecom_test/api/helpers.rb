module EcomTest
  module Api
    module Helpers

      def api_client
        @client ||= Client.new
      end

    end
  end
end
