class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  private

  def set_locale
    I18n.locale = locale_based_on_params || locale_based_on_host || I18n.default_locale
  end

  def locale_based_on_params
    params['locale']
  end

  def locale_based_on_host
    case request.host
      when 'dwo.mikstura.it'
        :pl
      when 'opensourcedays.mikstura.it'
        :en
    end
  end
end
