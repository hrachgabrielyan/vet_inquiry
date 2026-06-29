class CreateInquiryEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :inquiry_events do |t|
      t.references :inquiry, null: false, foreign_key: true
      t.string :event_type
      t.string :from_status
      t.string :to_status
      t.string :note

      t.timestamps
    end
  end
end
