class CreateSenates < ActiveRecord::Migration
  def change
    create_table :senates do |t|
    	t.string :first_name, :last_name
    	t.belongs_to :state
    	t.belongs_to :office_term
    	t.belongs_to :party
    end
  end
end