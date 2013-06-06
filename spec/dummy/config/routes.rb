Rails.application.routes.draw do
  mount LocaleSwitch::Engine => "/locale_switch", as: "locale_switch"
end
