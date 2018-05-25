class CartsController < ApplicationController


  def index
    @items = session[:cart]
    @total = calculate_total_cost
  end

  def create
    if params[:barcode_id]
      item = Item.find_by(barcode_id: params[:barcode_id])
      ci = add_to_cart(session[:rows], item.item_name, item.price, item.barcode_id)
      ci
    end
  end

  def destroy(row)
    remove_from_cart(row, item_name, price, barcode_id)
  end

end