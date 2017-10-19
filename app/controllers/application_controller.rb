class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  helper_method :group_message

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def group_message(group)
    message = Message.where(group_id: group).last
    if (message.body)
      message.body
    else
      "ありません"
    end
  end
end
