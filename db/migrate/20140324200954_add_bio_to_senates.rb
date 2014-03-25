class AddBioToSenates < ActiveRecord::Migration
  def change
    add_column :senates, :bio, :string
  end
end
