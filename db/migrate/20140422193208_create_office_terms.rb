class CreateOfficeTerms < ActiveRecord::Migration
  def change
    create_table :office_terms do |t|
    	t.boolean :in_office
    	t.date :term_start
    	t.date :term_end
    end
  end
end
