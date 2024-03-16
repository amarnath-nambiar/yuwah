require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { about: @user.about, city: @user.city, deleted_at: @user.deleted_at, email: @user.email, first_name: @user.first_name, headline: @user.headline, last_name: @user.last_name, phone: @user.phone, type: @user.type } }, as: :json
    end

    assert_response :created
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { about: @user.about, city: @user.city, deleted_at: @user.deleted_at, email: @user.email, first_name: @user.first_name, headline: @user.headline, last_name: @user.last_name, phone: @user.phone, type: @user.type } }, as: :json
    assert_response :success
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user), as: :json
    end

    assert_response :no_content
  end
end
