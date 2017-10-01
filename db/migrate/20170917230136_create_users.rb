class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, limit: 255
      t.string :last_name, limit: 255
      t.boolean :enabled
      t.integer :role, limit: 4

      t.timestamps null: false
    end
  end
end
