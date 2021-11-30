require "test_helper"

class TimeTrackersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_tracker = time_trackers(:one)
  end

  test "should get index" do
    get time_trackers_url
    assert_response :success
  end

  test "should get new" do
    get new_time_tracker_url
    assert_response :success
  end

  test "should create time_tracker" do
    assert_difference('TimeTracker.count') do
      post time_trackers_url, params: { time_tracker: { comment: @time_tracker.comment, day_in: @time_tracker.day_in, day_out: @time_tracker.day_out, user_id: @time_tracker.user_id } }
    end

    assert_redirected_to time_tracker_url(TimeTracker.last)
  end

  test "should show time_tracker" do
    get time_tracker_url(@time_tracker)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_tracker_url(@time_tracker)
    assert_response :success
  end

  test "should update time_tracker" do
    patch time_tracker_url(@time_tracker), params: { time_tracker: { comment: @time_tracker.comment, day_in: @time_tracker.day_in, day_out: @time_tracker.day_out, user_id: @time_tracker.user_id } }
    assert_redirected_to time_tracker_url(@time_tracker)
  end

  test "should destroy time_tracker" do
    assert_difference('TimeTracker.count', -1) do
      delete time_tracker_url(@time_tracker)
    end

    assert_redirected_to time_trackers_url
  end
end
