require 'test_helper'

class PackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @courier = couriers(:one)
  end

  test "should create package" do
    @package = packages(:one)
    packages_before_test = Package.count
    post courier_packages_url(@courier), params: { package: { tracking_number: @package.tracking_number, delivery_status: @package.delivery_status } }
    assert_equal packages_before_test + 1, Package.count
    assert_redirected_to courier_url(@courier)
  end

  test "should mark package as delivered" do
    @package = packages(:two)
    patch courier_package_url(@courier, @package), params: { package: { tracking_number: @package.tracking_number, delivery_status: true } }
    assert_redirected_to courier_url(@courier)
  end
end
