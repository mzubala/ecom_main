module EcomTest
  module Ui
    module Helpers

      def find_price(selector)
        find(selector).text.strip.gsub("$", "").to_f
      end

    end
  end
end
