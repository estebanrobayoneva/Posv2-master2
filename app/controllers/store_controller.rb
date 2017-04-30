class StoreController < ApplicationController
  def index
    @products = Product.order(:nombre)
    @cart = current_cart
  end
end