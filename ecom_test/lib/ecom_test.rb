require "active_support"
require "active_support/core_ext/string"
require 'faraday'
require "ecom_test/version"
require "ecom_test/ui/helpers"
require "ecom_test/model/product"
require "ecom_test/model/cart"
require "ecom_test/ui/cart_feature"
require "ecom_test/api/client"
require "ecom_test/api/helpers"
require "ecom_test/api/cart_feature"

module EcomTest

  STRATEGIES = ["ui", "api"]

  def order_feature
    @order_feature ||= create_feature("order")
  end

  def api_client
    @client ||= Api::Client.new
  end

  private

  def create_feature(feature)
    feature_class(feature).new
  end

  def feature_class(feature)
    "#{strategy}::#{feature.camelize}Feature".constantize
  end

  def strategy
    param = ENV["STRATEGY"]
    raise "no such testing strategy #{param}" unless param.nil? || STRATEGIES.include?(param)
    (param || 'ui').camelize
  end

end
