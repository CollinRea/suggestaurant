require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let("restaurant") {Restaurant.new()}

  describe 'Validations' do
    it 'is not valid without a name' do
      expect(restaurant).to_not be_valid
    end

    it 'is valid with a name' do
      restaurant.name = "Joe's Sub Shop"
      expect(restaurant).to be_valid
    end
  end
end
