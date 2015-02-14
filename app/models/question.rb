class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :options
  has_many :responses

  accepts_nested_attributes_for :options,
      :allow_destroy => true,
      :reject_if     => :all_blank
end
