require 'rails_helper'

RSpec.describe EventLog, type: :model do

  it 'save time event log with associated time tracker' do
    event_log = create(:event_log)
    expect(event_log).to be_valid
  end
  
end
