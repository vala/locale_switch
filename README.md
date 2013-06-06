# Locale Switch

Locale Switch is a small Rails engine which purpose is to handle locales
switching and constraints in your app.

-----

It does the contraining part by processing the user's locale from
HTTP_ACCEPT_LANGUAGE header when landing in the app, through a `before_filter`
in your controllers. It then stores it in session for further configuration
and reuse.

The switching part comes with a simple helper `link_to_switch_locale(locale)`
which accepts the same arguments than a normal link_to except from the route
part.
When used, this link will route to an internal controller action that just tries
to switch the locale with the same filtering logic, ensuring locale is always
an available one.

## Installation

Simply add the gem to your `Gemfile` and `bundle install` :

```ruby
gem "locale_switch", :git => "git://github.com/vala/locale_switch"
```

Then mount switch locale engine in your `config/routes.rb`

```ruby
mount LocaleSwitch::Engine => "/switch-locale"
```

## Usage

Configure available locales in your `config/application.rb` :

```ruby
config.i18n.available_locales = :en, :fr
```

Now you can use the helper somewhere in your views :

```erb
<ul class="locales-list">
  <li <%= 'class="active"' if I18n.locale == :en %>>
    <%= link_to_switch_locale "English" %>
  </li>
  <li <%= 'class="active"' if I18n.locale == :fr %>>
    <%= link_to_switch_locale "Français" %>
  </li>
</ul>
```
