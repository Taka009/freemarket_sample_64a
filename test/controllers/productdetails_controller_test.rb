require 'test_helper'

class ProductdetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get productdetails_index_url
    assert_response :success
  end

end
