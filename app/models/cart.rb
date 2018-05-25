module Cart
    # For this application, our cart is simply an array consisting
    # of CartItem structs.  The array is saved as a session variable
    # that the user should have available during the course of their
    # interactions w/ system.

    CartItem = Struct.new(:item_name, :price, :barcode_id)

    def create_cart
      session[:cart] ||= Array.new
    end

    def clear_cart
      create_cart
    end

    def destroy_cart
      session[:cart] = nil
    end

    def add_to_cart(item_name, price, barcode_id)
      # only add the registration if not already in the cart
      # if not, create a cart item for easy display later
      ci = CartItem.new(item_name, price, barcode_id)
      session[:cart].push(ci)
      ci
    end

    def remove_from_cart(barcode_id)
      session[:cart].each do |ci|
        session[:cart].delete(ci) if ci['barcode_id'] == barcode_id
        return
      end
    end

    def calculate_total_cart_cost
      total = 0.0
      return total if session[:cart].empty? # skip if cart empty...
      session[:cart].each do |cart_item|
        total += cart_item['price']
      end
      total
    end

end
  