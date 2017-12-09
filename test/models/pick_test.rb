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
end
