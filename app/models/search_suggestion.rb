class SearchSuggestion < ActiveRecord::Base


	def self.terms_for(prefix)
    suggestions = where("term like ?", "#{prefix}_%")
    suggestions.order(:popularity).limit(10).pluck(:term)
	end


  # def self.index_categories
  #   Category.find_each do |topic|
  #     index_term(topic.name)
  #     topic.name.split.each { |t| index_term(t) }
  #   end
  # end

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
