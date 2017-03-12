# t.datetime    "starts_at"
# t.datetime    "ends_at"
# t.integer     "venue_id"
# t.string      "hero_image_url"
# t.text        "extended_html_description"
# t.integer     "category_id"
# t.string      "name"
# t.datetime    "created_at",                null: false
# t.datetime    "updated_at",                null: false
# t.index       ["category_id"], name: "index_events_on_category_id", using: :btree
# t.index       ["venue_id"], name: "index_events_on_venue_id", using: :btree

class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :creater, class_name: 'User'
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming
    where("ends_at > ?", Time.now)
  end

  scope :published, -> { where.not(published_at: nil) }

  def self.search(keyword)
    where("name ILIKE ?", "%#{keyword}%")
  end

  delegate :name, to: :venue, allow_nil: true, prefix: true

  def total_quantity
    ticket_types.sum { |t| t.max_quantity }
  end

  def have_enough_ticket_types?
    ticket_types.count >= 1
  end
end


