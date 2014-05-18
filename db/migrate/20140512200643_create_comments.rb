class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :content
    	t.belongs_to :change
    	t.belongs_to :user
    	t.timestamps
    end
  end
end
