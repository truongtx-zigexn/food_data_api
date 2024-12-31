class PhysicalStat < ApplicationRecord
  enum :gender, %i(male female)
  enum :activity_lvl, %i(sedentary light moderate heavy athlete)

  belongs_to :user
  validates :age, :gender, :height, :weight, :activity_lvl, presence: true
end
