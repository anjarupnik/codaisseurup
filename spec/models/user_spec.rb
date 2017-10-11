require 'rails_helper'

RSpec.describe User, type: :model do

describe "association with event" do
  let(:user) { create :user }
  let!(:event) { create :event, user: user }

  it "has many events" do
    event1 = user.event.new(name: "Wonderful")
    event2 = user.event.new(name: "Extraordinary")

    expect(user.event).to include(event1)
    expect(user.event).to include(event2)
  end

  it "deletes associated events" do
    expect { user.destroy }.to change(Event, :count).by(-1)
  end
end


describe "association with profile" do

  let!(:user) { create :profile }

 it { should have_one(:profile) }
end
end
