require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:brock)
  end

  test "user is valid" do
    assert @user.valid?
  end

  test "usernames are unique" do
    @user2 = User.new(username: "Arithmetics",
                      full_name: "Don Diddle",
                      email: "donny@ex.com",
                      password: "password",
                      password_confirmation: "password")
    refute @user2.valid?
  end

  test "users have full names" do
    @user2 = User.new(username: "DonnyX",
                      full_name: " ",
                      email: "donny@ex.com",
                      password: "password",
                      password_confirmation: "password")
    refute @user2.valid?
  end

end
