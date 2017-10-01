class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.string :code, limit: 255
      t.text :remarks
      t.references :sample_type, index: true, foreign_key: true
      t.references :sample_type_version, index: true, foreign_key: true
      t.references :work_order, index: true, foreign_key: true
      t.jsonb :data

      t.timestamps null: false
    end
  end
end
