class User < ApplicationRecord
  has_many :ratings
  has_many :rated_restaurants, through: :ratings, source: :restaurant

  validates :name, presence: true
  validates_uniqueness_of :email
  validates_format_of :email, :with => /@/
  validates :password, length: { minimum: 6 }

  has_secure_password

  def rating(restaurant_id)
    rating = Rating.where(user_id: self.id, restaurant_id: restaurant_id)
    if rating[0]
      rating[0].score
    end
  end

end
