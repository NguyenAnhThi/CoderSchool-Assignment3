# t.integer         "event_id"
# t.integer         "price"
# t.string          "name"
# t.integer         "max_quantity"
# t.datetime        "created_at",   null: false
# t.datetime        "updated_at",   null: false
# t.index           ["event_id"], name: "index_ticket_types_on_event_id", using: :btree


class TicketType < ActiveRecord::Base
  belongs_to :event
  validates_presence_of :name
  validates :price, :max_quantity, presence: true, numericality: true
end
