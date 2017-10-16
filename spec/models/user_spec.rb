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

describe "association with registration" do
  let(:guest_user) { create :user, email: "guest@user.com" }
  let(:host_user) { create :user, email: "host@user.com" }

  let!(:event) { create :event, user: host_user }
  let!(:registration) { create :registration, event: event, user: guest_user }

  it "has registrations" do
    expect(guest_user.registrated_events).to include(event)
  end
end
