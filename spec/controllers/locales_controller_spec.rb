require "spec_helper"

describe LocaleSwitch::LocalesController do
  describe "GET #update" do
    before :each do
      I18n.available_locales = :en, :fr
      session[:locale] = :en
    end

    it "correctly updates locale in session" do
      get :update, l: "fr", use_route: "locale_switch"
      session[:locale].should eq :fr
    end

    context "with redirect_to parameter set" do
      subject do
        get :update, l: "fr", redirect_to: "/widgets", use_route: "locale_switch"
      end

      it { should redirect_to "/widgets" }
    end

    context "with a HTTP_REFERER header set" do
      subject do
        @request.env['HTTP_REFERER'] = "/widgets"
        get :update, l: "fr", use_route: "locale_switch"
      end

      it { should redirect_to "/widgets" }
    end

    context "with no redirect_to and no HTTP_REFERER header set" do
      subject do
        get :update, l: "fr", use_route: "locale_switch"
      end

      it { should redirect_to "/" }
    end
  end
end