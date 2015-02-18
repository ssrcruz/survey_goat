class Survey < ActiveRecord::Base
  belongs_to :author
  has_many :questions, dependent: :destroy
  has_many :responses, through: :questions
  has_many :options, through: :questions

  validates :title, presence: true

  accepts_nested_attributes_for :questions,
       :allow_destroy => true,
       :reject_if     => proc { |a| a['question_text'].blank? &&
         a['question_type'].blank? && a['description'].blank? }

  def complete?
    return false if questions.blank?
    return questions.all? do |q|
      q.question_type != "Choice" || q.options.length > 0
    end
  end

  # def self.names_with_titles
  #   joins(:surveys).
  #   select("authors.*, surveys.title AS title").
  #   order("authors.id").
  #   all
  # end
  #
  # def self.with_survey_title
  #   joins("LEFT JOIN surveys ON authors.id = surveys.author_id").
  #   select("authors.*, surveys.title AS survey_title").
  #   order(:id).all
  # end
  #
  # def self.without_any_surveys
  #   joins("LEFT JOIN surveys ON authors.id = surveys.author_id").
  #   order(:id).where("surveys.id IS NULL").all
  # end

  def self.all_with_author_emails
    self.joins("LEFT JOIN authors ON surveys.author_id=author.id").select("title, email AS author_email")
end
