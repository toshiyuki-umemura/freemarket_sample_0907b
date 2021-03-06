class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :header_category
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_keys = [:first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :birth_year, :birth_month, :birth_day, :phone_number, :profile_description]
    devise_parameter_sanitizer.permit(:sign_up, keys: devise_keys)
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def header_category
    @header_categories = Category.where(ancestry: nil)
  end

end
