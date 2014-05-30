require "test_helper"

class SearchSuggestionTest < ActiveSupport::TestCase

  def search_suggestion
    @search_suggestion ||= SearchSuggestion.new
  end

  def test_valid
    assert search_suggestion.valid?
  end

end
