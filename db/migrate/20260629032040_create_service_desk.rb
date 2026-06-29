class CreateServiceDesk < ActiveRecord::Migration[8.1]
  def change
    create_table :service_desks do |t|
      t.string :name
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
