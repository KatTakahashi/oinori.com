class AddIpToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :ip, :string
  end
end
