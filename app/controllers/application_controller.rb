class ApplicationController < ActionController::Base
  before_filter :authadmin
  before_filter :restrict_access
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def authadmin
    # This specifies the key-value-pair
    # params[:key] == "value"
    # ==> localhost:3000/?key=value
    # ==> localhost:3000/?password=password

    if params[:password] == "password"
      session[:admin] = true
    end
  end

  def is_admin?
    # validates the admin-state that's saved for each session
    session[:admin].present?
  end

  def restrict_access
    unless is_admin?
      redirect_to root_path, flash: {error: "Not authorized to access this page"}
    end
  end

  helper_method :is_admin?
end
