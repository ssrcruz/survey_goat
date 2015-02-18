class Author < ActiveRecord::Base
  has_secure_password
  has_many :surveys

  def self.names_with_titles
    joins(:surveys).
    select("authors.*, surveys.title AS title").
    order("authors.id").
    all
  end

  def self.with_survey_title
    joins("LEFT JOIN surveys ON authors.id = surveys.author_id").
    select("authors.*, surveys.title AS survey_title").
    order(:id).all
  end

  def self.without_any_surveys
    joins("LEFT JOIN surveys ON authors.id = surveys.author_id").
    order(:id).where("surveys.id IS NULL").all
  end
end
