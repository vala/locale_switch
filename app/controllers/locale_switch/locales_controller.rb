require_dependency "locale_switch/application_controller"

module LocaleSwitch
  class LocalesController < ApplicationController
    def update
      session[:locale] = params[:l]
      process_locale!
      redirect_to params[:redirect_to] ||
                  request.env['HTTP_REFERER'] ||
                  "/"
    end
  end
end
