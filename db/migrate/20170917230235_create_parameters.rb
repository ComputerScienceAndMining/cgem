class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.string :key, limit: 255
      t.string :value, limit: 255

      t.timestamps null: false
    end
  end
end
