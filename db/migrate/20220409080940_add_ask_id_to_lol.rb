class AddAskIdToLol < ActiveRecord::Migration[5.2]
  def change
    add_column :lols, :ask_id, :integer
  end
end
