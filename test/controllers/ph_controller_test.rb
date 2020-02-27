require 'test_helper'

class PhControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ph = ph(:one)
  end

  test "should get index" do
    get ph_index_url
    assert_response :success
  end

  test "should get new" do
    get new_ph_url
    assert_response :success
  end

  test "should create ph" do
    assert_difference('Ph.count') do
      post ph_index_url, params: { ph: { measure: @ph.measure } }
    end

    assert_redirected_to ph_url(Ph.last)
  end

  test "should show ph" do
    get ph_url(@ph)
    assert_response :success
  end

  test "should get edit" do
    get edit_ph_url(@ph)
    assert_response :success
  end

  test "should update ph" do
    patch ph_url(@ph), params: { ph: { measure: @ph.measure } }
    assert_redirected_to ph_url(@ph)
  end

  test "should destroy ph" do
    assert_difference('Ph.count', -1) do
      delete ph_url(@ph)
    end

    assert_redirected_to ph_index_url
  end
end
