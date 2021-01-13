require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new({:email => 'testing@test.com'})
  end
  # describe 'Validations' do
  #   it 'should have matching password and password_confirmation' do

  #   end
  # end
end
