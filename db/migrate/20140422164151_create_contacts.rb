class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
    	t.string :twiter, :facebook, :form, :phone, :youtub_id, :website
    end
  end
end
