require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "method on model runs properly" do
    get self.names_with_titles
    assert_response :success
  end
end
