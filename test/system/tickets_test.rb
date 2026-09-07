require "application_system_test_case"

class TicketsTest < ApplicationSystemTestCase
  test "visiting the DevTrack dashboard" do
    visit tickets_url

    assert_selector "h1", text: "DevTrack"
    assert_text "Software Issue Tracking Dashboard"
    assert_text "Issue Tickets"
  end
end
