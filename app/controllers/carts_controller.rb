class CartsController < ApplicationController


  def index
    @items = session[:cart]
    @total = calculate_total_cost
  end

  def create
    add_to_cart(session[:rows], item_name, price, barcode_id)
  end

  def destroy(row)
    remove_from_cart(row, item_name, price, barcode_id)
  end

end