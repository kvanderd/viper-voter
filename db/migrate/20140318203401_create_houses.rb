class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
    	t.string :first_name, :last_name, :middle_name, :party, :twiter, :facebook, :contact, :phone, :youtub_id, :website, :gender, :term_start, :term_end
    	t.boolean :in_office
    	t.belongs_to :state
    	t.belongs_to :party
    end
  end
end