require 'test_helper'

class ShieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shield = shields(:one)
  end

  test "should get index" do
    get shields_url
    assert_response :success
  end

  test "should get new" do
    get new_shield_url
    assert_response :success
  end

  test "should create shield" do
    assert_difference('Shield.count') do
      post shields_url, params: { shield: {  } }
    end

    assert_redirected_to shield_url(Shield.last)
  end

  test "should show shield" do
    get shield_url(@shield)
    assert_response :success
  end

  test "should get edit" do
    get edit_shield_url(@shield)
    assert_response :success
  end

  test "should update shield" do
    patch shield_url(@shield), params: { shield: {  } }
    assert_redirected_to shield_url(@shield)
  end

  test "should destroy shield" do
    assert_difference('Shield.count', -1) do
      delete shield_url(@shield)
    end

    assert_redirected_to shields_url
  end
end
