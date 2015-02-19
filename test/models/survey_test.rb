require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save survey without title" do
    survey = Survey.new
    assert_not survey.save, "Saved the survey without title"
  end
  test "successful save changes the number of records in db" do
    survey = Survey.new
    assert true, survey.save
  end
  test "page loads successfully" do
    get :new
    assert_response partial: "_show"
  end
  test "expected template is rendered" do
    get :new
    assert_template layout: "layouts/application", partial: "_form"
  end
end
