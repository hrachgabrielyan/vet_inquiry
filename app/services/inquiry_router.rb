class InquiryRouter
  def initialize(inquiry, adapter: Rails.application.config.crm_adapter)
    @inquiry = inquiry
    @adapter = adapter
  end

  def route
    desk = find_service_desk
    ticket = @adapter.create_ticket(@inquiry)

    @inquiry.update!(
      service_desk: desk,
      crm_ticket_id: ticket[:id],
      status: "routed"
    )

    log_event("routed", from: "submitted", to: "routed")
  end

  private

  def find_service_desk
    rule = RoutingRule
             .where(category: @inquiry.category)
             .order(:priority)
             .first
    raise "No routing rule for category: #{@inquiry.category}" unless rule
    rule.service_desk
  end

  def log_event(type, from:, to:)
    InquiryEvent.create!(inquiry: @inquiry, event_type: type, from_status: from, to_status: to)
  end
end
