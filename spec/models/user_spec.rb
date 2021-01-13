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
  end
end
