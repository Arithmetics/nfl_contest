require 'test_helper'

class MatchupsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:brock)
    @admin = users(:admin)
    @matchup = matchups(:matchup1)
  end

  test "reg user can't see edit matchup" do
    sign_in @user
    get edit_matchup_path(@matchup)
    assert_redirected_to root_url
  end

  test "admin user can see edit matchups" do
    sign_in @admin
    get edit_matchup_path(@matchup)
    assert_response :success
  end

  test "reg user can't update matchups" do
    sign_in @user
    patch matchup_path(@matchup), params: { matchup: {
                                                        home_team: "New Orleans Saints",
                                                        away_team: "L.A. Rams",
                                                        home_line: 7.5,
                                                        away_line: -7.5,
                                                        home_detail: "(10-5)",
                                                        away_detail:"(10-5)",
                                                        home_picture: "placeholder.jpg",
                                                        away_picture:"placeholder.jpg"
                                                              } }
    assert_redirected_to root_url
    @matchup.reload
    assert_equal "New Orleans Saints", @matchup.away_team
  end


  test "admin user can update matchups" do
    sign_in @admin
    get edit_matchup_path(@matchup)
    patch matchup_path(@matchup), params: { matchup: {
                                                        home_line: 7.5,
                                                        away_line: -7.5,
                                                              } }

    @matchup.reload
    assert_equal 7.5, @matchup.home_line
  end


  test "reg user cant delete matchups" do
    sign_in @user
    assert @matchup.valid?
    assert_no_difference 'Matchup.count' do
      delete matchup_path(@matchup)
    end
  end

  test "admin user can delete matchups" do
    sign_in @admin
    assert @matchup.valid?
    assert_difference 'Matchup.count', -1 do
      delete matchup_path(@matchup)
    end
  end



end
