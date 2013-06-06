require "spec_helper"

describe ApplicationController do
  controller do
    def index
      render text: I18n.locale
    end
  end

  describe "before_filter #process_locale!" do
    before :each do
      I18n.available_locales = :en, :fr
    end

    it "automatically detects locale from 'HTTP_ACCEPT_LANGUAGE' header" do
      request.env["HTTP_ACCEPT_LANGUAGE"] = "fr"
      get :index
      session[:locale].should eq :fr
    end

    context "when chosen locale is available" do
      it "keeps current locale in session" do
        session[:locale] = "fr"
        get :index
        session[:locale].should eq :fr
      end
    end

    context "when chosen locale only matches language and not country" do
      it "takes the first matching language found as the locale" do
        session[:locale] = "fr-FR"
        get :index
        session[:locale].should eq :fr
      end
    end

    context "when chosen locale matches language and available one has a country" do
      it "takes the first matching language found as the locale" do
        I18n.available_locales = :en, :"fr-FR"
        session[:locale] = "fr"
        get :index
        session[:locale].should eq :"fr-FR"
      end
    end

    context "with no chosen locale" do
      it "uses the first available locale" do
        get :index
        session[:locale].should eq I18n.available_locales.first
      end
    end

    context "when chosen locale is not available" do
      before do
        session[:locale] = "de"
        get :index
      end

      it "doesn't keep the current locale" do
        session[:locale].should_not eq :de
      end

      it "replaces the session locale with the first one available" do
        session[:locale].should eq I18n.available_locales.first
      end
    end
  end
end