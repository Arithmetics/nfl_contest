require 'test_helper'

class MatchupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @matchup1 = matchups(:matchup1)
    @matchup3 = matchups(:matchup3)
  end

  test "validates_presence_of" do
    @matchup2 = Matchup.new(
      home_team: "Team1",
      away_team: "Team2",
      home_line: 12,
      away_line: -12,
      home_detail: "(3-3)",
      away_detail: "(3-3)",
      home_picture: "placeholder.jpg",
      away_picture: "placeholder.jpg"
    )
    assert @matchup2.valid?
    @matchup2.away_line = nil
    refute @matchup2.valid?
  end


  test "correct line notation" do
    assert_equal @matchup1.home_line_style, "+12"
    assert_equal @matchup1.away_line_style, "-12"
    assert_equal @matchup3.home_line_style, "+3.5"
    assert_equal @matchup3.away_line_style, "-3.5"
  end


end
