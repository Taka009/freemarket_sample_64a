require 'test_helper'

class SellControllerTest < ActionDispatch::IntegrationTest
  test "should get sell_form" do
    get sell_sell_form_url
    assert_response :success
  end

end
