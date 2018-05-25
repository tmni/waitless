class CartsController < ApplicationController
  
  authorize_resource

  def index
    @items = session[:cart]
    @total = calculate_total_cart_cost
  end

  def create
    add_to_cart(:camp_id, :student_id)
    camp = Camp.find(:camp_id)
    student = Student.find(:student_id)
    flash notice: "#{camp.name} for #{student.first_name} was added to your cart!"

  end

  def destroy
    remove_registration_from_cart(:camp_id, :student_id)
    camp = Camp.find(:camp_id)
    student = Student.find(:student_id)
    flash notice: "#{camp.name} for #{student.first_name} was removed from your cart."
  end

end