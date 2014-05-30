namespace :search_suggestions do

  desc "Generate search suggestions from states"
  task :index => :environment do
    SearchSuggestion.index_states
  end
end