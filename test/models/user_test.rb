require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "ExampleUser",
                     email: "user@example.com",
                     admin: false)
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
    @user.name = ""
    assert_not @user.valid?
    @user.name = nil
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
    @user.email = ""
    assert_not @user.valid?
    @user.email = nil
    assert_not @user.valid?
  end

  test "scope should work" do
    n_admin = User.admin.count
    assert_operator 0, :<, n_admin
    User.admin.each do |user|
      assert user.admin?
    end

    n_not_admin = User.not_admin.count
    assert_operator 0, :<, n_not_admin
    User.not_admin.each do |user|
      assert_not user.admin?
    end

    assert_equal User.count, n_admin + n_not_admin
  end
end
