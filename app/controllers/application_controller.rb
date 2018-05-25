class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Cart
  def create_cart
    create_cart
  end

  def destroy_cart
    destroy_cart
  end
  helper_method :create_cart

  end

