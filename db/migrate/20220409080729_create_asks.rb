class CreateAsks < ActiveRecord::Migration[5.2]
  def change
    create_table :asks do |t|
      t.string :body
      t.string :ip

      t.timestamps
    end
  end
end
