class Restaurant < ApplicationRecord
  has_many :ratings

  validates :name, presence: true
  validates_uniqueness_of :name

end
