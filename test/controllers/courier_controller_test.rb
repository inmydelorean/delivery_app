require 'test_helper'

class CourierControllerTest < ActionDispatch::IntegrationTest
  setup do
    @courier = couriers(:one)
  end

  test "should get index" do
    get couriers_url
    assert_response :success
  end

  test "should get show" do
    get courier_url(@courier)
    assert_response :success
  end

  test "should get new" do
    get new_courier_url
    assert_response :success
  end

  test "should get edit" do
    get edit_courier_url(@courier)
    assert_response :success
  end

  test "should create courier" do
    couriers_before_test = Courier.count
    post couriers_url, params: { courier: { name: @courier.name, email: @courier.email } }
    assert_equal couriers_before_test + 1, Courier.count
    assert_redirected_to courier_url(Courier.last)
  end

  test "should update courier" do
    patch courier_url(@courier), params: { courier: { name: @courier.name, email: @courier.email } }
    assert_redirected_to courier_url(@courier)
  end
end
