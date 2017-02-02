class Restaurant < ApplicationRecord
  has_many :ratings

  validates :name, presence: true
  validates_uniqueness_of :name

  def average
    ratings = Rating.where(restaurant_id: self.id)
    if ratings.length > 0
      total = ratings.reduce(0) {|total, rating| total + rating.score}
      total / ratings.length
    else
      0
    end
  end

  def suggestion_score
    begin
      day_difference = (Date.today - self.last_visited).to_i
      if day_difference == 1
        0  
      else
        last_visited_score = day_difference * 2
        rating_score = self.average * 10
        rating_score + last_visited_score
      end
    rescue 
      100
    end
  end
end
