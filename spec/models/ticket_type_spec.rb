require 'rails_helper'

RSpec.describe TicketType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  require 'rails_helper'

  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:max_quantity) }
  it { should validate_presence_of(:name) }
end