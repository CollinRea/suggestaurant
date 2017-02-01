require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating) { Rating.new() }

  describe 'Validations' do
    before do
      rating.user_id = 1
      rating.restaurant_id = 1
    end

    it 'is not valid without a score' do
      expect(rating).to_not be_valid
    end

    it 'is not valid with a score below 0' do
      rating.score = -1
      expect(rating).to_not be_valid
    end

    it 'is not valid with a score greater than 5' do
      rating.score = 6
      expect(rating).to_not be_valid
    end

    it 'is not valid if score is not an integer' do
      rating.score = 1.5
      expect(rating).to_not be_valid
    end

    it 'is not valid without a user_id' do
      rating.user_id = nil
      expect(rating).to_not be_valid
    end

    it 'is not valid without a retaurant_id' do
      rating.user_id = nil
      expect(rating).to_not be_valid
    end

    it 'is valid if all information provided' do
      rating.score = 5
      expect(rating).to be_valid
    end
  end
end
