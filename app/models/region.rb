# t.string          "name"
# t.datetime        "created_at", null: false
# t.datetime        "updated_at", null: false


class Region < ActiveRecord::Base
    validates_inclusion_of :name, in: ['Ho Chi Minh', 'Ha Noi', 'Binh Thuan', 'Da Nang', 'Lam Dong']
    validates_uniqueness_of :name
end
