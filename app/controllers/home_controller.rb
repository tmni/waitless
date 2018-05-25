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

  def withdrawal
    @total = calculate_total_cart_cost
    num = "5b03908f322fa06b677938fb"
    data = {
        "medium": "balance",
        "transaction_date": Date.today,
        "status": "pending",
        "amount": @total,
        "description": "string"
    }
    Withdrawal.createWithdrawal(num, data)
    clear_cart
    return nil
  end
end