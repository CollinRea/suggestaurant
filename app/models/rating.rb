class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :user_id, presence: true
  validates_uniqueness_of :user_id, scope: :restaurant_id
  validates :restaurant_id, presence: true
  validates_numericality_of :score, only_integer: true,
                                    greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: 5

end
