class AddCreaterIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :creater_id, :integer
  end
end
