class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale_based_on_hostname


  private

  def set_locale_based_on_hostname
    I18n.locale = case request.host
                    when 'dwo.mikstura.it'
                      :pl
                    when 'opensourcedays.mikstura.it'
                      :en
                    else
                      I18n.default
                  end
  end
end
