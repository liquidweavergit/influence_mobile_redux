require 'rails_helper'

RSpec.describe Offer, type: :model do
  context 'validation tests' do
    it 'ensure title validation' do
      offer = FactoryBot.build(:offer, title: nil).save
      expect(offer).to eq(false)
    end

    it 'ensure description validation' do
      offer = FactoryBot.build(:offer, description: nil).save
      expect(offer).to eq(false)
    end

    it 'ensure min_age validation' do
      offer = FactoryBot.build(:offer, min_age: nil).save
      expect(offer).to eq(false)
    end

    it 'ensure max_age validation' do
      offer = FactoryBot.build(:offer, max_age: nil).save
      expect(offer).to eq(false)
    end

    it 'ensure gender validation' do
      offer = FactoryBot.build(:offer, gender: nil).save
      expect(offer).to eq(false)
    end

    it 'ensure expiration_date validation' do
      offer = FactoryBot.build(:offer, expiration_date: nil).save
      expect(offer).to eq(false)
    end

    it 'ensure expiration_date is in the future validation' do
      offer = FactoryBot.build(:offer, expiration_date: Date.today).save
      expect(offer).to eq(false)
    end

    it 'ensure minimum age is 13 validation' do
      offer = FactoryBot.build(:offer, min_age: 12).save
      expect(offer).to eq(false)
    end

    it 'ensure minimum age is less than maximum age validation' do
      offer = FactoryBot.build(:offer, min_age: 51, max_age: 21).save
      expect(offer).to eq(false)
    end

    it 'ensure save successful' do
      offer = FactoryBot.build(:offer).save
      expect(offer).to eq(true)
    end

  end

  context 'scope tests' do
    before(:each) do
      FactoryBot.create(:offer, min_age: 21, max_age: 31, gender: 'any')
      FactoryBot.create(:offer, min_age: 21, max_age: 31, gender: 'male')
      FactoryBot.create(:offer, min_age: 21, max_age: 31, gender: 'female')

      FactoryBot.create(:offer, min_age: 31, max_age: 41, gender: 'any')
      FactoryBot.create(:offer, min_age: 31, max_age: 41, gender: 'male')
      FactoryBot.create(:offer, min_age: 31, max_age: 41, gender: 'female')

      FactoryBot.create(:offer, min_age: 41, max_age: 51, gender: 'any')
      FactoryBot.create(:offer, min_age: 41, max_age: 51, gender: 'male')
      FactoryBot.create(:offer, min_age: 41, max_age: 51, gender: 'female')
    end

    it 'should return offers for male users' do
      expect(Offer.male_offers.size).to eq(6)
    end

    it 'should return offers for female users' do
      expect(Offer.female_offers.size).to eq(6)
    end

    it 'should return offers for 30-something users' do
      expect(Offer.for_age(30).size).to eq(3)
    end

    it 'should return offers for 40-something users' do
      expect(Offer.for_age(40).size).to eq(3)
    end

    it 'should return offers for 50-something users' do
      expect(Offer.for_age(50).size).to eq(3)
    end

    it 'shows 30 yr old female offers' do
      user = FactoryBot.create(:user, birthdate: Date.today - 30.years - 3.months, gender: 'female')

      expect(user.offers.size).to eq(2)
    end

    it 'shows 40 yr old male offers' do
      user = FactoryBot.create(:user, birthdate: Date.today - 40.years - 3.months, gender: 'male')

      expect(user.offers.size).to eq(2)
    end

    it 'shows 50 yr old other offers' do
      user = FactoryBot.create(:user, birthdate: Date.today - 50.years - 3.months, gender: 'other')

      expect(user.offers.size).to eq(3)
    end
  end
end
