require "test_helper"

class DenominationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @denomination = denominations(:one)
  end

  test "should get index" do
    get denominations_url
    assert_response :success
  end

  test "should get new" do
    get new_denomination_url
    assert_response :success
  end

  test "should create denomination" do
    assert_difference('Denomination.count') do
      post denominations_url, params: { denomination: { fifty: @denomination.fifty, five: @denomination.five, five_hundred: @denomination.five_hundred, hundred: @denomination.hundred, one: @denomination.one, shop_id: @denomination.shop_id, ten: @denomination.ten, twenty: @denomination.twenty, two: @denomination.two } }
    end

    assert_redirected_to denomination_url(Denomination.last)
  end

  test "should show denomination" do
    get denomination_url(@denomination)
    assert_response :success
  end

  test "should get edit" do
    get edit_denomination_url(@denomination)
    assert_response :success
  end

  test "should update denomination" do
    patch denomination_url(@denomination), params: { denomination: { fifty: @denomination.fifty, five: @denomination.five, five_hundred: @denomination.five_hundred, hundred: @denomination.hundred, one: @denomination.one, shop_id: @denomination.shop_id, ten: @denomination.ten, twenty: @denomination.twenty, two: @denomination.two } }
    assert_redirected_to denomination_url(@denomination)
  end

  test "should destroy denomination" do
    assert_difference('Denomination.count', -1) do
      delete denomination_url(@denomination)
    end

    assert_redirected_to denominations_url
  end
end
