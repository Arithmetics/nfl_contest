require 'test_helper'

class PickTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:brock)
    @matchup = matchups(:matchup1)
  end

  test "choice selection needs to be home or away" do
    @pick = @user.picks.build(matchup: @matchup,
                              lock: false,
                              choice: "home")
    assert @pick.valid?
    @pick2 = @user.picks.build(matchup: @matchup,
                              lock: false,
                              choice: "otdher")
    refute @pick2.valid?
  end

  test "same user can't pick same matchup twice" do
    @pick = @user.picks.create(matchup: @matchup,
                              lock: false,
                              choice: "home")
    assert @user.picks.count == 1
    @pick2 = @user.picks.create(matchup: @matchup,
                              lock: true,
                              choice: "away")
    assert @user.picks.count == 1
  end

end
