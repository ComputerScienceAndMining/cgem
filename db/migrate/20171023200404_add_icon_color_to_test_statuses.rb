class AddIconColorToTestStatuses < ActiveRecord::Migration
  def change
    add_column :test_statuses, :icon_color, :string
  end
end
