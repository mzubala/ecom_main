class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token, only: :clean_db

  def clean_db
    Spree::Product.all.map { |p| p.destroy! }
    Spree::Variant.with_deleted.map { |v| v.destroy! }
    Spree::StockItem.all.map { |si| si.destroy! }
    Spree::Taxonomy.all.map { |t| t.destroy! }
    Spree::Order.all.map { |o| o.destory! }

    render json: {status: 'done'}
  end

end
