require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:restaurant) {Restaurant.new()}

  describe 'Validations' do
    it 'is not valid without a name' do
      expect(restaurant).to_not be_valid
    end

    it 'is valid with a name' do
      restaurant.name = "Joe's Sub Shop"
      expect(restaurant).to be_valid
    end

    it 'does not allow duplicate restaurants' do
      restaurant.name = "Joe's Sub Shop"
      restaurant.save
      restaurant2 = Restaurant.new(name: "Joe's Sub Shop")
      expect(restaurant2).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'should have many Ratings' do
      expect(Restaurant.reflect_on_association(:ratings).macro).to eq :has_many
    end
  end

  describe 'Methods' do
    before do
      restaurant.name = "Joe's Sub Shop"
      restaurant.save
    end

    it 'returns nil if no ratings exist' do
      expect(restaurant.average).to be nil
    end

    it 'returns average rating score' do
      user = User.create(name: 'Collin', email: 'collin@test.com', password: 'pass123');
      Rating.create(score: 5, user_id: user.id, restaurant_id: restaurant.id)
      expect(restaurant.average).to eq 5
    end
  end
end
