require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensure first name presence' do
      user = User.new(
          last_name: 'last_name',
          email: 'email@email.com',
          username: 'username',
          birthdate: '1980-01-01',
          gender: '1',
          password: 'password',
          password_confirmation: 'password',
      ).save
      expect(user).to eq(false)
    end

    it 'ensure last name presence' do
      user = User.new(
          first_name: 'first_name',
          email: 'email@email.com',
          username: 'username',
          birthdate: '1980-01-01',
          gender: '1',
          password: 'password',
          password_confirmation: 'password',
      ).save
      expect(user).to eq(false)
    end

    it 'ensure email presence' do
      user = User.new(
          first_name: 'first_name',
          last_name: 'last_name',
          username: 'username',
          birthdate: '1980-01-01',
          gender: '1',
          password: 'password',
          password_confirmation: 'password',
          ).save
      expect(user).to eq(false)
    end

    it 'ensure email extension validation' do
      user = User.new(
          first_name: 'first_name',
          last_name: 'last_name',
          username: 'username',
          email: 'email@email',
          birthdate: '1980-01-01',
          gender: '1',
          password: 'password',
          password_confirmation: 'password',
          ).save
      expect(user).to eq(false)
    end

    it 'ensure email prefix validation' do
      user = User.new(
          first_name: 'first_name',
          last_name: 'last_name',
          username: 'username',
          email: '@email.com',
          birthdate: '1980-01-01',
          gender: '1',
          password: 'password',
          password_confirmation: 'password',
          ).save
      expect(user).to eq(false)
    end

    it 'ensure email at validation' do
      user = User.new(
          first_name: 'first_name',
          last_name: 'last_name',
          username: 'username',
          email: 'emailemail.com',
          birthdate: '1980-01-01',
          gender: '1',
          password: 'password',
          password_confirmation: 'password',
          ).save
      expect(user).to eq(false)
    end

    it 'ensure username presence' do
      user = User.new(
          first_name: 'first_name',
          last_name: 'last_name',
          email: 'email@email.com',
          birthdate: '1980-01-01',
          gender: '1',
          password: 'password',
          password_confirmation: 'password',
          ).save
      expect(user).to eq(false)
    end

    it 'ensure birthdate presence' do
      user = User.new(
          first_name: 'first_name',
          last_name: 'last_name',
          email: 'email@email.com',
          username: 'username',
          gender: '1',
          password: 'password',
          password_confirmation: 'password',
          ).save
      expect(user).to eq(false)
    end

    it 'ensure gender presence' do
      user = User.new(
          first_name: 'first_name',
          last_name: 'last_name',
          email: 'email@email.com',
          username: 'username',
          birthdate: '1980-01-01',
          password: 'password',
          password_confirmation: 'password',
          ).save
      expect(user).to eq(false)
    end

    it 'ensure matching password' do
      user = User.new(
          first_name: 'first_name',
          last_name: 'last_name',
          email: 'email@email.com',
          username: 'username',
          birthdate: '1980-01-01',
          gender: '1',
          password: 'password',
          password_confirmation: 'password_confirmation',
          ).save
      expect(user).to eq(false)
    end

    it 'ensure save success' do
      user = User.new(
          first_name: 'first_name',
          last_name: 'last_name',
          email: 'email@email.com',
          username: 'username',
          birthdate: '1980-01-01',
          gender: '1',
          password: 'password',
          password_confirmation: 'password',
          ).save
      expect(user).to eq(true)
    end
  end

  context 'scope tests' do

  end
end
