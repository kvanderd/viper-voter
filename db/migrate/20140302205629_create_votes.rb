class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.boolean :upvote
    	t.belongs_to :change
    	t.timestamps
    end
  end
end
