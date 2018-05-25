class SessionsController < ApplicationController
  def new
  end

  def create
    create_cart
    puts "dfdksjfhaskdhdkfjhdkjdhfkd"
  end

  def destroy
    destroy_cart
  end

  helper_method :create
end