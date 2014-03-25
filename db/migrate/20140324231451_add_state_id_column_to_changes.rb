class AddStateIdColumnToChanges < ActiveRecord::Migration
  def change
    add_column :changes, :state_id, :integer
  end
end
