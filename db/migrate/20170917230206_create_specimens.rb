class CreateSpecimens < ActiveRecord::Migration
  def change
    create_table :specimens do |t|
      t.string :code, limit: 255
      t.text :remarks
      t.references :sample, index: true, foreign_key: true
      t.references :specimen_type, index: true, foreign_key: true
      t.references :specimen_type_version, index: true, foreign_key: true
      t.references :prepared_by, index: true, references: :users #-> tested_by_id
      t.jsonb :data

      t.timestamps null: false
    end

    add_foreign_key :specimens, :users, column: :prepared_by_id
  end
end
