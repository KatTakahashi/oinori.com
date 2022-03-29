class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :password_digest
      t.string :remember_token

      t.timestamps
    end
  end
end
