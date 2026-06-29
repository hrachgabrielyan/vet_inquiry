class CreateInquiries < ActiveRecord::Migration[8.1]
  def change
    create_table :inquiries do |t|
      t.string :reference_number
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :category
      t.string :topic
      t.text :body
      t.string :status
      t.references :service_desk, null: false, foreign_key: true
      t.string :crm_ticket_id

      t.timestamps
    end
  end
end
