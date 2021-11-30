require "application_system_test_case"

class TimeTrackersTest < ApplicationSystemTestCase
  setup do
    @time_tracker = time_trackers(:one)
  end

  test "visiting the index" do
    visit time_trackers_url
    assert_selector "h1", text: "Time Trackers"
  end

  test "creating a Time tracker" do
    visit time_trackers_url
    click_on "New Time Tracker"

    fill_in "Comment", with: @time_tracker.comment
    fill_in "Day in", with: @time_tracker.day_in
    fill_in "Day out", with: @time_tracker.day_out
    fill_in "User", with: @time_tracker.user_id
    click_on "Create Time tracker"

    assert_text "Time tracker was successfully created"
    click_on "Back"
  end

  test "updating a Time tracker" do
    visit time_trackers_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @time_tracker.comment
    fill_in "Day in", with: @time_tracker.day_in
    fill_in "Day out", with: @time_tracker.day_out
    fill_in "User", with: @time_tracker.user_id
    click_on "Update Time tracker"

    assert_text "Time tracker was successfully updated"
    click_on "Back"
  end

  test "destroying a Time tracker" do
    visit time_trackers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time tracker was successfully destroyed"
  end
end
