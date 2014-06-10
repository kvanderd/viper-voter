require 'test_helper'
 
class ChangeTest < ActiveSupport::TestCase
  test "the number of changes" do
  	assert_equal 1, Change.count
  end

end