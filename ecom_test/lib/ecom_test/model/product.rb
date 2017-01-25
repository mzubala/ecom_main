module EcomTest
  module Model
    class Product

      attr_reader :name, :description, :price

      def initialize(attributes)
        @name = attributes[:name]
        @description = attributes[:description]
        @price = attributes[:price]
      end
    end
  end
end
