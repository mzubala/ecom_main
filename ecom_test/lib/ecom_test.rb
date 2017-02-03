require "active_support"
require "active_support/core_ext/string"
require 'faraday'
require 'require_all'
require 'watir-webdriver'
require 'rspec'

require_rel 'ecom_test'


module EcomTest

  STRATEGIES = ["ui", "api"]

  def order_feature
    @order_feature ||= create_feature("order")
  end

  def catalog_feature
    @catalog_feature ||= create_feature("catalog")
  end

  def api_client
    @client ||= Api::Client.new
  end

  def clear_db
    api_client.clear_db
  end

  private

  def create_feature(feature)
    feature_class(feature).new
  end

  def feature_class(feature)
    "EcomTest::#{strategy}::#{feature.camelize}Feature".constantize
  end

  def strategy
    param = ENV["STRATEGY"]
    raise "no such testing strategy #{param}" unless param.nil? || STRATEGIES.include?(param)
    (param || 'ui').camelize
  end

end
