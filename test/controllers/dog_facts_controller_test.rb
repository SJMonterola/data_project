require "test_helper"

class DogFactsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dog_facts_index_url
    assert_response :success
  end

  test "should get show" do
    get dog_facts_show_url
    assert_response :success
  end
end
