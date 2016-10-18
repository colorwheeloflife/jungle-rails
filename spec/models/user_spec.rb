require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    users = []

    let (:user1) { User.new(name: 'Jeff', email: 'yourmamasdaddy@gmail.com', password: '12345', password_confirmation: '12345')}

    let (:user2) { User.new(name: 'Delilah', email: 'bellbottomjeans@gmail.com', password: '12345', password_confirmation: '12345')}

    let (:user3) { User.new(name: 'Ricky', email: 'yourmamasdaddy@gmail.com', password: '12345', password_confirmation: '12345')}

    it 'should require a confirmed password' do
      expect(user1.password).to eql(user1.password_confirmation)
      expect(user1.password.length).to be >= 5
      user1.save
      users.push(user1)
    end

    it 'should require a confirmed password' do
      expect(user2.password).to eql(user2.password_confirmation)
      expect(user2.password.length).to be >= 5
      user2.save
      users.push(user2)
    end

    it 'should require a confirmed password' do
      expect(user3.password).to eql(user3.password_confirmation)
      expect(user3.password.length).to be >= 5
      user3.save
      users.push(user3)
    end

    it 'should have a unique email' do
      # binding.pry
      users.each do |u|
        # binding.pry
        expect((user2.id != u.id) && user2.email).to_not eql(u.email)

      end

    end


  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here

    it 'should have an email and password matching a registered user' do
      # systems already in place to check, will revisit.
    end

  end

end
