class Rating < ApplicationRecord
  validates :user_id, presence: true
  validates :restaurant_id, presence: true
  validates_numericality_of :score, only_integer: true,
                                    greater_than_or_equal_to: 0:,
                                    less_than_or_equal_to: 5

end
