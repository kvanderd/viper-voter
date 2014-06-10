require 'test_helper'

 
class CategoryTest < ActiveSupport::TestCase

  test "the number of categories" do
  	assert_equal 1, Category.count
  end
end