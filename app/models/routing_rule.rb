class RoutingRule < ApplicationRecord
  belongs_to :service_desk
  validates :category, :priority, presence: true
  validates :category, inclusion: { in: %w[education health_care benefits housing general] }
end
