require 'test_helper'

module LocaleSwitch
  class LocalesControllerTest < ActionController::TestCase
    test "should get update" do
      get :update
      assert_response :success
    end
  
  end
end
