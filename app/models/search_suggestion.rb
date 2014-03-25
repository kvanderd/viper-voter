class SearchSuggestion < ActiveRecord::Base


	def self.terms_for(prefix)
		puts "this is the the prefix in the model"
		ap prefix
    suggestions = where("term like ?", "#{prefix}_%")
    p "this is what was found in the database" * 9
    ap suggestions
    suggestions.order(:popularity).limit(10).pluck(:term)
	end


  def self.index_states
    State.find_each do |state|
      index_term(state.name)
      state.name.split.each { |t| index_term(t) }
    end
  end
  
  def self.index_term(term)
    where(term: term.downcase).first_or_initialize.tap do |suggestion|
      suggestion.increment! :popularity
    end
  end

end
