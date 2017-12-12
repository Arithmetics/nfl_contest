require 'test_helper'

class PicksControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:brock)
    @dan = users(:dan)
    @matchup1 = matchups(:matchup1)
    @matchup2 = matchups(:matchup3)
    @matchup3 = matchups(:matchup5)
  end

  test "only correct user can delete pick" do
    sign_in @user
    @pick1 = @user.picks.create(matchup: @matchup1, lock: false, choice: "home")
    @pick2 = @user.picks.create(matchup: @matchup2, lock: true, choice: "away")
    assert @user.picks.count == 2
    assert_difference 'Pick.count', -1 do
      delete pick_path(@pick1)
    end
    sign_in @dan
    assert_no_difference 'Pick.count', 0 do
      delete pick_path(@pick2)
    end
  end

  test "regular pick does not affect lock points" do
    sign_in @user
    assert_equal @user.lock_points, 5
    assert_no_difference '@user.lock_points' do
      post picks_path, params: { pick: {
                                        matchup_id: @matchup2.id,
                                        choice: "home",
                                        lock: false
                                                                } }
    end
  end

  test "lock pick decreases lock points by one" do
    sign_in @user
    assert_equal @user.lock_points, 5
    assert_difference '@user.lock_points', -1 do
      post picks_path, params: { pick: {
                                        matchup_id: @matchup2.id,
                                        choice: "home",
                                        lock: true
                                                                } }
    end
  end

  test "deleting lock pick increases lock points by one" do
    sign_in @user
    @pick2 = @user.picks.create(matchup: @matchup2, lock: true, choice: "away")
    assert_equal @user.lock_points, 5
    assert_difference '@user.lock_points', 1 do
      delete pick_path(@pick2)
    end
  end

  test "deleting regular pick does not affect lock points" do
    sign_in @user
    @pick2 = @user.picks.create(matchup: @matchup2, lock: false, choice: "away")
    assert_equal @user.lock_points, 5
    assert_no_difference '@user.lock_points' do
      delete pick_path(@pick2)
    end

  end

  test "user cannot make a lock pick if they have no lock points left" do
    sign_in @dan
    assert_equal @dan.lock_points, 0
    assert_no_difference 'Pick.count' do
      post picks_path, params: { pick: {
                                        matchup_id: @matchup2.id,
                                        choice: "home",
                                        lock: true
                                                                } }
    end
  end

  test "user can still make regular picks with no lock points" do
    sign_in @dan
    assert_equal @dan.lock_points, 0
    assert_difference 'Pick.count', 1 do
      post picks_path, params: { pick: {
                                        matchup_id: @matchup2.id,
                                        choice: "home",
                                        lock: false
                                                                } }
    end
  end


  test "user cannot delete closed pick" do
    sign_in @user
    @pick1 = @user.picks.create(matchup: @matchup3, lock: true, choice: "home")
    assert_equal @user.lock_points, 5
    assert_no_difference 'Pick.count' do
      delete pick_path(@pick1)
    end
    assert_equal @user.lock_points, 5
  end


  test "user cannot create a pick from a closed matchup" do
    sign_in @user
    assert @user.lock_points == 5
    assert_no_difference 'Pick.count' do
      post picks_path, params: { pick: {
                                        matchup_id: @matchup3.id,
                                        choice: "home",
                                        lock: true
                                                                } }
    end
    assert @user.lock_points == 5
  end

end
