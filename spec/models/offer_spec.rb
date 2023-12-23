require 'rails_helper'

RSpec.describe Offer, type: :model do
  context 'validation tests' do
    it 'ensure title validation' do
      offer = Offer.new(
          description: 'description',
          min_age: 10,
          max_age: 100,
          gender: 0,
          expiration_date: Date.today,
      ).save
      expect(offer).to eq(false)
    end

    it 'ensure description validation' do
      offer = Offer.new(
          title: 'title',
          min_age: 10,
          max_age: 100,
          gender: 0,
          expiration_date: Date.today,
          ).save
      expect(offer).to eq(false)
    end

    it 'ensure min_age validation' do
      offer = Offer.new(
          title: 'title',
          description: 'description',\
          max_age: 100,
          gender: 0,
          expiration_date: Date.today,
          ).save
      expect(offer).to eq(false)
    end

    it 'ensure max_age validation' do
      offer = Offer.new(
          title: 'title',
          description: 'description',
          min_age: 10,
          gender: 0,
          expiration_date: Date.today,
          ).save
      expect(offer).to eq(false)
    end

    it 'ensure gender validation' do
      offer = Offer.new(
          title: 'title',
          description: 'description',
          min_age: 10,
          max_age: 100,
          expiration_date: Date.today,
          ).save
      expect(offer).to eq(false)
    end

    it 'ensure expiration_date validation' do
      offer = Offer.new(
          title: 'title',
          description: 'description',
          min_age: 10,
          max_age: 100,
          gender: 0,
          ).save
      expect(offer).to eq(false)
    end

    it 'ensure save successful' do
      offer = Offer.new(
          title: 'title',
          description: 'description',
          min_age: 10,
          max_age: 100,
          gender: 0,
          expiration_date: Date.today,
      ).save
      expect(offer).to eq(true)
    end

  end

  context 'scope tests' do

  end
end
