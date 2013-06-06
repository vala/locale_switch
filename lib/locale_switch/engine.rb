module LocaleSwitch
  class Engine < ::Rails::Engine
    isolate_namespace LocaleSwitch

    initializer "Include LocaleSwitch::ControllerHelper in ApplicationController" do
      ActiveSupport.on_load :action_controller do
        ActionController::Base.send(:include, ControllerHelper)
      end
    end
  end
end
