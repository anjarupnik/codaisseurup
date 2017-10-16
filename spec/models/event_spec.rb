require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
    it { is_expected.to validate_presence_of(:location) }

  end

describe "#bargain?" do
   let(:bargain_event) { create :event, price: 20 }
   let(:non_bargain_event) { create :event, price: 200 }

   it "returns true if the price is smaller than 30 EUR" do
     expect(bargain_event.bargain?).to eq(true)
     expect(non_bargain_event.bargain?).to eq(false)
   end
 end

 it { is_expected.to belong_to :user}

 describe "association with category" do
  let(:event) { create :event }

  let(:category1) { create :category, name: "Bright", events: [event] }
  let(:category2) { create :category, name: "Clean lines", events: [event] }
  let(:category3) { create :category, name: "A Man's Touch", events: [event] }


  it { is_expected.to have_and_belong_to_many :categories }
end

describe "association with registration" do
  let(:guest_user) { create :user, email: "guest@user.com" }
  let(:host_user) { create :user, email: "host@user.com" }

  let!(:event) { create :event, user: host_user }
  let!(:registration) { create :registration, event: event, user: guest_user }

  it "has guests" do
    expect(event.guests).to include(guest_user)
  end
end

  describe ".order_by_name" do
     subject { Event.order_by_name }

     let(:event1) { create :event, name: "Anja" }
     let(:event2) { create :event, name: "Zoo" }

     it "is sorted on name in ascending order" do
       expect(subject).to eq([event1, event2])
     end
   end

   describe ".published" do
      subject { Event.published }

      let(:event) { create :event, active: true }

      it "has active event" do
        expect(subject).to include(event)
      end
    end
end
