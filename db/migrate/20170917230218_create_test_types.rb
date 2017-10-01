class CreateTestTypes < ActiveRecord::Migration
  def change
    create_table :test_types do |t|
      t.string :name, limit: 255
      t.text :description
      t.jsonb :data

      t.timestamps null: false
    end
  end
end
