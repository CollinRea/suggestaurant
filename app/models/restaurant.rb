class Restaurant < ApplicationRecord
  has_many :ratings

  validates :name, presence: true
  validates_uniqueness_of :name

  def average
    ratings = Rating.where(id: self.id)
    if ratings.length > 0
      total = ratings.reduce(0) {|total, rating| total + rating.score}
      total / ratings.length
    end
  end
end
