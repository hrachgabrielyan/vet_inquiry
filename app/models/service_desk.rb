class ServiceDesk < ApplicationRecord
  has_many :routing_rules, dependent: :destroy
  has_many :inquiries
  validates :name, :code, presence: true
  validates :code, uniqueness: true
end
