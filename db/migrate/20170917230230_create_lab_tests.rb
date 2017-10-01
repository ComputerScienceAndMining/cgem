class CreateLabTests < ActiveRecord::Migration
  def change
    create_table :lab_tests do |t|
      t.timestamp :started_at
      t.timestamp :ended_at
      t.references :work_order, index: true, foreign_key: true
      t.references :test_status, index: true, foreign_key: true
      t.references :test_type, index: true, foreign_key: true
      t.references :test_type_version, index: true, foreign_key: true
      t.references :specimen, index: true, foreign_key: true
      t.references :tested_by, index: true, references: :users #-> tested_by_id
      t.jsonb :data

      t.timestamps null: false
    end

    add_foreign_key :lab_tests, :users, column: :tested_by_id
  end
end
