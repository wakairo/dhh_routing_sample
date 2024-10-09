require "test_helper"

class Users::AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_admins_path
    assert_response :success
  end

  test "should get new" do
    get new_users_admin_path
    assert_response :success
  end

  test "should add admin" do
    user = User.not_admin.first

    assert_difference("User.admin.count") do
      patch user_admins_path(user)
    end

    assert_redirected_to users_admins_path
  end

  test "should remove from admin" do
    user = User.admin.first

    assert_difference("User.admin.count", -1) do
      delete user_admins_path(user)
    end

    assert_redirected_to users_admins_path
  end
end
