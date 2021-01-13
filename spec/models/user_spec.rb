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
  end
end
