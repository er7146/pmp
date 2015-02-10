class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => :current_cart

 def current_cart
  session[:cart_id] ||= Cart.create(:user_id => current_user.id).id
  @current_cart ||= Cart.find(session[:cart_id])
 end

  def index
    #@users = User.all
    @user = current_user
    #current_user = User.find(params[:id])
      @cart = Cart.find_by(id: session[:cart_id])
    if @cart == nil
      @cart = Cart.new
      @cart.user_id = current_user.id
      @cart.ship_method_id = ShipMethod.first.id
      @cart.save!
      session[:cart_id] = @cart.id

      Product.all.each do |product|
        CartLine.create! cart_id: @cart.id, product_id: product.id, quantity: 0
      end
    end

    @products = Product.order("name")
    @user_id  = current_user.id
    @ship_methods = ShipMethod.order(:id)
    render :index and return
  end
  
   def index_post
    @cart = Cart.find_by(id: session[:cart_id])
    #@cart.user_id = params['user_id']
    # Update quantities
    Product.all.each do |product|
      quantity = params["quantity_#{product.id}"]
      line = CartLine.find_by(cart_id: @cart.id, product_id: product.id)
      line.quantity = quantity
      line.save!
    end
    # Update ship_method_name
    #@cart.po_num = params['po_num']
    @cart.ship_method_id = params['ship_method_id']
    @cart.save!

    redirect_to "/users/#{current_user.id}" and return
  end
  
  def show
    @user = User.find_by_id(params[:id])
    @cart = Cart.find_by(id: session[:cart_id])
    unless @user == current_user
      #redirect_to :back, :alert => "Access denied."
     render :show and return
     
  end
 end
end
