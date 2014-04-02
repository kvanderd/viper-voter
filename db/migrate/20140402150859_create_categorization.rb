class CreateCategorization < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
    	t.belongs_to :change
    	t.belongs_to :category
    end
  end
end
