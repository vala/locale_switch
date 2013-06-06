module LocaleSwitch
  module ControllerHelper
    extend ActiveSupport::Concern

    included do
      before_filter :process_locale!
    end

    protected

    def process_locale!
      # Fetch locale from session or HTTP_ACCEPT_LANGUAGE header
      locale = session[:locale] || request.env['HTTP_ACCEPT_LANGUAGE']
      # Ensure locale is a string for processing
      locale = locale.to_s if locale
      # Try to find the locale in available ones
      locale = I18n.available_locales.find do |item|
        (locale.match item.to_s) || (item.to_s.split(/\-/).shift.match locale)
      end if locale
      # Get processed locale or first available one. Assign it to app's locale
      # and store it in session
      session[:locale] = I18n.locale = locale || I18n.available_locales.first
    end
  end
end
