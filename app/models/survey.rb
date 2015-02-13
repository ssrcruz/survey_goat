class Survey < ActiveRecord::Base
  belongs_to :author
  has_many :questions

  validates :title, presence: true

  accepts_nested_attributes_for :questions,
      :allow_destroy => true,
      :reject_if     => :all_blank

end
