class CreateTestTypeVersions < ActiveRecord::Migration
  def change
    create_table :test_type_versions do |t|
      t.string :name, limit: 255
      t.string :description, limit: 255
      t.jsonb :data
      t.references :test_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
