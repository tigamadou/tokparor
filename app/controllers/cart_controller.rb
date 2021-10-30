class CartController < ApplicationController
  before_action :set_cart,:set_shop_datas
  def show
    @cart = @current_cart
  end

  

  def edit
  end

  def create    
    chosen_product = Product.find(params[:cart][:product_id])
    current_cart = @current_cart
  
    if current_cart.products.include?(chosen_product)
      @cart_product = current_cart.cart_products.find_by(:product_id => chosen_product)     
      @cart_product.quantity += params[:cart][:quantity].to_i
    else
      @cart_product = CartProduct.new
      @cart_product.cart = current_cart
      @cart_product.product = chosen_product
    end
  
    
    @cart_product.save
    redirect_to show_cart_path
    
    

   
  end

  def save 

  end

  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      
    end
  end

  private
    def set_cart
      
    end

    def cart_params
      params.require(:cart).permit(:total,:quantity, :user_id,)
    end

    def proceed_cart

    end
end
