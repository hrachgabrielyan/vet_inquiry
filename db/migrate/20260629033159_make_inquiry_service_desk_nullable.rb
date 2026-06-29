class MakeInquiryServiceDeskNullable < ActiveRecord::Migration[8.1]
  def change
    change_column_null :inquiries, :service_desk_id, true
  end
end
