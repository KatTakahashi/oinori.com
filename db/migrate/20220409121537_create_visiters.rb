class CreateVisiters < ActiveRecord::Migration[5.2]
  def change
    create_table :visiters do |t|
      t.string :ip

      t.timestamps
    end
  end
end
