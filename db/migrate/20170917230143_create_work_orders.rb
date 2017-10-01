class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.string :name, limit: 255
      t.text :description
      t.date :due_date
      t.references :responsible, index: true, references: :users #-> responsible_id
      t.references :work_order_status, index: true, foreign_key: true
      t.references :organisation, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_foreign_key :work_orders, :users, column: :responsible_id
  end
end
