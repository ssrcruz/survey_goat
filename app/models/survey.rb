class Survey < ActiveRecord::Base
  belongs_to :author
  has_many :questions
  has_many :responses, through: :questions
  has_many :options, through: :questions

  validates :title, presence: true

  accepts_nested_attributes_for :questions,
       :allow_destroy => true,
       :reject_if     => proc { |a| a['question_text'].blank? &&
         a['question_type'].blank? && a['description'].blank? }

  def complete?
    if questions.count >= 1
      results = []
      questions.each do |q|
        if q.question_type == 'Choice' && q.options.count < 2
          results << false
        else
          results << true
        end
      end
      if results.include?(false)
        false
      else
        true
      end
    else
      false
    end
  end
end
