Rails.application.routes.draw do
  root to: "home#index"

  mount LocaleSwitch::Engine => "/locale_switch", as: "switch_locale"
end
