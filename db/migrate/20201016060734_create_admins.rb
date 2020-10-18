class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :admin
      t.string :user

      t.timestamps
    end
  end
end
