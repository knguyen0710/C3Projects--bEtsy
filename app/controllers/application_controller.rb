class ApplicationController < ActionController::Base

  before_action :set_user
  helper_method :current_order

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_user
    @user = User.find_by(id: session[:user_id])
  end

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      new_order = Order.create
      session[:order_id] = new_order.id
      new_order
    end
  end

  # def require_login
  #   redirect_to login_path unless session[:user_id]
  # end

  def authenticate_user
    if session[:user_id]
       # set current user object to @current_user object variable
      @current_user = User.find session[:user_id]
      return true
    else
      redirect_to(login_path)
      return false
    end
  end

  def save_login_state
    if session[:user_id]
      redirect_to user_path(@user.id)
      return false
    else
      return true
    end
  end

  def error_messages(instance)
    error_array = []
    instance.errors.messages.each do |key, value|
      error_array += [[key.to_s.capitalize, value.first]]
    end
    error_array
  end

  def category_exists_for_product?(product_id, category_id)
    product_categories = ProductCategory.where(product_id: product_id)
    product_categories.each do |pc|
      if pc.product_id == product_id && pc.category_id == category_id
        return true
      else
        return false
      end
    end
  end
end






