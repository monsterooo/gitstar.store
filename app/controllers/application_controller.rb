class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  # pundit 捕获没有权限时的处理
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def authen_user!
    unless current_user
      respond_to do |format|
        format.html { redirect_to "/" }
        format.json { render json: { error: "请登录后再试." }, status: 401 }
      end
    end
  end

  protected
    # devise 登录安全字段
    def configure_permitted_parameters
      added_attrs = [:email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
    # pundit 无权限时实际的处理方法
    def user_not_authorized
      flash[:alert] = "请登录后再试."
      redirect_to(root_path)
    end
end
