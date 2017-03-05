# t.string        "name"
# t.string        "full_address"
# t.integer       "region_id"
# t.datetime      "created_at",   null: false
# t.datetime      "updated_at",   null: false
# t.index         ["region_id"], name: "index_venues_on_region_id", using: :btree


class Venue < ActiveRecord::Base
  belongs_to :region
  validates_uniqueness_of :name
  validates_presence_of :name, :full_address
end

