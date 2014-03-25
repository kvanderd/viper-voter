class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
    	t.string :name
        t.string :summary
    	t.text :description
    	t.string :picture
    	t.belongs_to :user
    	t.timestamps
    end
  end
end
