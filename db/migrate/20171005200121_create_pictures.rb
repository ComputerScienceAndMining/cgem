class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :local_id, limit: 36
      t.references :sample, index: true, foreign_key: true
      t.references :specimen, index: true, foreign_key: true
      t.references :lab_test, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
