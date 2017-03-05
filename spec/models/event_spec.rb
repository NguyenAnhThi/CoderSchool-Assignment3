require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "test past events"

  describe ".upcoming" do
    it 'should return [] when there are no events' do
      expect(Event.upcoming).to eq []
    end

    it "should return [] when there are only past events" do
      Event.create!(starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: " a past event",
                    venue: Venue.new, category: Category.new)
      expect(Event.upcoming).to eq []
    end

    it 'should return [b] when there are a past event "a" and a future event "b"' do
      a = Event.create!(name: "a", starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: "a past event",
                        venue: Venue.new, category: Category.new)
      b = Event.create!(name: "b", starts_at: 2.days.ago, ends_at: 1.day.from_now, extended_html_description: " a future event",
                        venue: Venue.new, category: Category.new)
      expect(Event.upcoming).to eq [b]
    end
  end

  describe "#venue_name" do
    it "should return nil if there's no value" do
      event = Event.new
      expect(event.venue_name).to eq nil
    end

    it 'should return venue name' do
      venue = Venue.new name: "GEM Center"
      event = Event.new venue: venue
      expect(event.venue_name).to eq "GEM Center"
    end
  end

  it { should belong_to(:venue) }
  it { should belong_to(:category) }
  it { should have_many (:ticket_types) }
end
