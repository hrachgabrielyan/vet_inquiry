class InquiryEvent < ApplicationRecord
  belongs_to :inquiry
  validates :event_type, presence: true
  validates :event_type, inclusion: { in: %w[status_changed routed note_added] }
  before_update { raise "InquiryEvents are immutable" }
end
