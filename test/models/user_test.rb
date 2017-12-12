require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:brock)
    @matchup = matchups(:matchup1)
    @matchup2 = matchups(:matchup3)
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

  test "picked_matchups should return true and false" do
    @pick = @user.picks.build(matchup: @matchup,
                              lock: false,
                              choice: "home")
    @pick.save
    assert @pick.valid?
    assert @user.picked_matchup?(@matchup)
    refute @user.picked_matchup?(@matchup2)
  end


  test "correct number of unpicked games display" do
    assert_equal @user.unpicked_games, 4
    @pick = @user.picks.create(matchup: @matchup,
                              lock: false,
                              choice: "home")
    assert_equal @user.unpicked_games, 3                     
  end

end
