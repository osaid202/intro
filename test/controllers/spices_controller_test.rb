require "test_helper"

class SpicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spice = spices(:one)
  end

  test "should get index" do
    get spices_url
    assert_response :success
  end

  test "should get new" do
    get new_spice_url
    assert_response :success
  end

  test "should create spice" do
    assert_difference("Spice.count") do
      post spices_url, params: { spice: { name: @spice.name } }
    end

    assert_redirected_to spice_url(Spice.last)
  end

  test "should show spice" do
    get spice_url(@spice)
    assert_response :success
  end

  test "should get edit" do
    get edit_spice_url(@spice)
    assert_response :success
  end

  test "should update spice" do
    patch spice_url(@spice), params: { spice: { name: @spice.name } }
    assert_redirected_to spice_url(@spice)
  end

  test "should destroy spice" do
    assert_difference("Spice.count", -1) do
      delete spice_url(@spice)
    end

    assert_redirected_to spices_url
  end
end
