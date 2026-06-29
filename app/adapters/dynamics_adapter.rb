class DynamicsAdapter < CrmAdapter
  # Production: POST to https://login.microsoftonline.com/{tenant}/oauth2/v2.0/token
  # then call https://{org}.api.crm.dynamics.com/api/data/v9.2/incidents
  def create_ticket(inquiry)
    raise NotImplementedError, "Wire up Azure AD credentials to enable"
  end

  def update_ticket(id, attrs) = raise NotImplementedError
  def get_ticket(id) = raise NotImplementedError
end
