require 'rails_helper'

  describe "Viewing an individual event" do
    let(:event) { create :event }

    it "shows the event's details" do
      visit event_url(event)

      expect(page).to have_text(event.name)
      expect(page).to have_text(event.location)
      expect(page).to have_text(event.description)
      expect(page).to have_text(event.price)
      expect(page).to have_text(event.capacity)

    end


    describe ".order_by_price" do
    let!(:event1) { create :event, price: 100 }
    let!(:event2) { create :event, price: 200 }
    let!(:event3) { create :event, price: 50 }

    it "returns a sorted array of events by prices" do
      
      expect(Event.order_by_price).to eq([event3, event1, event2])
    end
  end
  end
