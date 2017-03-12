class TicketOrder < ApplicationRecord
  belongs_to :ticket_type
  validates :quantity, presence: true, numericality: true
  validates :name, :phone, :address, presence: true

  def quantity_remain
    ticket_type.max_quantity -= self.quantity
    ticket_type.save
  end

  def total_price_calc
    self.total_price = ticket_type_price * self.quantity
  end

  def ticket_type_price
    ticket_type.price unless nil
  end
end
