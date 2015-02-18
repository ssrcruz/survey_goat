class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :options, dependent: :destroy
  has_many :responses, dependent: :destroy

  validates :question_text, presence: true

  accepts_nested_attributes_for :options,
      :allow_destroy => true,
      :reject_if     => :all_blank


    def self.multiple_choice_titles
        where(question_type: "Choice").all.map &:question_text
    end

    def self.penultimate
        order(created_at: :desc).offset(1).first
    end

    def self.time_by_type
        select("question_type, max(created_at) AS max_time").
        group(:question_type).
        order("max(created_at) DESC").all
    end
end
