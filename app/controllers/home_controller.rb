class HomeController < ApplicationController
  include Cart

  def index
  end

  def scan
  end

  def history
  end

  def cart
    @total = calculate_total_cart_cost
  end
end