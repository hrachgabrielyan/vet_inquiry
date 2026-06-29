class AddIndexesToInquiries < ActiveRecord::Migration[8.1]
  def change
    add_index :inquiries, :reference_number, unique: true
    add_index :inquiries, :status
    add_index :routing_rules, :category
  end
end
