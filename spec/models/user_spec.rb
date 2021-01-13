require 'rails_helper'

RSpec.describe User, type: :model do
  # before do
  #   @user = User.new({
  #     :first_name => 'Pepe',
  #     :last_name => 'Hands',
  #     :email => 'pepe@peepo.com',
  #     :password => 'peepo123',
  #     :password_confirmation => 'peepo123'})
  # end
  describe 'Validations' do
    it 'should save successfully if all fields are filled with valid input' do
      @user = User.new({
        :first_name => 'Pepe',
        :last_name => 'Hands',
        :email => 'pepe@peepo.com',
        :password => 'peepo123',
        :password_confirmation => 'peepo123'
      })
      @user.save
      expect(@user).to be_present
    end
    it 'should check for first name' do
      @user = User.new({
        :first_name => nil,
        :last_name => 'Hands',
        :email => 'pepe@peepo.com',
        :password => 'peepo123',
        :password_confirmation => 'peepo123'
      })
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'should check for last name' do
      @user = User.new({
        :first_name => 'Pepe',
        :last_name => nil,
        :email => 'pepe@peepo.com',
        :password => 'peepo123',
        :password_confirmation => 'peepo123'
      })
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'should check for email' do
      @user = User.new({
        :first_name => 'Pepe',
        :last_name => 'Hands',
        :email => nil,
        :password => 'peepo123',
        :password_confirmation => 'peepo123'
      })
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'should check for password and password confirmation' do
      @user = User.new({
        :first_name => 'Pepe',
        :last_name => 'Hands',
        :email => 'pepe@peepo.com',
        :password => nil,
        :password_confirmation => nil
      })
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'should check for matching password and password confirmation' do
      @user = User.new({
        :first_name => 'Pepe',
        :last_name => 'Hands',
        :email => 'pepe@peepo.com',
        :password => 'peepo123',
        :password_confirmation => 'peepo'
      })
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'should check for unique emails' do
      @user1 = User.new({
        :first_name => 'Pepe',
        :last_name => 'Hands',
        :email => 'pepe@peepo.com',
        :password => 'peepo123',
        :password_confirmation => 'peepo123'
      })
      @user1.save
      @user2 = User.new({
        :first_name => 'Angry',
        :last_name => 'Pepe',
        :email => 'pepe@peepo.com',
        :password => 'peepo456',
        :password_confirmation => 'peepo456'
      })
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    it 'should check for minimum password length of 6' do
      @user = User.new({
        :first_name => 'Pepe',
        :last_name => 'Hands',
        :email => 'pepe@peepo.com',
        :password => 'peepo',
        :password_confirmation => 'peepo'
      })
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate the user with the correct credentials and log them in' do
      @user = User.new({
        :first_name => 'Pepe',
        :last_name => 'Hands',
        :email => 'pepe@peepo.com',
        :password => 'peepo123',
        :password_confirmation => 'peepo123'
      })
      @user.save
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq(@user)
    end
  end
end
