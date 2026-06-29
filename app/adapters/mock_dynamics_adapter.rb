class MockDynamicsAdapter < CrmAdapter
  def create_ticket(inquiry)
    { id: "DYN-#{SecureRandom.hex(4).upcase}", status: "active" }
  end

  def update_ticket(id, attrs)
    { id: id, **attrs }
  end

  def get_ticket(id)
    { id: id, status: "active" }
  end
end
