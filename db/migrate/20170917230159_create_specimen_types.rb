class CreateSpecimenTypes < ActiveRecord::Migration
  def change
    create_table :specimen_types do |t|
      t.string :name, limit: 255
      t.jsonb :data

      t.timestamps null: false
    end
  end
end
