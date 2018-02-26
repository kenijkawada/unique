require 'test_helper'

class IntroductionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @introduction = introductions(:one)
  end

  test "should get index" do
    get introductions_url
    assert_response :success
  end

  test "should get new" do
    get new_introduction_url
    assert_response :success
  end

  test "should create introduction" do
    assert_difference('Introduction.count') do
      post introductions_url, params: { introduction: { body: @introduction.body, user_id: @introduction.user_id } }
    end

    assert_redirected_to introduction_url(Introduction.last)
  end

  test "should show introduction" do
    get introduction_url(@introduction)
    assert_response :success
  end

  test "should get edit" do
    get edit_introduction_url(@introduction)
    assert_response :success
  end

  test "should update introduction" do
    patch introduction_url(@introduction), params: { introduction: { body: @introduction.body, user_id: @introduction.user_id } }
    assert_redirected_to introduction_url(@introduction)
  end

  test "should destroy introduction" do
    assert_difference('Introduction.count', -1) do
      delete introduction_url(@introduction)
    end

    assert_redirected_to introductions_url
  end
end
