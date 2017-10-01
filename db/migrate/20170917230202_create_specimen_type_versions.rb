class CreateSpecimenTypeVersions < ActiveRecord::Migration
  def change
    create_table :specimen_type_versions do |t|
      t.references :specimen_type, index: true, foreign_key: true
      t.string :name, limit: 255
      t.jsonb :data

      t.timestamps null: false
    end
  end
end
