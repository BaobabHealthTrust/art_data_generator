require 'test_helper'

class GeneratorControllerTest < ActionDispatch::IntegrationTest
  test "should get patients" do
    get generator_patients_url
    assert_response :success
  end

end
