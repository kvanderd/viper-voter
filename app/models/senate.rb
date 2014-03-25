class Senate < ActiveRecord::Base
	belongs_to :state


  def self.dedupe
  	groupded = all.group_by {|model| [model.first_name, model.last_name] }
    groupded.values.each do |dupes|
  	first_one = dupes.shift
  	dupes.each {|double| double.destroy}
	  end
  end

end