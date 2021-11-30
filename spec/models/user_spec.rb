require 'rails_helper'

RSpec.describe User, type: :model do
 

  it 'check full name of user' do
    user = create(:user)
    expect(user.full_name).to eq "Test user"
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
  end
end
