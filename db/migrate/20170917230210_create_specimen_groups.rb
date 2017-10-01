class CreateSpecimenGroups < ActiveRecord::Migration
  def change
    create_table :specimen_groups do |t|
      t.references :work_order, index: true, foreign_key: true
      t.string :name, limit: 255
      t.text :description

      t.timestamps null: false
    end
  end
end
