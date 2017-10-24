class AddIconToTestStatuses < ActiveRecord::Migration
  def change
    add_column :test_statuses, :icon, :string
  end
end
