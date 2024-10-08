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
end
