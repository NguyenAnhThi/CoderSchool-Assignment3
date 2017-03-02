# t.string        "name"
# t.datetime      "created_at", null: false
# t.datetime      "updated_at", null: false

class Category < ActiveRecord::Base
  validates_inclusion_of :name, in: ['Entertainment', 'Learning', 'Everything Else']
  validates_uniqueness_of :name
end
