class OrderController < ApplicationController
 before_filter :authenticate_user!

def index
    @user = current_user
    #@orders = Order.all
    @orders = Order.order("id")
    render :index and return
  end
  
def new
    @user = current_user
    @order = Order.new
    @stamp = Stamp.new
    render :index and return
  end

  def new
    @order = Order.new
    @stamp = Stamp.new
    @order.user_id         = params["user_id"]
    @order.po_num          = params["po_num"]
    @order.product_id      = params["product_id"]
    @order.quantity        = params["quantity"]
    @stamp.stamp_type      = params["stamp_type"]
    @order.color_type      = params["color_type"]
    @order.copy_align      = params["copy_align"]
    @order.upload_file     = params["upload_file"]
    @order.size            = params["size"]
    @order.typestyle       = params["typestyle"]
    @order.line_1          = params["line_1"]
    @order.line_2          = params["line_2"]
    @order.line_3          = params["line_3"]
    @order.line_4          = params["line_4"]
    @order.line_5          = params["line_5"]
    @order.line_6          = params["line_6"]
    @order.line_7          = params["line_7"]
    @order.comments        = params["comments"]
  
    total_price = 100.00

    if @order.is_x_stamper == true
      total_price = total_price + 22.00
    end

    if @order.is_trodat_stamp == true
      total_price = total_price + 25.00
    end

    if @order.other == true
      total_price = total_price + 0.00
    end

    @order.total_price = total_price
  
    if @order.save == true
        flash[:success] = "Your order has been created"
       render :show and return
    else
      render :new and return
    end
  end
end
