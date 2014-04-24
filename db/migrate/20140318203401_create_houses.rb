class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
    	t.string :first_name, :last_name, :middle_name, :gender
    	t.belongs_to :state
    	t.belongs_to :party
    	t.belongs_to :contact
    	t.belongs_to :term
    	t.belongs_to :party
    end
  end
end