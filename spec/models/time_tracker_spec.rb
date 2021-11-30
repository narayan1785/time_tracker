require 'rails_helper'

RSpec.describe TimeTracker, type: :model do
 
  describe 'validate comment save on edit' do
    before { allow(subject).to receive(:edit_time_log).and_return(true) }
    it { should validate_presence_of(:comment) }
  end

  it 'save time tracker with event log' do
    time_tracker = create(:time_tracker)
    expect(time_tracker).to be_valid
  end
end
