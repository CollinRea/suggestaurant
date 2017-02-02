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
      visited_difference = (Date.today - self.last_visited).to_i
      # if never suggested, set value to a month ago
      suggested_date = self.suggested || Date.today.last_month
      suggested_difference = (Date.today - suggested_date).to_i

      # below score modifiers can be adjusted later if needed
      last_visited_score = visited_difference * 2
      rating_score = self.average * 10
      suggested_score = suggested_difference * 1

      # Total score returned 
      rating_score + last_visited_score + suggested_score
    rescue 
      # if restaurant is new or never visited the above code will raise exception
      # rescue will return a score of 100 since restaurants that haven't been visited 
      # should receive some priority in the suggestion queue
      100
    end
  end
end
