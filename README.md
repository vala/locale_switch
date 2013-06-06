# Locale Switch

Locale Switch is a small Rails engine which purpose is to handle locales
switching and constraints in your app.

-----

It does the contraining part by processing the user's locale from
HTTP_ACCEPT_LANGUAGE header when landing in the app, through a `before_filter`
in your controllers. It then stores it in session for further configuration
and reuse.

To switch the current locale, you need to link to the engine root, it will
handle to switch the locale with the same filtering logic than in the global
`before_filter`, ensuring locale is always an available one.

## Installation

Simply add the gem to your `Gemfile` and `bundle install` :

```ruby
gem "locale_switch", :git => "git://github.com/vala/locale_switch"
```

Then mount switch locale engine in your `config/routes.rb`

```ruby
mount LocaleSwitch::Engine => "/switch-locale", as: "switch_locale"
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
    <%= link_to "English", switch_locale.root_path(l: "en") %>
  </li>
  <li <%= 'class="active"' if I18n.locale == :fr %>>
    <%= link_to "Français", switch_locale.root_path(l: "fr") %>
  </li>
</ul>
```
