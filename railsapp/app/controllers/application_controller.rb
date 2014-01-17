class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  private

  def set_locale
    extracted_locale = params[:locale] || extract_locale_from_accept_language
    I18n.locale = I18n::available_locales.include?(extracted_locale) ? extracted_locale : I18n.default_locale
  end

  def extract_locale_from_accept_language
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first.to_sym
  end

end
