Rails.application.config.after_initialize do
  Rails.application.config.crm_adapter = MockDynamicsAdapter.new
end
