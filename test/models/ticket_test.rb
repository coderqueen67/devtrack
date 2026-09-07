require "test_helper"

class TicketTest < ActiveSupport::TestCase
  test "ticket is valid with required attributes" do
    ticket = Ticket.new(
      title: "Test ticket",
      description: "Test description",
      status: "Open",
      priority: "High",
      project: projects(:one)
    )

    assert ticket.valid?
  end

  test "ticket requires a title" do
    ticket = tickets(:one)
    ticket.title = nil

    assert_not ticket.valid?
  end

  test "ticket rejects invalid status" do
    ticket = tickets(:one)
    ticket.status = "Unknown"

    assert_not ticket.valid?
  end

  test "ticket rejects invalid priority" do
    ticket = tickets(:one)
    ticket.priority = "Emergency"

    assert_not ticket.valid?
  end
end
