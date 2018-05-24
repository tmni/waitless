class SessionsController < ApplicationController
  include AppHelpers::Cart
  def new
  end

  def create
    create_cart
  end

  def destroy
    destroy_cart
  end
end