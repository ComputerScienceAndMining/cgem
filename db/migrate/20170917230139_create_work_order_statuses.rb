class CreateWorkOrderStatuses < ActiveRecord::Migration
  def change
    create_table :work_order_statuses do |t|
      t.string :name, limit: 255

      t.timestamps null: false
    end
  end
end
