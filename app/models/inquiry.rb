class Inquiry < ApplicationRecord
  belongs_to :service_desk, optional: true
  has_many :inquiry_events, dependent: :destroy

  enum :status, {
    submitted: "submitted", routed: "routed", in_progress: "in_progress",
    resolved: "resolved", routing_failed: "routing_failed"
  }

  validates :first_name, :last_name, :email, :category, :topic, :body, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :category, inclusion: { in: %w[education health_care benefits housing general] }
  validates :reference_number, uniqueness: true, allow_nil: true

  before_create :assign_reference_number

  private

  def assign_reference_number
    self.reference_number = ReferenceNumberGenerator.generate
  end
end
