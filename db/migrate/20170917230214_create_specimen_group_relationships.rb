class CreateSpecimenGroupRelationships < ActiveRecord::Migration
  def change
    create_table :specimen_group_relationships do |t|
      t.references :specimen, index: true, foreign_key: true
      t.references :specimen_group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
