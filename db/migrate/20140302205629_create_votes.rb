class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.integer :value
    	t.belongs_to :change
    	t.belongs_to :user
    	t.timestamps
    end
  end
end
