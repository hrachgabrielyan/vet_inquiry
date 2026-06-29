class CreateRoutingRules < ActiveRecord::Migration[8.1]
  def change
    create_table :routing_rules do |t|
      t.string :category
      t.references :service_desk, null: false, foreign_key: true
      t.integer :priority

      t.timestamps
    end
  end
end
