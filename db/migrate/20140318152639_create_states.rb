class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
    	t.string :name, :abbreviation
    end
  end
end
