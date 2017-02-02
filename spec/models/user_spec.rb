require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'is not valid without a name' do
      user = User.new(password: '123456', email: 'test@test.com')
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.new(name: 'Collin', password: 'test123')
      expect(user).to_not be_valid
    end

    it 'must have a properly formatted email' do
      user = User.new(name: 'Collin', password: 'test123', email: 'test.com')
      expect(user).to_not be_valid
    end

    it 'must have a unique email' do
      user1 = User.create(name: 'Collin', password: 'test123', email: 'test@test.com')
      user2 = User.new(name: 'Justin', password: 'newpass12', email: 'test@test.com')
      expect(User.exists?(name: 'Collin')).to be true
      expect(user2).to_not be_valid
    end

    it 'is not valid without a password' do
      user = User.new(name: 'Collin', email: 'test@test.com')
      expect(user).to_not be_valid
    end

    it 'must have a password greater than 6 characters' do
      user = User.new(name: 'Collin', email: 'test@test.com', password: '123')
      expect(user).to_not be_valid
    end

    it 'should not save raw password to database' do
      user = User.new(name: 'Collin', email: 'test@test.com', password: 'test123')
      expect(user.password).to eq 'test123'
    end

    it 'is valid with a name, email, and password' do
      user = User.new(name: 'Collin', email: 'test@test.com', password: 'test123')
      expect(user).to be_valid
    end
  end

  describe 'Associations' do
    it 'should have many Ratings' do
      expect(User.reflect_on_association(:ratings).macro).to eq :has_many
    end

    it 'should have many Rated Restaurant' do
      expect(User.reflect_on_association(:rated_restaurants).macro).to eq :has_many
    end
  end

  describe 'Methods' do
    let(:restaurant) { Restaurant.create(name: 'Subway') }
    let(:user) { User.create(name: 'Collin', email: 'test@test.com', password: 'test123') }

    it 'returns nil if no ratings for given restaurant' do
      expect(user.rating(restaurant.id)).to be nil
    end

    it 'returns a rating for a given restaurant' do
      rating = Rating.create(score: 3, restaurant_id: restaurant.id, user_id: user.id)
      expect(user.rating(restaurant.id)).to eq rating
    end
  end
end
